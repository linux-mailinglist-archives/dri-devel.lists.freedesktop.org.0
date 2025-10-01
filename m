Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC9ABAF504
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B997710E065;
	Wed,  1 Oct 2025 06:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V2nTBVIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011034.outbound.protection.outlook.com [40.107.208.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5261410E065
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:58:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJiTlSZg/GTmYSRnxlxASONifr1inrBWrLfleot81NHZILy+LX3KUtVBfb9nvL2Hx+GmUMP0mGQg3s3NMZUojqwJrDSzR0BPFPbOHGNoEj6sIVy3wtcweuZTmAEFf5+I+y2gsUlLbGnBKQqQml0Bq+Y1jfAr9w+dsmQQfAMUMw9zS8fJsXBhUNNse3S2kMxS6darHUDXfoiQwi0w5OZDWbkQ9Bfp/xIUh9YeSN5Zm/NLO8GGLbUDJNjKpxU2wPzAPv32+tvRqzaowerZPh3tLz9jsRvUZ3anIj7FCF1TE5haYdJQI2lbakk/ErMHuEcHm2Hw74/2GKGatfkT5rcp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESvJ9yWzgtIGhDmVggslx+MRqTHahxlKr7sl+ycSMyY=;
 b=oTqRZ5AdBlrq8eMBFnCLWH0ysJNbIJ8Jt4UMokUn0QWi+3KbDMrl7NHws+A6ly5PtScoqncOUq569G5JPjB5yCOMeKsiwv/3Opxf02qr3IpsEq1dhLL5FG4cviaFWPNMwjbrrcszUzCTddyBay6j13OEcqGfUJrA2htQ/Wi7aUdQ6zhV+ZkxRgdpmsrKBnpoJOJ80ISBMPy4X1wFZRzP49ww6gwlJrp/AS392SSZZxM9A3+nxmUKvIICPOJuiAncK6VZg1w+oi3Uu/Fqd/eV3RSv51om9+23W6Fdhvc9BYlixkMuAiOejl70KAMUVuWitB4bcUOUqfQ2Bk+5juDMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESvJ9yWzgtIGhDmVggslx+MRqTHahxlKr7sl+ycSMyY=;
 b=V2nTBVINBA7bEIGkI2qWY5iyDHv+TXYGnJN2tPxaqC+Yb8HntQXSNtRs3FqzBqeK6zdyis1+bA41OzMcwzEpNeJ43VZfPvX0eKJbzGygkcoMsacb2iAjmBMgXDPuhHwQkIYnDxk2BguMv0ja1AmguCupNCPNxUn+PqpIOUR2Q5v8SJ/QZXuKCxTP66CYPJM9yl52U6TwKOXIO8jrVED49Ma265ehx4xfCTdvidBleCov+nWyS9qPbG6RdJj21DexRY/9epU1jAZL0PWM43gLJRelcMYSnxi9VIZm+6oVG+bI1/uQYYY5pM6ihi7KMynmbMvh6roP8KTPWZJm0wF0rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:00 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:57:59 +0000
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
Subject: [v7 00/16] mm: support device-private THP
Date: Wed,  1 Oct 2025 16:56:51 +1000
Message-ID: <20251001065707.920170-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P300CA0099.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:248::10) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 88817a06-162a-4d2a-b5a8-08de00b7db5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3RjNU9XQnlaTURvUUtGZjZEd2d4Uy91L1UzSFo3dlZzNjFGQmxvcnM3UGlX?=
 =?utf-8?B?Y2Z6YjdrNVJ6bkNCbnNVR3FoaVNtcEphZlRZZFJLZEZYYW1YbytKdnFRd05k?=
 =?utf-8?B?Vk4wV2FYY2REQUdSZDJnZ0lJeHZ6MHZ1bjhlaCtDQ3N1WU5SbHRxTnFNS0xj?=
 =?utf-8?B?Q1I1RndWM2x0UlVnRWNpQXNsNkkyQUloNXVjS0lzMm1aNmgrRlp3WU1Bdzhv?=
 =?utf-8?B?OW5WQ1VPWU8vTTkza3V4RTJOT0tNcHFDZTJLTTdvWTdWR2lPZ1lZYndlNGxV?=
 =?utf-8?B?SVZVTkhaNW43QXgxZ2orZ2dKeU15ODZBUVlMZDlWUWxSTVZnMUxMRmF0Q1FU?=
 =?utf-8?B?Wi82SWFna3liaG1TRjVxRnFaUEJzc2cxTnJDQVBFMUwrb3NWMkJ3czh0aUNT?=
 =?utf-8?B?VkJXbTBUWHg5Ym01N2h0c25DdUZvU1VTUTBBUTY0cHdmQWRsWTkvd2tkMDNm?=
 =?utf-8?B?ZGtoRWlSV001NCtlK0FrWnNpd1JYRjdMeXBlYmJWU3ViejZUaEhORFdLb0dB?=
 =?utf-8?B?VTYrRGMzWFB3ZEpuZjAxRERIcjhabmtsS2NyL2V2ZDJJd1Q5NmJrek5acHlF?=
 =?utf-8?B?elV5TW1Wc0JiZjkxdlpBTndiTVRQTjhoZERobmVvQXdSNW13c2JwemFzVjhZ?=
 =?utf-8?B?cGYvc0MwQ1FWRTRjWmpHaWhPVlRad3lXUUpzTGZpREh6K09DRHhSTFN2bUVH?=
 =?utf-8?B?b1R0S1ltVnlZRUlQK2xjcGtWczBFT2J4NXlZcVdrL2pWNDM5cWloMFBudjE2?=
 =?utf-8?B?UjQxRnNrQWdLOUoweWVwNnliVGRGTzFxdjZBSm96TUdHN2NhZW1YZm5WaFo3?=
 =?utf-8?B?V3hkckNnZy9MWGI2OTlSYlQ1K1NqaVYycURwV01SNDNDcFpUTWVqZmZxNXFq?=
 =?utf-8?B?YzFUY2czRFJieWZPN0x5SG1vMTJkL0U5Yjk1OGJaZEVPNjJLSGphK2tkVDBv?=
 =?utf-8?B?Z1F0VWxzVmlSMVhVdEIyYzVHbGkxVWVzcEhLOHNOQWZvbE1jdGFpL2JoWUdT?=
 =?utf-8?B?elpmRWZYQ3NKVitQMHVDTXZvYW9hZE5TNlJ5NEJsSkVVMFZRQXlPM2cwODAr?=
 =?utf-8?B?bUdzK29SZzhZWVZpdllsS1RJWDlMUWd4ZEw2c1ZVd1NlN0dnMy9qaVpQRW9M?=
 =?utf-8?B?OGg4Nk5odllXYzRBaGVRSUd5dFVwNDBvRmVqQ3R6eUc1NDI4QktDOTBaakIv?=
 =?utf-8?B?NWlvR3pnQkFkK0wvK3AwZGRlbEZEUkpoSE14QVlmM3J4VEQvWmo5d2c0TWJY?=
 =?utf-8?B?VmQ4R0VCazQya2RtWDRyVFI3dUgwbWVKM3lpcldDUkdKczhkYmtUR3J4Myth?=
 =?utf-8?B?emd3WWJVb1NJSFdzL1dtQTQ3YUN1VjlxRzZobExyRTNvNnM1aVBLWmRhK3I3?=
 =?utf-8?B?eXZJb2tVaTVveWZ6Y2c2THZyTXNxM1pnbVEwUDgzM3h2VkNvYnRucnJycWhX?=
 =?utf-8?B?MXlXNTRRRG1tWkd2a3Z5SFFmemlENjJVdmNJWUU2Y05IeU4vblNUdnNzL2Ur?=
 =?utf-8?B?eHZCcGdHdnh2OHV6NlNlRGdsQ2dyTzRyWlRGYklzYWRMaTJrNFNMK2Irb1l3?=
 =?utf-8?B?VTZRcEI4cmlyZUpJNUdRZjdqcmI5dTV0UEk5M29qL3NQc3RTSWRIekZOa0xY?=
 =?utf-8?B?SDJtYzZDeWI5c0dDa1J2VnlmMUZhb3NNMTBTaS8ybVNYaEswT3QzOEs2cXR2?=
 =?utf-8?B?aE12TFAwVzR3T0l6UVZoemFMYjhRMTVqWFlmd21NS1BacUNJamNFTUQ5WHpI?=
 =?utf-8?B?b2RBZi94UDRNS0NGVU1YdDdyWWRPV0xCYzd6R21kZnhKWFpFdmszdGcxanNy?=
 =?utf-8?B?RkZXMVdkSHp0SWQ4cDhscFl4T1NodTdRb2V2c2lmY0pQU3JVRGJINFBIWkVP?=
 =?utf-8?B?eHhXeVBOaXRGOGhPNG9WWWtzdGg2UUZxcHREUzhOeGI5RE80TSszb2FHNWxn?=
 =?utf-8?B?UWVpcmxTaDc0R01OWmU3MEYxKzR6b1BUdzI3cE0zdXNOWTBHKzRqM3NKeXNZ?=
 =?utf-8?B?UFlaaUVtOEpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtBVzBIT3FyRVpkUG9oQ3NWY3JZLzRvdXIwT0JDNFpmVjB6eU5OZ1NVMXNZ?=
 =?utf-8?B?THN3ZDhaU3I4dks5M0ZBQWF2ZG1wN2srMmNpSzJ5QXFCbGVHeDd2S2NkZnNV?=
 =?utf-8?B?R1ZwVWN2M1l1dDRSdnUyYllxYjN1ZXZNazc3ejZMMjRxR0Q4V1crV3BKRFNK?=
 =?utf-8?B?cnNLTGdiNmJIdElqRWVWdlNxYmNRRTlMQS8yTVZ4UHNQTXUwM1d6aVhIc2Yv?=
 =?utf-8?B?RDgydnBSRDNGNTd0emV6TXhDNHZCTVFNUlBjOVk1b0JpYURZQmpvZ3RhRmZh?=
 =?utf-8?B?NDZadUY3N0JtZGNmbFRVZ3IrZjdOUXBIRHU5ZG1jU3NyTnR1dWhZSE1abFFz?=
 =?utf-8?B?TTlUYndkMnY4Y000U2VqelJydkNXZ1VRTFJrMTlmVGFQS2w1OEpxMWVWb1VZ?=
 =?utf-8?B?M2RzWVBueUR5Z3pHYlBDS0l6Z2VJY1pYaXdLMFdtU1d3K0k3dGV0a294OS9p?=
 =?utf-8?B?ak1KYlo1YTE3TFNuOGlGcnN4dVIwa0luT1lBZTJUQ3Q3MTRtaTcrUGZoa1Zz?=
 =?utf-8?B?d1lsTURFcjF6UzhPQUoyLzI4ZHA0REhMR2VEM3UxVzBjSjhCOEgvT1o1TlF4?=
 =?utf-8?B?ZTJNNFlxa083U1I3Y2lsbW5aWEJGbSsrTmphNW45YXFiTU01THRQL2hvY1Fm?=
 =?utf-8?B?eUdQRTZSRVF3ekYwRjVVa2FJeU9ISEh0SEU0YjMxVmVRMjZuTXd3YmhseGNH?=
 =?utf-8?B?MVZTYVk4Zk9aMHBjL3JTbmM4SHZuNTNlc1pNSUpWVlgzYzhnanlCTVNqalRH?=
 =?utf-8?B?M1BiblJ1OC9EMWRteTBZajA3bGgzMmtrRjlQZzFJMGJSOHcrSDRER0pXdGVi?=
 =?utf-8?B?Q1FvUW1sWXdYU1RnUnpESHhTWnFIRzFjNTNBR0ZjY2Z3NHl0OFJPdUdqVVFp?=
 =?utf-8?B?VGovQVdXb3QxRGZZaitQWE5QNm1mSjF4M0kxWE1GbE9iYXBjL0tmckcyNEps?=
 =?utf-8?B?b3phbzJhUlI4WHpwZi9lbm52N2k1WGFGcC9YejA4Z09seDlYdlZxWGxwbE9w?=
 =?utf-8?B?cDNlTFZvT1JoRU9zem5RZGcyY1VYNEY0WG11bmtqVnIvS1cvQ0V0YmdncEJB?=
 =?utf-8?B?YWVBNUV2NkhzWFBHcjZ0OUJLTFFjOTAzdFZ5MkhuVHoreHRjS2JzVXNnZUQ1?=
 =?utf-8?B?NW1janBNbDZTaEdGMjcxQ1ZxdXNXMStoNE5YMlVtT2tpNExqRFdSNGdRMTUy?=
 =?utf-8?B?NVcxSFRJVkljQ3FjbW9QNHYwaHlWdnFSQ0pkV2U5RS9URVF3SmREbzlIZjBj?=
 =?utf-8?B?R1RCZVk2eGVkaklHVDNqRXJjV2dhdEdFMW16SUNrTmQvYUtWZnkwME1ra05F?=
 =?utf-8?B?NHdqR0RDeDBBblVpeGh2WEpoa3BtRHBvWHY4R2gxSHpWQWRJcjA0ZGRoV01P?=
 =?utf-8?B?dncxcHNkNTlRR1ROMTRmdFlYUk9aYWp5Z3pYSTdJVDdXWU1KeUM1WTJoOW5u?=
 =?utf-8?B?YndiREJ1c3E3SlFrdElFRGRMQmdrcExySXYzT3FwTkd2bXpwSUtkck1ZT1Ey?=
 =?utf-8?B?djUrZlJJd1BqK25YUWVkVkpqcWliL2d4WkNNMGhQSHA1SlBZUHl6Ry9ydHhz?=
 =?utf-8?B?cjBGU3ZBaDlDckluL1lWMHl4eDY0WWtLVXVJeEIzR2NSaFpkZm1oeHQwSGQw?=
 =?utf-8?B?S0l4WHZra3Z2cmM3aWxxWS8yNlYyQnAwS2FjdDZBSzFESFZGNUF0WkdaVEFx?=
 =?utf-8?B?RjZFMFVWb05sQndXV1lwWE1Ea3p5QzI4YUY0MlFhWHRneDJwbU1jYWo3T2RG?=
 =?utf-8?B?enlLc24ybDNMR0gxUGs5REpIaXZUVTJDbloxL0k0TUM3d2JWQnZGOE5ZMFZh?=
 =?utf-8?B?eW5xL2JwaXA3Y244STRHeDNPb1J2RXMyT25TdDR4VUNmOWxPc3ZqUTVNU2lN?=
 =?utf-8?B?R0YzY0VVdEdRM0RZclFhQVVYV1BWMFhnSWhOMkFoK2VPN2xLdXozS2YwcWFr?=
 =?utf-8?B?cUpUZlI2MTFKV1laeXk5WFdLV1UwNXEyV2EzM1pLYko4SytyQW1IcytBSWJx?=
 =?utf-8?B?N3JRYjdISTc5eTd0QzVVYjYraUk2VGdqU2hqMW9TUmlsK09TMXlJSlZzVGsv?=
 =?utf-8?B?cEF5RDR2L3FWdVVZMG84aTNmb1h0RjZyek9VNHBkZW1yMjZFVTJZYUp2dzNR?=
 =?utf-8?B?MjZ5RzBpMjNHVW1mMzk1MldQb0tsV0dxTzlhRlYvQ0Rqc0Z2UjRFeTROY3M0?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88817a06-162a-4d2a-b5a8-08de00b7db5e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:57:59.7007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHYpgyAvWxELZI1XJteVvNUypW9hHL6Xdhva+upx+KPt/4OJQ6RqTIe8ED8KO6Sw/gSvPxLOmrGS+YOufjqSuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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

This patch series introduces support for Transparent Huge Page
(THP) migration in zone device-private memory. The implementation enables
efficient migration of large folios between system memory and
device-private memory

Background

Current zone device-private memory implementation only supports PAGE_SIZE
granularity, leading to:
- Increased TLB pressure
- Inefficient migration between CPU and device memory

This series extends the existing zone device-private infrastructure to
support THP, leading to:
- Reduced page table overhead
- Improved memory bandwidth utilization
- Seamless fallback to base pages when needed

In my local testing (using lib/test_hmm) and a throughput test, the
series shows a 350% improvement in data transfer throughput and a
80% improvement in latency

These patches build on the earlier posts by Ralph Campbell [1]

Two new flags are added in vma_migration to select and mark compound pages.
migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
is passed in as arguments.

The series also adds zone device awareness to (m)THP pages along
with fault handling of large zone device private pages. page vma walk
and the rmap code is also zone device aware. Support has also been
added for folios that might need to be split in the middle
of migration (when the src and dst do not agree on
MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
migrate large pages, but the destination has not been able to allocate
large pages. The code supported and used folio_split() when migrating
THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
as an argument to migrate_vma_setup().

The test infrastructure lib/test_hmm.c has been enhanced to support THP
migration. A new ioctl to emulate failure of large page allocations has
been added to test the folio split code path. hmm-tests.c has new test
cases for huge page migration and to test the folio split path. A new
throughput test has been added as well.

The nouveau dmem code has been enhanced to use the new THP migration
capability. 

mTHP support:

The patches hard code, HPAGE_PMD_NR in a few places, but the code has
been kept generic to support various order sizes. With additional
refactoring of the code support of different order sizes should be
possible.

The future plan is to post enhancements to support mTHP with a rough
design as follows:

1. Add the notion of allowable thp orders to the HMM based test driver
2. For non PMD based THP paths in migrate_device.c, check to see if
   a suitable order is found and supported by the driver
3. Iterate across orders to check the highest supported order for migration
4. Migrate and finalize

The mTHP patches can be built on top of this series, the key design
elements that need to be worked out are infrastructure and driver support
for multiple ordered pages and their migration.

HMM support for large folios, patches are already posted and in
mm-unstable.

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

References:
[1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvidia.com/
[2] https://lore.kernel.org/linux-mm/20250306044239.3874247-3-balbirs@nvidia.com/T/
[3] https://lore.kernel.org/lkml/20250703233511.2028395-1-balbirs@nvidia.com/
[4] https://lkml.kernel.org/r/20250902130713.1644661-1-francois.dugast@intel.com
[5] https://lore.kernel.org/lkml/20250730092139.3890844-1-balbirs@nvidia.com/
[6] https://lore.kernel.org/lkml/20250812024036.690064-1-balbirs@nvidia.com/
[7] https://lore.kernel.org/lkml/20250903011900.3657435-1-balbirs@nvidia.com/
[8] https://lore.kernel.org/all/20250908000448.180088-1-balbirs@nvidia.com/
[9] https://lore.kernel.org/lkml/20250916122128.2098535-1-balbirs@nvidia.com/

These patches are built on top of mm/mm-new

Changelog v7 [9]:
- Rebased against mm/mm-new again
  - Addressed more review comments from Zi Yan and David Hildenbrand
  - Code flow reorganization of split_huge_pmd_locked
  - page_free callback is now changed to folio_free (posted as patch 2
    in the series)
  - zone_device_page_init() takes an order parameter
  - migrate_vma_split_pages() is now called
    migrate_vma_split_unmapped_folio()
  - More cleanups and fixes
  - Patch 6 partial unmapped folio case has been split into two parts
    some of the content has been moved to the actual device private
    split handling code
  - Fault handling for device-private pages now uses folio routines
    instead of page_get/trylock/put routines.
  
Changelog v6 [8]:
- Rebased against mm/mm-new after fixing the following
  - Two issues reported by kernel test robot
    - m68k requires an lvalue for pmd_present()
    - BUILD_BUG_ON() issues when THP is disabled
  - kernel doc warnings reported on linux-next
    - Thanks Stephen Rothwell!
  - smatch fixes and issues reported
    - Fix issue with potential NULL page
    - Report about young being uninitialized for device-private pages in
      __split_huge_pmd_locked()
- Several Review comments from David
  - Indentation changes and style improvements
  - Removal of some unwanted extra lines
  - Introduction of new helper function is_pmd_non_present_folio_entry()
    to represent migration and device private pmd's
  - Code flow refactoring into migration and device private paths
  - More consistent use of helper function is_pmd_device_private()
- Review comments from Mika
  - folio_get() is not required for huge_pmd prior to split

Changelog v5 [7] :
- Rebased against mm/mm-new (resolved conflict caused by
  MIGRATEPAGE_SUCCESS removal)
- Fixed a kernel-doc warning reported by kernel test robot

Changelog v4 [6] :
- Addressed review comments
  - Split patch 2 into a smaller set of patches
  - PVMW_THP_DEVICE_PRIVATE flag is no longer present
  - damon/page_idle and other page_vma_mapped_walk paths are aware of
    device-private folios
  - No more flush for non-present entries in set_pmd_migration_entry
  - Implemented a helper function for migrate_vma_split_folio() which
    splits large folios if seen during a pte walk
  - Removed the controversial change for folio_ref_freeze using
    folio_expected_ref_count()
  - Removed functions invoked from with VM_WARN_ON
  - New test cases and fixes from Matthew Brost
  - Fixed bugs reported by kernel test robot (Thanks!)
  - Several fixes for THP support in nouveau driver

Changelog v3 [5] :
- Addressed review comments
  - No more split_device_private_folio() helper
  - Device private large folios do not end up on deferred scan lists
  - Removed THP size order checks when initializing zone device folio
  - Fixed bugs reported by kernel test robot (Thanks!)

Changelog v2 [3] :
- Several review comments from David Hildenbrand were addressed, Mika,
  Zi, Matthew also provided helpful review comments
  - In paths where it makes sense a new helper
    is_pmd_device_private_entry() is used
  - anon_exclusive handling of zone device private pages in
    split_huge_pmd_locked() has been fixed
  - Patches that introduced helpers have been folded into where they
    are used
- Zone device handling in mm/huge_memory.c has benefited from the code
  and testing of Matthew Brost, he helped find bugs related to
  copy_huge_pmd() and partial unmapping of folios.
- Zone device THP PMD support via page_vma_mapped_walk() is restricted
  to try_to_migrate_one()
- There is a new dedicated helper to split large zone device folios

Changelog v1 [2]:
- Support for handling fault_folio and using trylock in the fault path
- A new test case has been added to measure the throughput improvement
- General refactoring of code to keep up with the changes in mm
- New split folio callback when the entire split is complete/done. The
  callback is used to know when the head order needs to be reset.

Testing:
- Testing was done with ZONE_DEVICE private pages on an x86 VM

Balbir Singh (15):
  mm/zone_device: support large zone device private folios
  mm/zone_device: Rename page_free callback to folio_free
  mm/huge_memory: add device-private THP support to PMD operations
  mm/rmap: extend rmap and migration support device-private entries
  mm/huge_memory: implement device-private THP splitting
  mm/migrate_device: handle partially mapped folios during collection
  mm/migrate_device: implement THP migration of zone device pages
  mm/memory/fault: add THP fault handling for zone device private pages
  lib/test_hmm: add zone device private THP test infrastructure
  mm/memremap: add driver callback support for folio splitting
  mm/migrate_device: add THP splitting during migration
  lib/test_hmm: add large page allocation failure testing
  selftests/mm/hmm-tests: new tests for zone device THP migration
  selftests/mm/hmm-tests: new throughput tests including THP
  gpu/drm/nouveau: enable THP support for GPU memory migration

Matthew Brost (1):
  selftests/mm/hmm-tests: partial unmap, mremap and anon_write tests

 Documentation/mm/memory-model.rst        |   2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   7 +-
 drivers/gpu/drm/drm_pagemap.c            |  12 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   | 308 ++++++--
 drivers/gpu/drm/nouveau/nouveau_svm.c    |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h    |   3 +-
 drivers/pci/p2pdma.c                     |   5 +-
 include/linux/huge_mm.h                  |  18 +-
 include/linux/memremap.h                 |  57 +-
 include/linux/migrate.h                  |   2 +
 include/linux/swapops.h                  |  32 +
 lib/test_hmm.c                           | 448 +++++++++--
 lib/test_hmm_uapi.h                      |   3 +
 mm/damon/ops-common.c                    |  20 +-
 mm/huge_memory.c                         | 243 ++++--
 mm/memory.c                              |   5 +-
 mm/memremap.c                            |  40 +-
 mm/migrate.c                             |   1 +
 mm/migrate_device.c                      | 609 +++++++++++++--
 mm/page_idle.c                           |   7 +-
 mm/page_vma_mapped.c                     |   7 +
 mm/pgtable-generic.c                     |   2 +-
 mm/rmap.c                                |  30 +-
 tools/testing/selftests/mm/hmm-tests.c   | 919 +++++++++++++++++++++--
 25 files changed, 2399 insertions(+), 394 deletions(-)

-- 
2.51.0

