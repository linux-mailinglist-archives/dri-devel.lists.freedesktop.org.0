Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17701B21AD1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 04:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D6110E56D;
	Tue, 12 Aug 2025 02:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F0pG7HIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F379C10E56D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 02:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSttQzs/slc5Ln25EF6w/tC01PRS3ZwnNNBMpicvXXHEYjW8EHwIsA6SaNUGUeFiLw7M1fcOFbdGebnWft3CQd2He7dVPaQah7X5DjtllO5pcELgKXDduKCIWMn8XQdx+py3rPlk1oVo6FnovfH2QjyFB4MmjBP5oHZBjbM+5cjSV31le/joMfl7T3v/yGj2fb/zo8H52R3ni+mmsUNrxivXsoqRDwogbN/d42Xt9gfXotOK1l87cepKs7ebw3yR6hdBQMFejhqPxAVhzySP/6EUjf2hJfK5oC+js/O09D8z1pGyT/ADLFxOKQKCkRe1B7t0tK9fHRX0qFI6Jxk6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvshuiX9AHNai8LBB1yIKl8N+GR6Lxj+xyxSogLOnNE=;
 b=Ojhk+PAIFlDhHXhZ4bUvuC0wZfge0pBCiFUu92s3nbDrWUKCaowMIUn5aBVTBgebkZJmP+on85+zptilSK2eWS9IgJjFiYUPyNtK2rkqIQhhtdRoRPqfncrK2PSHJxiIfJtPhEbcAV3IHU0R1RzWwZma32cKmFFaygy9KzPF1pCqO8uYYPM0VsB8wQkskMVUaWkvWOlA4Q7PJD6JogtoGGev0tTSmPSGL7y/CxNLX4vPisk3xrcUEHRkk7dWiXbZwbC8ace6bWV7pNTPYJSurlWY2qlYTMduVeH2DnGDTozZej9iUFmlXD0mPTRZmTvsIQ51nsWKdGF0FZj1QD6MdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvshuiX9AHNai8LBB1yIKl8N+GR6Lxj+xyxSogLOnNE=;
 b=F0pG7HIKLol0BsKxehlI2hjS6EHP1zw8p9W6rRzDYLzrq9KAqm/QeeSp1AarzpJ65MJDANoqN1YZK/AJh6KIfywhaovc0szB25mlaEzzRXYkyXhZmbVkq/HxPut7vSTIDGC4D4tq8A/K8xXLzcCTG+fRJQzxZn6X1sVUmVPpnzXuRH/bfR+mEuYep95OMScLb2/iVAgd1msNVx9LMV2viJzjJZ0H+wZSzwgnfOjtx+fMzk/n4R4Uu319UTBsWui/oqPsjtvgCxBTwCBNUWVM9aORkyViBfU7EwqZeQlLzdLGycRFujFiTyecA70qTfCcamgvKCrtOw/evtkHrfh7hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 02:40:41 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:40:41 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [v3 00/11] mm: support device-private THP
Date: Tue, 12 Aug 2025 12:40:25 +1000
Message-ID: <20250812024036.690064-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::47) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5dd98d-8b89-4407-c6b7-08ddd949a0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzBkdCt5R1RDQS9xbmpPblQzQ3VRbVEwUE1IUTZXNHYwc2U0RCtWWEFpd2k3?=
 =?utf-8?B?dkc0OUVnTmJEdjFFYjJNKzBjTkpFcmEyTFdBVDFqa2lmUWFjVmI2OUFPYk50?=
 =?utf-8?B?cWFVdkNrMHNUL3I4THo1MkJZa3JxdUtNRUxyeFFvWlpvc0RGaXJBTGgyMDVi?=
 =?utf-8?B?b3h0aHR3Q3U2c0FqWWZhY3UreHRCTFU1N25tQXQwYWpYN01hSG9uelZvaTAv?=
 =?utf-8?B?SnlFeWw2TTM3YnlUY2tNVWNiSlp2MzJtSEUxZnpJbkFHSTVUL1ZZKzM0QTc0?=
 =?utf-8?B?R2tLUWZjcFZOemdNcGw2SkhhcUtYbjMwdmNFWEFBT1N1cDdEV21VSCtGeW5l?=
 =?utf-8?B?NGxwQ0psRTA5MlhkN2RCN3VBM3dzSEQwaUY3aW4rdXpMUDVSd1hRMEZZTEJk?=
 =?utf-8?B?N3V4VGxjOGpZYWl5RlJGdTdYaDlpY1cxU3VBL0NVbVE1ZWh6citjMFhEUGFC?=
 =?utf-8?B?SDVkZS9kSFA0dkJMamwrZFlaYnU1M2FYN2V5aUlYUWtoRy83ejVHMTB1bFpS?=
 =?utf-8?B?RVI3d1RPclVWWUJHeHFzSEpzcEpkdUIxYlJ3R2tLYWlmMHAzNWxUby93ajRT?=
 =?utf-8?B?dmcvVjdFZ1pINHZ5VFE5eWs4Uy9lZDN0c3EzWVArSC9taGowYk42RE9lMFpU?=
 =?utf-8?B?RW8xOWhrN044MytLanpHd0R5NE96Qk5VL1RJS3lRN0xFUzlWRzF2NGluTXJ6?=
 =?utf-8?B?UEtleGNwL3dSSjFOcDJNSFgwdWUva1FOZXRZTjJ2MFIzQkRkbzIyT1pheHJM?=
 =?utf-8?B?YW5IeTVteWZ2UWltOUF5YVNHOXcvSTMzdHNnWWZUZlpNeWN1d0FQMUttVTZT?=
 =?utf-8?B?T0pxUkk3R2RqeCtZZGkxMjYrZVVoVW5BRjRPb0U4TWhKb2pKVUdpeTBVc2xH?=
 =?utf-8?B?ckVnbkU5V2d1Y3ZPSVRGWTZNUHdPcUE2b2VzQ0dCakZKbUYyVE9NeWRsankv?=
 =?utf-8?B?SmpRNzN3R0JNODNPSzUvaXFQYk14RnJEQW5mdEJ2QldXWWJlQmM2bEpwRDI5?=
 =?utf-8?B?K0RSbDBNeHhkRnhKc0FUdVFkMk9RU0NPSkRWbm5SckRreWlodnBpancvSnVV?=
 =?utf-8?B?dU9NNWdjSFlHRkhqTkNnL1gvQjNzajBuSTN5NzJ6RS96MWVHY2RsZldsTmY5?=
 =?utf-8?B?anlRUTM4czJ5RUMvdEYwQ1RFRDZFVXgvWGlXZ2I3T21iU2lYeHByZUhqL0F3?=
 =?utf-8?B?d3VVNGZZcGV4OFl5YkJJMjBOcE01NXpwMVg4OFVkemYzNTRtMEE1RlpqVjY0?=
 =?utf-8?B?U1FQNFp5R0N3a3lOSkVaTjZ0dVAxMnZDZ3lBc0lleGY0eFN5RzNqUUNoam1P?=
 =?utf-8?B?dGNzNVFyNEJHc3d2YTkxU3FWOFVVVW1GUHVsREZ3TmE2OXBlNEtZdkxrdjVp?=
 =?utf-8?B?S043eHRnanRLTlEzVmpQYWJSVVdFTHdvWmpkaThrRTJWYk9FckVBQjBtZERn?=
 =?utf-8?B?eXA5TTB2bHJvb2dMdW8zN25lQjc2VTVDNjI0cGxHNlhtWmUvR3hWVUVOODJp?=
 =?utf-8?B?RklHQ1Z4SjV1dnlkQTdoaWFDZng2S2dtYWV5Qjg2dkR3aWUzbytnQVlwblp4?=
 =?utf-8?B?T3hZdksvaENqU1BMdmpIOEVhN2FqWkMzaTJQWGRCQzJla3Q4RFIvQ0N3cDZu?=
 =?utf-8?B?Z3VXeU5BRWJiRjl1VDA3SFJvazdPdmQvS0VLdWFQVW8yVVZWV1BqTDRFYk1y?=
 =?utf-8?B?REYwcmZRdzNJb21WSWUwdEFGUzVaY1I5ZWlNa2Jka3NDN3g5MldiMDkxcERa?=
 =?utf-8?B?TmhIQlZUbjhoYWJSc3ZWWEI0c0FpTzBUK2xUcTB3SGtvK2pnamJTS3ZteDVs?=
 =?utf-8?B?eFZnSVVrOFdlRUQ4cE42ellpQUlIanFrZXNyeVNSZklHaUxTalhMWE5TN2x1?=
 =?utf-8?B?N2JSUWhweXVjUzRzRkpJVDEwdmR0SVo0Yk1mV1hQRXVBZDVtbHdkdE1hQ2VN?=
 =?utf-8?Q?/AU0RojPcSA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVJZRGFDNlJ1S0U0R1pKQzNHWEgwWngwcDYxZkFEK3ZTY1VOelQ4N3JHdFI1?=
 =?utf-8?B?S3NaWUtpT1p0MEtSR0xLVGJ6aG5UaTU5cUpnbzhMTHdxejFVY3dPaXI5ZkRU?=
 =?utf-8?B?K1RKb1llUFJ1dFpaTWFIMXk0dTVyRlRHSXlCKzNvdERnUG5yeWN4SVF0VVpQ?=
 =?utf-8?B?R01kRUl2UWM4MWRKdWJhZnV3eThjVzZuZG1jUG9uQk4rRFI3S2l1YUxuRTlM?=
 =?utf-8?B?bktTRVNpN2k1eEF5NzY3ZDJicUx0Z2ptcVZ3YmxqTDFEVFk1NHhnK0JOUG5y?=
 =?utf-8?B?R3dBTkJqdzBXWWFSWTV1cGo5V2hBdUJVM1FkTnN0WVNCUGJhOGc1cUFpdE9Q?=
 =?utf-8?B?blExQTlmZmJUM3ZaY3R4TmxyTDg3MTd1YlBodmlGRmNWNzFDSWJTK2lyczRQ?=
 =?utf-8?B?KzNyeTFhUVBsV3p3Rlg5QktISzBOS0pJT2l0bzRxTUpwZWlRNVVTblBjbFBU?=
 =?utf-8?B?ZXJsaXV6UVFNRTJPSnQ5dFJJRXdaQXNJRCt5LzgrY2lxSEYvRWZkZ0VqOXdK?=
 =?utf-8?B?TWhuQzVoeXNNbFVkQ3R2bXQ0QkJRcmE5V2NSZmtHRmVZb0J3Umt1RkJwVWJX?=
 =?utf-8?B?ZUY4S3IxeUFhZWxVRCtlbU1JVzlvOTZ1a29Cd0YwUW9JckMrYWNHaFRmQTMx?=
 =?utf-8?B?YkRJY213U3JDR3UrUHZXZ1lnblpYcjR3aHVEdURFTkViaGMxRU9IdWlOZXpR?=
 =?utf-8?B?Q1lib2JEeHpWK2dmMENjdFhHVTVWZDYwYndIWkYyVGN1aW16TkI1VldIT2Nm?=
 =?utf-8?B?VEhoTFZRUmtXc2tOQ1VNT1RYMEp1Nkdoc2s1T3V1dldxL0EweDFUU2pWK0FF?=
 =?utf-8?B?R3FSbWlvR2pjRldKR3dNWFprSXFRL3d2bmIzcDI1aSswODV1YldkcHRuZFdG?=
 =?utf-8?B?NHdIZ2JwVVE0YlltNmxZeEZhb24rMGhObTlrN2VRdDJDUWtmRlZiaUNvMzgv?=
 =?utf-8?B?eklNSFBzRUN3US9odWQ1RFBDUmNDbWRLQWdsT3dTQU5XN2hLUFpBTVVEdWpN?=
 =?utf-8?B?b3U3OU5FdUFETjdob054ZmxBREFxV25oNWs1UlcvVEQydmdaVzBSZm5MZXNv?=
 =?utf-8?B?Sm8vd0R4cDNlQ1dLQytPTENydnR6anJiaUpyTjBGM290VlhaMGdibVBHS08x?=
 =?utf-8?B?bTNLcXhPSWp6ZnhtU1V2RVhmNW50UHJMdjNib2R0cGc5YVYzSlZIYmFqaHcz?=
 =?utf-8?B?RVJqcENuOTRrNzVYZ3RsZWxUYXBzQUtKNnliN09xZE5lS1RYT0VZdUJYdHd5?=
 =?utf-8?B?TzgrRkFGa0dOR29ENll1bVh1clVXRDJyTS93aWRQZU15Qk0zMW02RUtqNG1o?=
 =?utf-8?B?OFdnR3d1K0hCbDRURUFBR3huTmdLTGN2WFJZRTRtS3ZOSU80YlFQblN4V0tv?=
 =?utf-8?B?RnloL0c3di8vWmsyYjlDdWhPMnZlbmM1ZDdMWkt3Vm50QWhpWjRwL3pQNTBa?=
 =?utf-8?B?YW83b2hLUEVCOFlRNmQrQ0l4bUlremh5R3JDWTh1VjJCK3dHZUVmblFySVhs?=
 =?utf-8?B?U1FXMXlwMlEzSXlBbFpKV0RGazhpYXU2M0ovY1BRNEtzY2VXcmZneUtGNmpP?=
 =?utf-8?B?OVBGVnBESTMxdENadk9kRndtRWdSWXAySnZkSlZJUmZMdExONEcvQjJwSWpw?=
 =?utf-8?B?U0drcDcwZEtTRUxiYlhyMXFuenlRZ2NSdVcwbXZXdytWRUNPSDRDZFB2WEox?=
 =?utf-8?B?WnhYUEVHVUFxeHE4cS8zemNLTHdjQ2JuMTZxdHpmeUdEQTJxak9nYkk0bTZn?=
 =?utf-8?B?ZWNKZGR6R0Z0WWZnUERSNzJTS0trbFp5RTAvaVdnbUVqVS9zR0hiSElVa09m?=
 =?utf-8?B?azZxblNBaWlvdFpJcnNuRTRqZUh1VEtmRFd6R1RtR0s2bnZSSVJCc1hoZm12?=
 =?utf-8?B?U3Y1SWxPb1RPaGxMRnY0Z2ZOUGV2cDdIWlN2eDJFU0Nlb2lXRkZTT2t1SlJh?=
 =?utf-8?B?bjhKeVNTdVVEcXlHSWlaY25IUWVwc29JdVA2UHhuTGZXRnlNQ3FmU25nRW9l?=
 =?utf-8?B?ZVBMdFdPWWUrRFdGR1pMRmpVZHdGY2dTY0xkKzBMaFM4UzFvbmNtUCtQMG41?=
 =?utf-8?B?RlhDbU45TEN5WGVTWTZEamkzdWFNcmloMHpXT2NORFh3M3htV2xkeHltaThZ?=
 =?utf-8?Q?wb8jSrTjvLDMX1M7CI7ri/QrM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5dd98d-8b89-4407-c6b7-08ddd949a0b9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:40:41.2044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOr3W1iVJ/e87xLBix2o413LtummOhtrerorGwaX5UqHFEBBYKVqbBfb2b76+eBpru70YVtU9cYsD/VT3tvOlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172
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

This patch series adds support for THP folios of zone device pages
and support their migration.

To do so, the patches implement support for folio zone device pages
by adding support for setting up larger order pages. Larger order
pages provide a speedup in throughput and latency.

In my local testing (using lib/test_hmm) and a throughput test, the
series shows a 350% improvement in data transfer throughput and a
500% improvement in latency

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

HMM support for large folios:

Francois Dugast posted patches support for HMM handling [4], the proposed
changes can build on top of this series to provide support for HMM fault
handling.

References:
[1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvidia.com/
[2] https://lore.kernel.org/linux-mm/20250306044239.3874247-3-balbirs@nvidia.com/T/
[3] https://lore.kernel.org/lkml/20250703233511.2028395-1-balbirs@nvidia.com/
[4] https://lore.kernel.org/lkml/20250722193445.1588348-1-francois.dugast@intel.com/
[5] https://lore.kernel.org/lkml/20250730092139.3890844-1-balbirs@nvidia.com/

These patches are built on top of mm/mm-stable

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

Balbir Singh (11):
  mm/zone_device: support large zone device private folios
  mm/thp: zone_device awareness in THP handling code
  mm/migrate_device: THP migration of zone device pages
  mm/memory/fault: add support for zone device THP fault handling
  lib/test_hmm: test cases and support for zone device private THP
  mm/memremap: add folio_split support
  mm/thp: add split during migration support
  lib/test_hmm: add test case for split pages
  selftests/mm/hmm-tests: new tests for zone device THP migration
  gpu/drm/nouveau: add THP migration support
  selftests/mm/hmm-tests: new throughput tests including THP

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 253 ++++++++---
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 include/linux/huge_mm.h                |  18 +-
 include/linux/memremap.h               |  51 ++-
 include/linux/migrate.h                |   2 +
 include/linux/mm.h                     |   1 +
 include/linux/rmap.h                   |   2 +
 include/linux/swapops.h                |  17 +
 lib/test_hmm.c                         | 443 ++++++++++++++----
 lib/test_hmm_uapi.h                    |   3 +
 mm/huge_memory.c                       | 297 +++++++++---
 mm/memory.c                            |   6 +-
 mm/memremap.c                          |  38 +-
 mm/migrate_device.c                    | 567 ++++++++++++++++++++---
 mm/page_vma_mapped.c                   |  13 +-
 mm/pgtable-generic.c                   |   6 +
 mm/rmap.c                              |  28 +-
 tools/testing/selftests/mm/hmm-tests.c | 607 ++++++++++++++++++++++++-
 19 files changed, 2039 insertions(+), 322 deletions(-)

-- 
2.50.1

