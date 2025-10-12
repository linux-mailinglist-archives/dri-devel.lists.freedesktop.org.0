Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9779BD0D48
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 00:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CB710E021;
	Sun, 12 Oct 2025 22:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VZI3D4rz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013043.outbound.protection.outlook.com
 [40.93.201.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652AD10E021
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 22:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MabYaRZYj9RTgigjuy29Dx7JD2wO9UwMt3RAk2XmCEx5tFfq8qK0q7UMn0rfKWfS4EvFOF3zr8zWffgtZr7yao63V8QtOqL1EvJgbUJpqJKrp6eHWEq2KUqM2t4xO8VGRJ3tK9FlT5Ui+K4d7hjOzdQV2mGAiBOdMovAqeKH5UzFAzykgZE0pb6/fA6hC5+w/yFeWlsMhLuoVVPUw6BQt7hIS/OB/XLRnQb/6WjOjvaG9GpCsL4y6JF0NloE389X46jvNmMwV1T+zvIezOwaBvw/WTtWqqd4sl2plrVOtfZ3H1qUJF/DKxUnFF7pO2cKMNlY+ctZvP339fwRkfI5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAo/ItiXOywBVnsCYAFqoGFRVPBhMtmPDp+QnCb44Vg=;
 b=SCLFr7Vc9TU4b7e7SoXg/vYAWH7id+g4N0RS3/oXNDOyufpcTAyddTF+qa+UouNBRQvP8n05vJD88EnxFt1FLCW4I+nQDFJ0IU382b6JsK0/wwyeplf1FAsFqahCCx0l/mGx/XhsW4r7eAFyW5Ef1VIONxvqW9Anc8JZrFggLONNJCjQ4fJZ4+b1k+42+noYYr7dahIo08UsnxeFd4jZ71IJsadZK70WgaOSDChel6u4fEahPsdIuubKISVounlG7oyExoXKkYYe4CJ+n/jb5mR2xh7m05LrupeLWD9vbAs1h0G0A2Eg7ETRkGnrDtMLnmLKRQcvvxYLZHrDUdHVog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAo/ItiXOywBVnsCYAFqoGFRVPBhMtmPDp+QnCb44Vg=;
 b=VZI3D4rzDk3hmYB6FZpTONCc8FydviLgZMI4buA7vZonvnOiq2/1fYLjrFOV6QieYKBoDJrt2xzeSnM96fnBB0Tun4DytV4/o+VFbjNJIiJEVyvX5ZmD2Bh4PtJJ8IQbxQVju/nJGGiU69FU/wc+xU+hPC7geyU1JJAB0v06WwL/QhHIsY4fjjFUl5xE0C6qUX4o4DADiX5PTO+3CAj7XGQ43CK46VE/OfTtrEcERInJLR2X3eAQtJlVVAWqZnomGDowKzu15AzfNOx4XLHNO6QHl+YFIlWBWLI4fBFaKVfKUT7ercE9KwYBivLD804BCshCQl0D9kZtOT9LpyipUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SN7PR12MB7177.namprd12.prod.outlook.com (2603:10b6:806:2a5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 22:54:26 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 22:54:26 +0000
Message-ID: <7f451c61-f45f-442f-b6fe-fac9ba0ea6d1@nvidia.com>
Date: Mon, 13 Oct 2025 09:54:09 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 01/16] mm/zone_device: support large zone device private
 folios
To: Lance Yang <lance.yang@linux.dev>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-2-balbirs@nvidia.com>
 <CABzRoyYJXVdgTdoz9uYxeYHeejU1bbe6_rQnvbKns7fjvz_kqQ@mail.gmail.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <CABzRoyYJXVdgTdoz9uYxeYHeejU1bbe6_rQnvbKns7fjvz_kqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SN7PR12MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b60e59-97d8-4b53-19a9-08de09e24b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGdOQzYrQmFBS3g4TlM0U2R0QUgwQlFza2pqYi9MVmkxOTE5bGhReGdUUGo5?=
 =?utf-8?B?VWVIWUtneXVyL2RIWk0zbnFYUkdndUg2cWNCTlh1ZmF4Q1NwRFoyRU53Ymty?=
 =?utf-8?B?TzhwWkRyR1pESVNycWJpUmRzU3J6N1FXN01oaWw2dXVYdWtMK2kycytNdWN0?=
 =?utf-8?B?cDFzOGFYQk9NYlBaTGtQZVEwVkM0cXJkSFBkVkpVYVBFQm80QkdIcEhjSWdX?=
 =?utf-8?B?RjlNeGRzMjlhODBFTncwR0tYSHp5MWs0Y2hPYzlCeVdzT0ptSGwydnFZWUo2?=
 =?utf-8?B?dmpVY3RBSjY3VGN5M2NTd0pXNTNsS210T01OUGhIWWhseTJVamZwVTR6bEpp?=
 =?utf-8?B?SDdreERNNFF3allnU2tZeC9Db0E1aTdPTThvRVpSMzJGaFJweEk2MmpSRlhm?=
 =?utf-8?B?SXlyQ3RNd2M1RXVUK2U3NkhGUURoSjVjUjUyRGpzWmlsWTd0eGRndDRhNkk1?=
 =?utf-8?B?UHN2aCswVXBxQkJzR0FBNGk3ak5xMW9Oc2VaeHo5SkZUd2JCL01USDF2ekEy?=
 =?utf-8?B?V2x0L1UzcDAyZ3EzV1RzWE9xUnBIdk9oMjJNVzQ4aUYwVUo1aDZmY09wWk41?=
 =?utf-8?B?KzNBdy9wWnhJckFCLzJKakZ2YXdqdVJGMUwzazVMaHJUbDBmaU5JeUFuWjc2?=
 =?utf-8?B?eVVjWWJBZXpOMStHUmJSa2V4WlVBM0tnUkIrL3ptSUdpNSswT1hxN1lWR29a?=
 =?utf-8?B?dDJRSXdMU3hUYWdYTTIyMGFqeURpajJreVVMYytXNlZzUDM1ZzFra3ZKSWxn?=
 =?utf-8?B?SjZxOEUwRVlrYTIxa3ZNeXErWlZheHlHdEVZVk13ZVJkVzVtRW9PbloreDgr?=
 =?utf-8?B?NkhPZ3ZFTkg3dTZad1VVMzZ2NVA2RVFxUmFMVnJxM0JWbHFxTlc1RFdEYmxW?=
 =?utf-8?B?QmkvNGNYSzd6VExHOVRqNGd3MlBJTW1QYmQrNVJpUU9TTW9sdTM5QjNGNXhZ?=
 =?utf-8?B?cFdXL2xzUkNDR2RoU2dEdG9hV3lyeGJST3ExRlJ1THNmN0VyTkVEVDV2cDk2?=
 =?utf-8?B?SWxxYmFkVUxPN0VnY1ZUTUdISWxFaXZvRzZpZ0pVV3lvd1hMSEVDWld2TWlh?=
 =?utf-8?B?WXBFaFZxZTY3Qzh1Q0ZBZkt3bkxZRlVjQTlPaFhyUksydjloZld5eUwzenY3?=
 =?utf-8?B?enZDZDZnWXRFWG5UbUVzZVhFOFhQRzFaVnprL05NOTRBSUFKbU53Qk5oN1FO?=
 =?utf-8?B?ZWxpazBYbkRGWEYrcS8wTDBYRlQyWTNmMG1qYkJFK3FoUVNLWHJidmhVQzdQ?=
 =?utf-8?B?Wm9SVzA4bkdOeUdzTHJWTDJqUWpBS2FGSXBzR2E3UlNTb0Z3ajk5eUc4T1ky?=
 =?utf-8?B?ejRJMFcxOWErNnVoNm9aRm5iRjdtc3MyOTVPVitnWEs4Y3o2SlJ3Z3FKYTVp?=
 =?utf-8?B?dVBXVzUwSllZOGZlZmRJSUlueWNLcUdBcUdZMHZzaDh2TVpjVDArL1dXOC9a?=
 =?utf-8?B?SGxVVitNRW5DWUxYcitJdXd6a0ZFaGxLWXIwRHlRN1lnQmUzekgxam82dVNs?=
 =?utf-8?B?b0ZqaFNJLzVuTTN0UmtFRG54NmhwT2pHK05rQ1B4V1FXcXNyZ3VYbGsva0x3?=
 =?utf-8?B?K0Qxb0NzZFJ0dndxeUtWSG1RbWY2UFRVci92QzFVYUtEMTAzQlZTYVcvMllx?=
 =?utf-8?B?ZFR0UStPYmdhSnBxL2dWakFTRUNNM0svQWpCbnZvNDJHL1M1L1oxTlhBa1No?=
 =?utf-8?B?UmZNQjFDSi9XWnNyVHJ3OTB2aWRWK01jUWplMjdlNDlBRHRVbDFjTzNVN2Vl?=
 =?utf-8?B?eDRaUlAzY3JpbHRIVGtJRmlkbk5BcWhSOXllay9lY1djdWhSeFR3eXhadTBW?=
 =?utf-8?B?Y2llSjhlckc2T2JaemhyYkx1TzdJKytrQ3puOW5CeFlXS3lxUXFNZzlCckRm?=
 =?utf-8?B?cUxlOUpxc0p2YnVSaEtKeEdvZEFwNlpDc052aGhrR0pmaG15VlFtTGQ4dktH?=
 =?utf-8?Q?frcM6tugE3gzUZ1gB+NUifK1Fbb70Le9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHpMaUtHQ2NRTGJoSytFSnlwVVg0bFpoTUVMRjk4NFQ4eExrMHN2NGp6VHA5?=
 =?utf-8?B?bzdoUDY4ZENUNmhwc1MyUStBdzhsYWNYM0pyZUhlZVVLM3pMSVJwSnpWWGdi?=
 =?utf-8?B?TTRFSDg5dVlwQVVIRnl3K3dZeENaaVp1R2lJcUIrYVpCTkRDT2FTQUFPZ0VC?=
 =?utf-8?B?L3F5ekowWkNscTZUTTdjVGRzSGlVenhpTERnbGFkbzBmUFJsOHlYNEV5Z2ND?=
 =?utf-8?B?MHNLVFRzMmFGb1dzMlNqU0ZWaitsNXRZMlNQN2ZzT3Q5aGJFN3M1Z280dHFX?=
 =?utf-8?B?UlRzYXFPUEdmbWpsNmQ2ZHRKTVVDU0U5K3UwN1Q0UUx0aXFyN0h4ZFRvb3Rr?=
 =?utf-8?B?VkVPcWxzNEhCd3pVMGp5Sy9IeTF4WHl0TnBuVmxBWHhlRlk5aGdWNldkV3pD?=
 =?utf-8?B?eE94Y2o3eng5Uy9qZjN6VWFTUFA1cFBnTEczZDdzWjdORGlVeWtxZlFCeXJH?=
 =?utf-8?B?emRHbkMrdVArbUl0Um9PVVpyU0szT3Y5YjVlZEhXSFgwb2VGZU9Vc0FlVEtO?=
 =?utf-8?B?VHBZYXZvMUhCdTlzaFRXaGlsS0NmRlNTTGRjeTNDZEFJd2U1U0tQc25BeXhT?=
 =?utf-8?B?RXNFRjhnd2hEMkpab0RXSXBscDdNQkdOV1JxMmQyd0NkRU95Y1lpeGxNUVVJ?=
 =?utf-8?B?WHRLdkJzNjh2SVBxYTlFQ21sSkFKUCtwZnhETlZXU1VtSjJNU1FDN3BIQ1FX?=
 =?utf-8?B?UjZySmVvU2R4Si9LelJiOUZjUlBmR3hYeldiVFRRVjRhUkNMSmVJc0V4d1pp?=
 =?utf-8?B?dEpoUGlYQzk4cGNjSzBlU0dFczJBSk1sb1NFWllJS1FQSWxlTGMxM0JSWlZh?=
 =?utf-8?B?SmRrdjNJVGlKMEw3WkJBZ3RjMzVMSHZFaFVsQ2FzMlk5MmFaMC84dy8wblEx?=
 =?utf-8?B?OTErS1pQdi9CRWVyWitDeVF5QmhFRk9wOFFWRXNYV29hbGFXVWdpWUUxU3Ev?=
 =?utf-8?B?dFd1MU4yMVB3bHNqN0xmcS9ZUXNQYVB2cUtKb01nT08rOFVZcWdkelprdkJR?=
 =?utf-8?B?YkZHR2FGdFF3VHNWekI2cU5IM3IxY1prbGNDcFg1aVhRNHlFZmdjTnQxVk16?=
 =?utf-8?B?bDJ1UnpBMFlhK210Z0FkdDN2YjlBY2w1QlJ1c0ozOWdYNzBjWTZ2V3RiZ0ZB?=
 =?utf-8?B?QWhrd1FXQnMxaWMwYndMWkpIazcxWjFubzZFa1E5Z2dtaG9EbFB6dFJ1K08x?=
 =?utf-8?B?c3hwS0l4WCtTYXB3TVJRaHdXZ0pHWXhBOVNMandxLytOTFZZdWdPdWJMMEM3?=
 =?utf-8?B?NG1uallhem8rM2c3cmlYR2ZSNzRTVWFmbEEyaGZWTGNLRTJsK2QyZ2VBdXYz?=
 =?utf-8?B?Z3FJRWlOMmc4ZEpCUFIySDJOL0ZMVlcwUmtuL3hDVnZDUm5LeEtxSEQ2R3FH?=
 =?utf-8?B?VHVrdCtYNUFPczVndUVHb2FJMXVXTXUrUnJkWG5sTlZ2MlVhWE1GQnZzbENW?=
 =?utf-8?B?bDVBMlFEakdyTzBtSURpRUEwOUQ5QXNmRXM1MlQvQ00zb0NhQktpM29nWmdO?=
 =?utf-8?B?NWovWU5LUTNWQWZ5Q3VTaUdJT014c1N3R2RkdTljTGprRWtjU2ZYKzBqUFhL?=
 =?utf-8?B?UVFZTU91U0ZQejA1eFdYZ2l3K1lLdmhCUXlmdDJ5QkwwRkVldkh1YTMrQ3ZY?=
 =?utf-8?B?QlNBWWx2dHZDMGZvSkYyNzI5dUozZlV4MEtQbUpWc0xldTJtOG5Jd2doVzVt?=
 =?utf-8?B?dVVDRDB6OG1ieDJIbWU1SnMwaFBmMWFIWXJHOUdjN1JJSno5T3p5a25ldk1a?=
 =?utf-8?B?SU5oN3hLeFhJMEdPeEFoRHNldjFZaFV3VENhdjMreHB4Zlh5VlJSODNlcTli?=
 =?utf-8?B?bTg2ZTdKbFhsL2NZcW5qeHNFbllsQTYwcFl5UCs2OFRnR1p5VUxFVGZCUGxT?=
 =?utf-8?B?R2lPNStJeEFlL3hSMmJ6dVNWU0U4VjNPZkFSU3VOWldQK0pNZFEzL3crNzhQ?=
 =?utf-8?B?YmFPOXltWEU1OWxObitWNDZXSHBCMk5sajlUcmp6c1FSeHNDSVd1UmFpTHdm?=
 =?utf-8?B?MlBNQ0EybFo1ZjZYaGwrUm9GYmxNVUx4ZXdsZUlGWnIzM0pwRmdvWGxIRlB4?=
 =?utf-8?B?NllPRWdsOHJkRXBFRWg0a0REa1BWV21TSTJtOHQvME03ZTRXL2IrUGxZdWxV?=
 =?utf-8?B?OFBZbXBZM01qN0J6bUlFWlNuYVpPTS94YmxMK1cwR2o3MC84Z3RlbURLSUhE?=
 =?utf-8?Q?GNDDzIrQf2mfYN8c7pBTPNZ7zoegl+3/yTsbJStAI3PM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b60e59-97d8-4b53-19a9-08de09e24b5e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 22:54:26.6577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HgNGqGQZT322qdgYUQrMa+iiQ3faOjxaEbo1q4B4/WF9CyfXpWtFE1WeAp+hF3HeEBdC8DMuA+qIozf0d+x+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7177
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

On 10/12/25 17:10, Lance Yang wrote:
> Hi Balbir,
> 
> Just one nit below :)
> 
> On Wed, Oct 1, 2025 at 3:43 PM Balbir Singh <balbirs@nvidia.com> wrote:
>>
>> Add routines to support allocation of large order zone device folios
>> and helper functions for zone device folios, to check if a folio is
>> device private and helpers for setting zone device data.
>>
>> When large folios are used, the existing page_free() callback in
>> pgmap is called when the folio is freed, this is true for both
>> PAGE_SIZE and higher order pages.
>>
>> Zone device private large folios do not support deferred split and
>> scan like normal THP folios.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> ---
>>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>>  drivers/gpu/drm/drm_pagemap.c            |  2 +-
>>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>>  include/linux/memremap.h                 | 10 ++++++++-
>>  lib/test_hmm.c                           |  2 +-
>>  mm/memremap.c                            | 26 ++++++++++++++----------
>>  mm/rmap.c                                |  6 +++++-
>>  8 files changed, 34 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> index 03f8c34fa0a2..91f763410673 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>>
>>         dpage = pfn_to_page(uvmem_pfn);
>>         dpage->zone_device_data = pvt;
>> -       zone_device_page_init(dpage);
>> +       zone_device_page_init(dpage, 0);
>>         return dpage;
>>  out_clear:
>>         spin_lock(&kvmppc_uvmem_bitmap_lock);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> index 79251f22b702..d0e2cae33035 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>>         page = pfn_to_page(pfn);
>>         svm_range_bo_ref(prange->svm_bo);
>>         page->zone_device_data = prange->svm_bo;
>> -       zone_device_page_init(page);
>> +       zone_device_page_init(page, 0);
>>  }
>>
>>  static void
>> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
>> index 1da55322af12..31c53f724e25 100644
>> --- a/drivers/gpu/drm/drm_pagemap.c
>> +++ b/drivers/gpu/drm/drm_pagemap.c
>> @@ -196,7 +196,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>>                                         struct drm_pagemap_zdd *zdd)
>>  {
>>         page->zone_device_data = drm_pagemap_zdd_get(zdd);
>> -       zone_device_page_init(page);
>> +       zone_device_page_init(page, 0);
>>  }
>>
>>  /**
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index ca4932a150e3..53cc1926b9da 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -318,7 +318,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>>                         return NULL;
>>         }
>>
>> -       zone_device_page_init(page);
>> +       zone_device_page_init(page, 0);
>>         return page;
>>  }
>>
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index e5951ba12a28..d2487a19cba2 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
>>  }
>>
>>  #ifdef CONFIG_ZONE_DEVICE
>> -void zone_device_page_init(struct page *page);
>> +void zone_device_page_init(struct page *page, unsigned int order);
>>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>  void memunmap_pages(struct dev_pagemap *pgmap);
>>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
>>  bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>
>>  unsigned long memremap_compat_align(void);
>> +
>> +static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
>> +{
>> +       zone_device_page_init(&folio->page, order);
>> +       if (order)
>> +               folio_set_large_rmappable(folio);
>> +}
>> +
>>  #else
>>  static inline void *devm_memremap_pages(struct device *dev,
>>                 struct dev_pagemap *pgmap)
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index 83e3d8208a54..24d82121cde8 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -627,7 +627,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>>                         goto error;
>>         }
>>
>> -       zone_device_page_init(dpage);
>> +       zone_device_page_init(dpage, 0);
>>         dpage->zone_device_data = rpage;
>>         return dpage;
>>
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 46cb1b0b6f72..e45dfb568710 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>  void free_zone_device_folio(struct folio *folio)
>>  {
>>         struct dev_pagemap *pgmap = folio->pgmap;
>> +       unsigned long nr = folio_nr_pages(folio);
>> +       int i;
>>
>>         if (WARN_ON_ONCE(!pgmap))
>>                 return;
>>
>>         mem_cgroup_uncharge(folio);
>>
>> -       /*
>> -        * Note: we don't expect anonymous compound pages yet. Once supported
>> -        * and we could PTE-map them similar to THP, we'd have to clear
>> -        * PG_anon_exclusive on all tail pages.
>> -        */
>>         if (folio_test_anon(folio)) {
>> -               VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>> -               __ClearPageAnonExclusive(folio_page(folio, 0));
>> +               for (i = 0; i < nr; i++)
>> +                       __ClearPageAnonExclusive(folio_page(folio, i));
>> +       } else {
>> +               VM_WARN_ON_ONCE(folio_test_large(folio));
>>         }
>>
>>         /*
>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>>         case MEMORY_DEVICE_COHERENT:
>>                 if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>                         break;
>> -               pgmap->ops->page_free(folio_page(folio, 0));
>> -               put_dev_pagemap(pgmap);
>> +               pgmap->ops->page_free(&folio->page);
>> +               percpu_ref_put_many(&folio->pgmap->ref, nr);
> 
> Nit: &pgmap->ref here for consistency?

Can be done, thanks!

Balbir
