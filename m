Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4764CBAF54A
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8B910E686;
	Wed,  1 Oct 2025 06:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uq/4YVDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BAC10E685
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrgwdMkNw3urY45iIgqOTAB2MN9SToVnQU4qbC7CNbNFi8gSee/GdXpuwpugqDo1b4F2LXqhVO68e9UfaVDK6wXy4TQ+SaCQeWk+vAAHiOPDnfWD45DpU3vFQ9iUpGIUqVQriJD2tbqHH+nuiDCqDvOWkZQRmdA4PCvRLiUccu5FY00Fingt+wym7xJ0Q1bWKUyUvPLuOfxoU/M687UQsdgBt3klKAWWyZhXhw0vXUdk0KBFt94FoG3DPLlvoYnCvs+TnuP8PGPq5jqdYVjCnaWAdhcAWhS9UMqAcWxAlczjXEPtxgVngoAtDvF3emfvHkrcOKEDoWCut3jWCjbuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XigfTE9kFgchjsvKXVHaHK2WyVy+8UAVmn4vuI9u5wo=;
 b=tcHhpe6zrZmEjVmomdOLqaaEe70U5Kjh2BXUB+NcNmDeTaOIUa0d3R9lVzrbZQjUPWKvcM9TEb7H9c6iHhNjrUmbYawrEg2GsLqFDRIE4vzx/1R4JCbSaZF/CSzgTEsL8Pn9GmG5ogktGm0rgbsy0KNzrCDy3YAiqkWVnNslWspU9XNzPg48oYn+iIYexQRA8tZrvTXqcMDdI0id6lniqMG/o+4bNZwXleugpt405q3AXOVO46J5b2Fv86TdFzOFab8evkBQArmyABFelRwQToAppyNIQzwXkeXN6KSepKtlKzo6gz9CO0Rm7GNnqKIaTjcI/aQizNoV8sZ1s97IgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XigfTE9kFgchjsvKXVHaHK2WyVy+8UAVmn4vuI9u5wo=;
 b=uq/4YVDPIa3WCmjal6x8Z3UtGPK0ZLatAMfxWQ01+F8IZKUEAaNh7hoPrRJT3SuA8p+kYRKSAYPEO5UEid2Y/gp55qh7kgg8lQNGJcKgyY7Y8/zJ1hk6EqW1SHshLrtgH+NA/9V8XPXeLzpUxIGS79QcW61Jw9jUq8COoJrTJ4YzaWp+Z9m7AeibJ6QvgktmilU/TNLbsuodzOM1QCeCEsyEnOjTRrNKscd4AIe2OT/fJrd1yIe0VrCjaUlzIDgSN/x+ofOamtIMnnbIMMlho77+V4kRAtZxhadtzJe8WQx92YWJPPw+OQzTHqSgrBEzfMFFMG+5OGyghvTmJ37qVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:59:03 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:59:03 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Balbir Singh <balbirs@nvidia.com>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v7 16/16] gpu/drm/nouveau: enable THP support for GPU memory
 migration
Date: Wed,  1 Oct 2025 16:57:07 +1000
Message-ID: <20251001065707.920170-17-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::18) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 70971075-b7e3-4c8c-8851-08de00b80174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjI0UGtncm9tREZOdG9UN1dxR0tRRldLc0Y5TlJaQnhiQ1hPWVRtWGJFM3Jt?=
 =?utf-8?B?R0d4QnFyL2lRcE9qMGFWalRKRkNDZGJ1eVQwOGw0VnByUVlzTGpudGxWRW15?=
 =?utf-8?B?dDAxTjJHRnU3OE4zdnorUUV4MjVONVRFYW1iWmIyU3FVWmVmdE41UjRWeExW?=
 =?utf-8?B?cFdlQUFCSWxtekVvaC9QQXdMbzVvbHppMUVNSTFGRGhwdzFEU25weVZWbkNs?=
 =?utf-8?B?ZUdGQ3Vmb1pqaTVhSU52U1pqRWhkMTZBTmV0MWt4UWFKZjB1Wi9yZFFFc3lK?=
 =?utf-8?B?TU9VZWNpaGN3WVhYUG9NMVU5L2VyMkttWkgrQmJhdHlEUjNOUXNBZUpVSjg5?=
 =?utf-8?B?TFBZY21ZVmF0N0dtNEN3VGZvZHNvMGpkT2RzTHJBbVFqZEozWUpkVWF0ZVp4?=
 =?utf-8?B?MDRXZTgwNTYwc1BZczhHWWdWSUh1T0FkdVkwQXNTQlVmTXhDQkZuRHk4V3U5?=
 =?utf-8?B?Zmp2eERmY1VJQThHc1pQVUh4NzlCZ1FPQW5uMEg3a0gzMVlwSVlqSGxORUFF?=
 =?utf-8?B?K2Rzb2lQaUR2dVhyQlB0a3JicyttN0o4RVNYeVRZRkZVakt2anRDQkJyc2dl?=
 =?utf-8?B?Y0phMzRvTVhDL2xDNDd3TVpMVVVCSFhmTDdzd0pDdlYxaXFwWTdMdndQakJH?=
 =?utf-8?B?ZC92bk00MmhjdTQzYXRnTkFrOXFkclNLdU1Ja2R1RFRwKzAzcW5nOFlCRDZx?=
 =?utf-8?B?b1ZCUVlpOXN0Y296cHp5dUwrcUJuWjdIUjBMbDJ4QjJYTmhWMDVWRDc3QWFw?=
 =?utf-8?B?alRDSERWcEtPZGN0WVNYaE5PK0dxRnNwSElFUk1NVjMyM2MyUS8wTHN6Q0xC?=
 =?utf-8?B?VkcwN045QkJXMHZmZHN1L3FLQzFWbXJrV2grVk1uNmJydjhPVmh2Q29Xb2tQ?=
 =?utf-8?B?b0hqcERUK2NjVm1jbUUveTdaNVkxRkJ3OVpQSm9JT3h3Yy9TUmkwTmY2bGpY?=
 =?utf-8?B?cGxJd3lVZ0V3dWZYanlGZUhRNDRVZDhocDVSWkg5aFpyNTFLblFNVUxPbDQy?=
 =?utf-8?B?eXlZTm0xYUZ4eW0zZHdXU2Uxdjd6cXgwd0dqd0JDSW1yU01BTHYvc3JzeXNv?=
 =?utf-8?B?WlVoWUtFYWE3TEtUTlFqYzVNcGxSakluWDVEdTdsd0hoZnpFQkFIY1ZPNXJi?=
 =?utf-8?B?bVZPMEZrV3MzM3p4YUNpQ1JxQ1BiWFdiWDE3Rm1maWFtbzA3eHZHN01ub0Np?=
 =?utf-8?B?T21tQXdySjNqZUdOQXVnS3dvK1BOa3laaWcvYS9HZCt0dmtoZW9vNUZlekNZ?=
 =?utf-8?B?RFZtMHNGY3FxVmYyNzZ6KzlrV2JPREJ2Y0VtRVBTdWhXQkxlQmVpUDRadktR?=
 =?utf-8?B?UHZSSWpKUUNyRE1tT0wxMDUxUmNvdStRYUJkUkdhTm5yeU02OWgwZW40OWxz?=
 =?utf-8?B?OXhGejRQeWUvcEZpeDVlaHpLZWVxd3lxQ2Zsa3dFc0Y5bmJObVJNUTJRWDl3?=
 =?utf-8?B?ZmlTa1A4TEJZeFZWL0NRZ25jdTVUaGFjRUVCY2VaWU5nd0RSK0ZKYmZIYTFV?=
 =?utf-8?B?T05UVy9NRGplNTc3bVM3QkRYc1VkU1l4THNCTkFlMlh2ZGJVVHdnbW1qdDk5?=
 =?utf-8?B?SnkwMy9kS0xGZDQ4cWxPRHoxK0ZLdTl1WWpmRFRxcVkxNHFpSzYxMkxVb2N6?=
 =?utf-8?B?bVpHcW55eFQyMktEQ0g5SUxzRXNaZUhuTzRrQmlKdC9RRFJDYXhlaU1DUnRF?=
 =?utf-8?B?dVY1K2h0OVVqd2psZitybU9ORk4rS05BYS9zQXlkMUk3TWN3M21Va05nZGVs?=
 =?utf-8?B?eFJRNlR3TG5GUnR3R2ZrUG1LcXFXNjYvdGJISXRpS3BMQVUrWUpoemZiMkxF?=
 =?utf-8?B?UFNBdGpGbzQxc29ObDEydUJQMEFuSUNyb0Rpczg1VFl1MndDQ3I5OE9ZQTdt?=
 =?utf-8?B?VWRKeUZDOW9ycUZWc3lUQUwxd09XcTRkMlNHb3VkTkJxNEc5RkV1TEljbzF4?=
 =?utf-8?Q?onJ40qg4s9vuZg51rZTFpCcwkwzIZGSe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkU3OGNwSGpoMldsanlQbXIwQjRuKzkyVktISEdld28ycitQWE10K3BVRWps?=
 =?utf-8?B?NzNTVVpyTU53Qms3aHYxcWZMZDB2d1lGQ01ZK0Z1c0RLeitMaDllSUZwT1cx?=
 =?utf-8?B?UW1JeFU2a0RKMjAvMlR1Y3Rwc2R4SWVQdXFJcDMrWFFJbENXSkhjV3U3RHJ2?=
 =?utf-8?B?VVRMLzA1YUppeTlTR0xERmYxOG1FS2xTYUNaZ2daMjBGUW5NRmRaTDNzZEgx?=
 =?utf-8?B?ZEg4ZWRZaURVc2FtaitkR09rTU5GcVRESGt0S29sMVdhVm5UemF6Mk9ZN3dQ?=
 =?utf-8?B?T2dXbUFTODlnRlRMWHdUOEt1NnJTWW1mZ1REdHNLYm52MmUrMlBQdDY0bDNh?=
 =?utf-8?B?OERBT0tLZm9iOCtHL3N4dkFicElKaEtpd0ljQzNScWdnV1hjWmw2WElkVTV3?=
 =?utf-8?B?aWhabHI5a3ZwcVUrdElWYmhxYWZ3ZWhVb2xCc25MMGJtL3VscWJscTZ6Zi9G?=
 =?utf-8?B?NzArKytiS21oRnljWUFnUUVRQnM3eFhETzVFZjNvTHVoWEd6ZUlsTk5QSzBS?=
 =?utf-8?B?VTVERjMzWWxNaStabHZNUThQRmlGZ1hBVTBPcGl6Y25hQ1VCL0V0WFdYQmoz?=
 =?utf-8?B?ZWZocTNtcjlJSjh1TTJVNUJhakY0S1Badmdzbmp0VjhMWWdIc2IvV0pJbGIx?=
 =?utf-8?B?b050WHV4QmVobWFQbmEvQ2V0YWxFN1hUczNGL29JeDAweDdPMHpEQk1xSjNF?=
 =?utf-8?B?L0JVMUhablVtK0FnMDRXcHhHRGREV1ZYNnJqelpYTTNOcE5Wby9xLytic3Rp?=
 =?utf-8?B?TUlBLzBpUVhlZHNyMmFBMmo0YWd2OUpMNEtMVmRkZlZ0TVZrd3dwU0NlRGxP?=
 =?utf-8?B?SHA0dnpHSE05UWtTYWxpMW1pTGVHc3J2T0tKUVc4SjYwU3hmRjdzWWs2WjBm?=
 =?utf-8?B?L1MvVHRWVkRkd3VYemVHdUVWTHltSEp4Z0dEc2JIeU9US003SEVDcFlrRWdS?=
 =?utf-8?B?cXEvK3MyRFNWNjFVODNDbzd5NDlSL3JYc2xOZUxCcGFNTzJyV1VIYzBjQWZW?=
 =?utf-8?B?a016MzhuL0FjeTlpeWF2K0FrNlg2UTJjRjExeGttem0rTXAwY1ZNK0ZyYWpP?=
 =?utf-8?B?MDN3V0JySnBaU3lGYm9ISnhFMTVwZ0x1OFpiTnZJdWdEbjdWZktSandHQlhh?=
 =?utf-8?B?eHdaWDFpYitWYjVPVEU4R2Uvc3dYTTEwWWFKeTF5UWVnT2hTM1hPRnRsQ2Qw?=
 =?utf-8?B?NVcrTWVnbFFqYS91SVJqNzVjSGI4bVFkMS9TeG5TTS9rOGYyWkJHNVQ5c1Rl?=
 =?utf-8?B?UDFDOHMvbTdxOWFpYXpZQStBVlk5U0l1THltSDNkUm5oRGo5b3dPQ0h1eStD?=
 =?utf-8?B?aUlNdEMrNFNMVmRkSWtTOG1Ja0FjYTBzUWIwQlQ1S3ZVMTFaSTlwM0xialpZ?=
 =?utf-8?B?cGRQU2tMYWVMR3BoTDlBRDVjeVNvV0QwU2pOWDAydUkxV0N6cmlKZGdBQTAx?=
 =?utf-8?B?YWkrVC9GOHNqRFZmc2c0NjB1a3ZsUGYyRVRXRkZzb1E3U3RLTWhpbXM0d1J0?=
 =?utf-8?B?VWtYbDY2YWY5Sy9WQ3lCdk5YeHlzVFlQb21idzNRQVhET0R2M0xqbExKMmVj?=
 =?utf-8?B?Z2ZqZWVXL0c3VmtJTmZyVTd1dlhsdEhScUgxTXVFYUlHaFR0c2FvbUphR1Fw?=
 =?utf-8?B?Z1MzMnUyR2ZOd29FWXZoeDFSSnZacDYyV210aFJ3VXVveEJDMkhtdkljZWdr?=
 =?utf-8?B?TkthdjFxcGZPcjFCN21YTExVRE1QQ0RLcXFiL3ZGaXBVRWdTblhmeUJ4dFhL?=
 =?utf-8?B?Slp1L3paUVRPZCtyb2hNRHVBb254a3IyLzFwNHpkYy9KdGZjQi83cWVzOGNz?=
 =?utf-8?B?MFdwMlFTRnp2V0NSS0ZNVUlhKys4VFVHN0piUFFMbDZkamQ1WGk1N3lUdUU3?=
 =?utf-8?B?MFVIUWJRQWVyWmpLaGtVaDRhbnRLVmluUVphT2FuMzBBUkFIMXlPaEZTeGlu?=
 =?utf-8?B?L3ZVYU5ObnhtdkNUQXNMb0ozVWdSbDhad0wycEpUcSt1MUJxb1VUMldtRWQr?=
 =?utf-8?B?clB2aGpialJLaFpMd3JwSlN5Vm5EdVdnWVRNNVAzM2IwWmkwdkttRXpnajFH?=
 =?utf-8?B?eTJ2RWcyc1VLSU9ORklQcGVVSU5RVUFpYmVsV1BYd3pGU04vL3A1akV3T3Jw?=
 =?utf-8?B?MExKR0M2eUtNVTYrbDZLbzlhdUhybkdXRHpkMjBnZWZGb0YyM3VrSW5RMmdG?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70971075-b7e3-4c8c-8851-08de00b80174
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:59:03.4870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5gpp2RA2sSpMg8XUEwONPdHJjemw6OGrm70/jjC6JDuUBB6cBNntI3YZM+78vT+S7ZWi3dAGv67L63x6lbjeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable MIGRATE_VMA_SELECT_COMPOUND support in nouveau driver to take
advantage of THP zone device migration capabilities.

Update migration and eviction code paths to handle compound page sizes
appropriately, improving memory bandwidth utilization and reducing
migration overhead for large GPU memory allocations.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 303 ++++++++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 3 files changed, 229 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index d34288ebe7d2..244812e7dd69 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -50,6 +50,7 @@
  */
 #define DMEM_CHUNK_SIZE (2UL << 20)
 #define DMEM_CHUNK_NPAGES (DMEM_CHUNK_SIZE >> PAGE_SHIFT)
+#define NR_CHUNKS (128)
 
 enum nouveau_aper {
 	NOUVEAU_APER_VIRT,
@@ -83,9 +84,15 @@ struct nouveau_dmem {
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
+	struct folio *free_folios;
 	spinlock_t lock;
 };
 
+struct nouveau_dmem_dma_info {
+	dma_addr_t dma_addr;
+	size_t size;
+};
+
 static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
 {
 	return container_of(page_pgmap(page), struct nouveau_dmem_chunk,
@@ -115,8 +122,13 @@ static void nouveau_dmem_folio_free(struct folio *folio)
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	if (folio_order(folio)) {
+		page->zone_device_data = dmem->free_folios;
+		dmem->free_folios = folio;
+	} else {
+		page->zone_device_data = dmem->free_pages;
+		dmem->free_pages = page;
+	}
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -140,20 +152,28 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 	}
 }
 
-static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
-				struct page *dpage, dma_addr_t *dma_addr)
+static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
+				   struct folio *sfolio, struct folio *dfolio,
+				   struct nouveau_dmem_dma_info *dma_info)
 {
 	struct device *dev = drm->dev->dev;
+	struct page *dpage = folio_page(dfolio, 0);
+	struct page *spage = folio_page(sfolio, 0);
 
-	lock_page(dpage);
+	folio_lock(dfolio);
 
-	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dev, *dma_addr))
+	dma_info->dma_addr = dma_map_page(dev, dpage, 0, page_size(dpage),
+					DMA_BIDIRECTIONAL);
+	dma_info->size = page_size(dpage);
+	if (dma_mapping_error(dev, dma_info->dma_addr))
 		return -EIO;
 
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-					 NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage))) {
-		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(sfolio),
+					 NOUVEAU_APER_HOST, dma_info->dma_addr,
+					 NOUVEAU_APER_VRAM,
+					 nouveau_dmem_page_addr(spage))) {
+		dma_unmap_page(dev, dma_info->dma_addr, page_size(dpage),
+					DMA_BIDIRECTIONAL);
 		return -EIO;
 	}
 
@@ -166,21 +186,47 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
 	struct nouveau_svmm *svmm;
-	struct page *spage, *dpage;
-	unsigned long src = 0, dst = 0;
-	dma_addr_t dma_addr = 0;
+	struct page *dpage;
 	vm_fault_t ret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
-		.start		= vmf->address,
-		.end		= vmf->address + PAGE_SIZE,
-		.src		= &src,
-		.dst		= &dst,
 		.pgmap_owner	= drm->dev,
 		.fault_page	= vmf->page,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+				  MIGRATE_VMA_SELECT_COMPOUND,
+		.src = NULL,
+		.dst = NULL,
 	};
+	unsigned int order, nr;
+	struct folio *sfolio, *dfolio;
+	struct nouveau_dmem_dma_info dma_info;
+
+	sfolio = page_folio(vmf->page);
+	order = folio_order(sfolio);
+	nr = 1 << order;
+
+	/*
+	 * Handle partial unmap faults, where the folio is large, but
+	 * the pmd is split.
+	 */
+	if (vmf->pte) {
+		order = 0;
+		nr = 1;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
 
+	args.start = ALIGN_DOWN(vmf->address, (PAGE_SIZE << order));
+	args.vma = vmf->vma;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
+
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
 	/*
 	 * FIXME what we really want is to find some heuristic to migrate more
 	 * than just one page on CPU fault. When such fault happens it is very
@@ -191,20 +237,26 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!args.cpages)
 		return 0;
 
-	spage = migrate_pfn_to_page(src);
-	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
-		goto done;
-
-	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
-	if (!dpage)
+	if (order)
+		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
+					order, vmf->vma, vmf->address), 0);
+	else
+		dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma,
+					vmf->address);
+	if (!dpage) {
+		ret = VM_FAULT_OOM;
 		goto done;
+	}
 
-	dst = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	if (order)
+		args.dst[0] |= MIGRATE_PFN_COMPOUND;
+	dfolio = page_folio(dpage);
 
-	svmm = spage->zone_device_data;
+	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
+	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
 	if (ret) {
 		ret = VM_FAULT_SIGBUS;
@@ -214,25 +266,40 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	nouveau_fence_new(&fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(drm->dev->dev, dma_info.dma_addr, PAGE_SIZE,
+				DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
+err:
+	kfree(args.src);
+	kfree(args.dst);
 	return ret;
 }
 
+static void nouveau_dmem_folio_split(struct folio *head, struct folio *tail)
+{
+	if (tail == NULL)
+		return;
+	tail->pgmap = head->pgmap;
+	tail->mapping = head->mapping;
+	folio_set_zone_device_data(tail, folio_zone_device_data(head));
+}
+
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.folio_free		= nouveau_dmem_folio_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.folio_split		= nouveau_dmem_folio_split,
 };
 
 static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
+			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
 	struct page *page;
 	void *ptr;
-	unsigned long i, pfn_first;
+	unsigned long i, pfn_first, pfn;
 	int ret;
 
 	chunk = kzalloc(sizeof(*chunk), GFP_KERNEL);
@@ -242,7 +309,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	}
 
 	/* Allocate unused physical address space for device private pages. */
-	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE,
+	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE * NR_CHUNKS,
 				      "nouveau_dmem");
 	if (IS_ERR(res)) {
 		ret = PTR_ERR(res);
@@ -275,16 +342,40 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
-	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
+
+	pfn = pfn_first;
+	for (i = 0; i < NR_CHUNKS; i++) {
+		int j;
+
+		if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
+			for (j = 0; j < DMEM_CHUNK_NPAGES - 1; j++, pfn++) {
+				page = pfn_to_page(pfn);
+				page->zone_device_data = drm->dmem->free_pages;
+				drm->dmem->free_pages = page;
+			}
+		} else {
+			page = pfn_to_page(pfn);
+			page->zone_device_data = drm->dmem->free_folios;
+			drm->dmem->free_folios = page_folio(page);
+			pfn += DMEM_CHUNK_NPAGES;
+		}
 	}
-	*ppage = page;
+
+	/* Move to next page */
+	if (is_large) {
+		*ppage = &drm->dmem->free_folios->page;
+		drm->dmem->free_folios = (*ppage)->zone_device_data;
+	} else {
+		*ppage = drm->dmem->free_pages;
+		drm->dmem->free_pages = (*ppage)->zone_device_data;
+	}
+
 	chunk->callocated++;
 	spin_unlock(&drm->dmem->lock);
 
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
-		DMEM_CHUNK_SIZE >> 20);
+	NV_INFO(drm, "DMEM: registered %ldMB of %sdevice memory %lx %lx\n",
+		NR_CHUNKS * DMEM_CHUNK_SIZE >> 20, is_large ? "THP " : "", pfn_first,
+		nouveau_dmem_page_addr(page));
 
 	return 0;
 
@@ -299,27 +390,41 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 }
 
 static struct page *
-nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
+nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct page *page = NULL;
+	struct folio *folio = NULL;
 	int ret;
+	unsigned int order = 0;
 
 	spin_lock(&drm->dmem->lock);
-	if (drm->dmem->free_pages) {
+	if (is_large && drm->dmem->free_folios) {
+		folio = drm->dmem->free_folios;
+		page = &folio->page;
+		drm->dmem->free_folios = page->zone_device_data;
+		chunk = nouveau_page_to_chunk(&folio->page);
+		chunk->callocated++;
+		spin_unlock(&drm->dmem->lock);
+		order = ilog2(DMEM_CHUNK_NPAGES);
+	} else if (!is_large && drm->dmem->free_pages) {
 		page = drm->dmem->free_pages;
 		drm->dmem->free_pages = page->zone_device_data;
 		chunk = nouveau_page_to_chunk(page);
 		chunk->callocated++;
 		spin_unlock(&drm->dmem->lock);
+		folio = page_folio(page);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, &page, is_large);
 		if (ret)
 			return NULL;
+		folio = page_folio(page);
+		if (is_large)
+			order = ilog2(DMEM_CHUNK_NPAGES);
 	}
 
-	zone_device_page_init(page, 0);
+	zone_device_folio_init(folio, order);
 	return page;
 }
 
@@ -370,12 +475,12 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 {
 	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
 	unsigned long *src_pfns, *dst_pfns;
-	dma_addr_t *dma_addrs;
+	struct nouveau_dmem_dma_info *dma_info;
 	struct nouveau_fence *fence;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
-	dma_addrs = kvcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);
+	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
 			npages);
@@ -383,17 +488,28 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
 			struct page *dpage;
+			struct folio *folio = page_folio(
+				migrate_pfn_to_page(src_pfns[i]));
+			unsigned int order = folio_order(folio);
+
+			if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+				dpage = folio_page(
+						folio_alloc(
+						GFP_HIGHUSER_MOVABLE, order), 0);
+			} else {
+				/*
+				 * _GFP_NOFAIL because the GPU is going away and there
+				 * is nothing sensible we can do if we can't copy the
+				 * data back.
+				 */
+				dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
+			}
 
-			/*
-			 * _GFP_NOFAIL because the GPU is going away and there
-			 * is nothing sensible we can do if we can't copy the
-			 * data back.
-			 */
-			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
 			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
-			nouveau_dmem_copy_one(chunk->drm,
-					migrate_pfn_to_page(src_pfns[i]), dpage,
-					&dma_addrs[i]);
+			nouveau_dmem_copy_folio(chunk->drm,
+				page_folio(migrate_pfn_to_page(src_pfns[i])),
+				page_folio(dpage),
+				&dma_info[i]);
 		}
 	}
 
@@ -404,8 +520,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	kvfree(src_pfns);
 	kvfree(dst_pfns);
 	for (i = 0; i < npages; i++)
-		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
-	kvfree(dma_addrs);
+		dma_unmap_page(chunk->drm->dev->dev, dma_info[i].dma_addr,
+				dma_info[i].size, DMA_BIDIRECTIONAL);
+	kvfree(dma_info);
 }
 
 void
@@ -608,31 +725,36 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
-		dma_addr_t *dma_addr, u64 *pfn)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfn)
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
 	unsigned long paddr;
+	bool is_large = false;
+	unsigned long mpfn;
 
 	spage = migrate_pfn_to_page(src);
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
 
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	is_large = src & MIGRATE_PFN_COMPOUND;
+	dpage = nouveau_dmem_page_alloc_locked(drm, is_large);
 	if (!dpage)
 		goto out;
 
 	paddr = nouveau_dmem_page_addr(dpage);
 	if (spage) {
-		*dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
+		dma_info->dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
 					 DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(dev, *dma_addr))
+		dma_info->size = page_size(spage);
+		if (dma_mapping_error(dev, dma_info->dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, 1,
-			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
+		if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(page_folio(spage)),
+			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST,
+			dma_info->dma_addr))
 			goto out_dma_unmap;
 	} else {
-		*dma_addr = DMA_MAPPING_ERROR;
+		dma_info->dma_addr = DMA_MAPPING_ERROR;
 		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))
 			goto out_free_page;
@@ -643,10 +765,13 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	return migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn(page_to_pfn(dpage));
+	if (folio_order(page_folio(dpage)))
+		mpfn |= MIGRATE_PFN_COMPOUND;
+	return mpfn;
 
 out_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, dma_info->dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
@@ -656,27 +781,38 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 
 static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,
-		dma_addr_t *dma_addrs, u64 *pfns)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfns)
 {
 	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned long order = 0;
+
+	for (i = 0; addr < args->end; ) {
+		struct folio *folio;
 
-	for (i = 0; addr < args->end; i++) {
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
-				args->src[i], dma_addrs + nr_dma, pfns + i);
-		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
+				args->src[i], dma_info + nr_dma, pfns + i);
+		if (!args->dst[i]) {
+			i++;
+			addr += PAGE_SIZE;
+			continue;
+		}
+		if (!dma_mapping_error(drm->dev->dev, dma_info[nr_dma].dma_addr))
 			nr_dma++;
-		addr += PAGE_SIZE;
+		folio = page_folio(migrate_pfn_to_page(args->dst[i]));
+		order = folio_order(folio);
+		i += 1 << order;
+		addr += (1 << order) * PAGE_SIZE;
 	}
 
 	nouveau_fence_new(&fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i, order);
 
 	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-				DMA_BIDIRECTIONAL);
+		dma_unmap_page(drm->dev->dev, dma_info[nr_dma].dma_addr,
+				dma_info[nr_dma].size, DMA_BIDIRECTIONAL);
 	}
 	migrate_vma_finalize(args);
 }
@@ -689,20 +825,27 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			 unsigned long end)
 {
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
-	unsigned long max = min(SG_MAX_SINGLE_ALLOC, npages);
-	dma_addr_t *dma_addrs;
+	unsigned long max = npages;
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
 		.pgmap_owner	= drm->dev,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM
+				  | MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i;
 	u64 *pfns;
 	int ret = -ENOMEM;
+	struct nouveau_dmem_dma_info *dma_info;
 
-	if (drm->dmem == NULL)
-		return -ENODEV;
+	if (drm->dmem == NULL) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		if (max > (unsigned long)HPAGE_PMD_NR)
+			max = (unsigned long)HPAGE_PMD_NR;
 
 	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
@@ -711,8 +854,8 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	if (!args.dst)
 		goto out_free_src;
 
-	dma_addrs = kmalloc_array(max, sizeof(*dma_addrs), GFP_KERNEL);
-	if (!dma_addrs)
+	dma_info = kmalloc_array(max, sizeof(*dma_info), GFP_KERNEL);
+	if (!dma_info)
 		goto out_free_dst;
 
 	pfns = nouveau_pfns_alloc(max);
@@ -730,7 +873,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			goto out_free_pfns;
 
 		if (args.cpages)
-			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_addrs,
+			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_info,
 						   pfns);
 		args.start = args.end;
 	}
@@ -739,7 +882,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 out_free_pfns:
 	nouveau_pfns_free(pfns);
 out_free_dma:
-	kfree(dma_addrs);
+	kfree(dma_info);
 out_free_dst:
 	kfree(args.dst);
 out_free_src:
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 6fa387da0637..b8a3378154d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -921,12 +921,14 @@ nouveau_pfns_free(u64 *pfns)
 
 void
 nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		 unsigned long addr, u64 *pfns, unsigned long npages)
+		 unsigned long addr, u64 *pfns, unsigned long npages,
+		 unsigned int page_shift)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 
 	args->p.addr = addr;
-	args->p.size = npages << PAGE_SHIFT;
+	args->p.size = npages << page_shift;
+	args->p.page = page_shift;
 
 	mutex_lock(&svmm->mutex);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index e7d63d7f0c2d..3fd78662f17e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -33,7 +33,8 @@ void nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit);
 u64 *nouveau_pfns_alloc(unsigned long npages);
 void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		      unsigned long addr, u64 *pfns, unsigned long npages);
+		      unsigned long addr, u64 *pfns, unsigned long npages,
+		      unsigned int page_shift);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_svm_init(struct nouveau_drm *drm) {}
 static inline void nouveau_svm_fini(struct nouveau_drm *drm) {}
-- 
2.51.0

