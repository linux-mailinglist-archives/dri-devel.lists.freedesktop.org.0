Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F353ECB2F1B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 13:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7756810E25E;
	Wed, 10 Dec 2025 12:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V65emjvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1597810E25D;
 Wed, 10 Dec 2025 12:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZH+flfFTqGS6IAQdmVnBjhtYQLO3JupUkyOU8xW04/MsjaFGR6P2SzWYxCCbdOUSn4HIlg7lYgOZPJdKvyTx86VV6ycRcGizlfnAXZmZ3FRgKZXyDdfr2YHTyTtPBog6alCP+eLFxXqTAS99C6Gie3P4Sx1BF8oSLMNm+Kj3OwPorbptlIKj/cEZvkfkXR9Hqjf0mWC8nbvZnJ4wA5Z42u6FtEymNA1Y6S13xjpZBMvRDCjpMvYc4X0Qzh8x3zxPWsQKoTbNWeyPzpFBf0pZKpI0z0dnUTGnbYLGPhQWIZwCKDtEZqPcyqiZwh5feU67N+iYVePDLuN5wdfkI2/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bbcbpgd7sZWtsJT4Mi7RAN+Fkt2aUMzvI+ejYpVIyNc=;
 b=bnAIyzqTyastPs8Eh33Rq0uM7RmakwxntOFd4vQ2DrTQQCCFUHNzcqbmRDBRSmpVdyKGxRFN1hViSpWF6SDee+aKYNpW2GAhB34T0h9was/1SI7+rHHqKhUAsKjBeW3fECyVp6ZvbCREZz2peVjoYMTCYPCkYDwbqWpwmLmRR5Bg18Wo/HdeJg7y5tCee16BOpLcwctMnfnRvx9z5HGAr10jmkaKoOWK/6H6+keWhgKrxK34sBAWGal3bj+cwjeZkXIca5qenaI31WMDwF84a5fPdJ1yz+wEGy6achxPJvr55Oc6PHTFQmKkf7BgF4kBMGUPsLhkIlRf28tcKGXNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbcbpgd7sZWtsJT4Mi7RAN+Fkt2aUMzvI+ejYpVIyNc=;
 b=V65emjvo8+p+xSaAy0Ekkvwl4ZhHB9JDDRic8VMonGAOruyQxit3VS4XThDOFnEv/AMSAh8DdG1f6mG2bOBPxnDBQyn1Ax9tUzwtmdhi5lBnCT/Ze/AABQZqfFNMQl/WJZjmts2sI9CkWGifeJpkgtcfJ1bL87Lmo/rVwftDMCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7564.namprd12.prod.outlook.com (2603:10b6:930:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 12:47:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 12:47:46 +0000
Message-ID: <8ceb06b4-5f56-471d-91f6-a6ea6733e9a8@amd.com>
Date: Wed, 10 Dec 2025 13:47:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <aTjTucrVHe8TR/gN@lstrano-desk.jf.intel.com>
 <0508680962030eb0f858890a3183a545126614c9.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0508680962030eb0f858890a3183a545126614c9.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0326.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 86219408-af12-47ae-3a35-08de37ea51a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3EwV2oyQ2ViL211QzFvMlVJVVBEK0JaS0Q5N3dZU1UzOUF5Rnp5OGxrQXRX?=
 =?utf-8?B?aFdWa3N6NHNESmNzczAycWZMVUI0cytnc25HU3hQQWQ4S2NIV0hHQU1vREZz?=
 =?utf-8?B?amVpd050Smh0Z1dRRCtZalpzS0ZpcWpoWHRTdC9kakpuYVBIYnRtMStOQm9v?=
 =?utf-8?B?eFo5NG85cEpqZTBJT0NzcDFFSTk3RUkyM3U5TGdwUjdPRHovSlVleWhERmZz?=
 =?utf-8?B?bFg1SW9pVHI3M0UrMGRvcUlBWWd3eFVRaEZacFREeWg3b0hueElJTTRiMTJx?=
 =?utf-8?B?ODRhUEUwQ2c5ek5uYS9NcEJLSlB2Z1R3K2pDNkxocTlBL1NGTDdPSXRHcDZU?=
 =?utf-8?B?QnRyamhTS1VJNXpreUxjaEJyY2ZoTFFUV0QrelVpL1JmUHJjNVl2aFcyUVVu?=
 =?utf-8?B?MXJhSXdsbjdjN2FkSzJxS0wvNzA5SXVQRENHTTh2SDJUVGxPWE1EQU9ZdkN0?=
 =?utf-8?B?MTRFaHdWYlNUNEpLWVJZb3F2NmVNM21haFM0VG9waUYvUGdweFBzcTlkUUpW?=
 =?utf-8?B?bEZFb1VmNU1JU1ZCUTdYd1FDbDQ1bFlzd1BOWTVEd2pkdWFoRzFWYXFndExC?=
 =?utf-8?B?VlhBS1BVaTR6Ym9lU0JTRVBsWERSWS83NGMrTTE1RzZwcEluRi85ZjFBZ2VP?=
 =?utf-8?B?YUJ4N2hKTng3UHMvOHYvak50UjJ0Z3l5WVE3b1lKeWttZCtCTStSOVlYS0Ey?=
 =?utf-8?B?cjVPK1VVa2tyUE5pM0hqS2diV1B3NzdlRG83bzVqbGp3VkRZNytVL1cwYTZG?=
 =?utf-8?B?WE5yRGtJUTZHY0RDNlE2NWY4a0JSdUJDbE42RmpwNVB5SnIzK2NhdytkU1Fr?=
 =?utf-8?B?NllUY3o0QUJ1SG42VkhtZkJoNE45S1pTS0FPcnRNb0Jmd3BZT041Q1RrWjhq?=
 =?utf-8?B?cjZjZzB1VXZpa2NBNW9UdXlkMXVrNFN0VVJ6MlFoVkRzeFFKOTk4eDdQS08x?=
 =?utf-8?B?YjRpalhPb21Ga3BieGRYMHFaWTFhalZGWjRnUmViNmRFR1BhM0dRM293OUdO?=
 =?utf-8?B?YjA2M3V0RTRHVXVvSjdKOHVSVU1jQUpXV0l2T3dEbXBMUHJGcWF0ZUZJd28z?=
 =?utf-8?B?NGJOaFl3L3U1a1R0L1RxRXlHRXNHbzlJYklvTHpUUkZMdWZXODhzTEdpNWZL?=
 =?utf-8?B?RlhPUlkrWUtJdmVBaFptcUo3dG0wVzErRVhaTTJEczdSN3BkR2t0eFd2L2dk?=
 =?utf-8?B?endTNS93NWFvbnVIY2tDRlhUdFFobGZxMTE2cXNHcjQwRTlqU3dLTUF5V2JN?=
 =?utf-8?B?ZEsyZWlVVyszendhenRSSmdrSCtGQ3lYQk5RTGhubm4rakRPRExqdXhqS3hp?=
 =?utf-8?B?KzYydi9sbmlrdkpjOHYvRVRMKzlraGpaaG9OankwVDRFMjg2bGZ3TGo2TU1D?=
 =?utf-8?B?V1lHUFY5L2pVTVBMV1U0K0lOb0RWUU11Q3dVeDNnbG83am5KN0wvODlzKzY2?=
 =?utf-8?B?c0JRWkp0ODhwbzlWVUNTd0ZzWmVvQ1FtaEdGQ2JOWVJIZDNkZTk1MVpPSTZH?=
 =?utf-8?B?SDduZFYzc1R1VXlYc3NnOG9zdW5EK0EvRlE2WWR5TDBuSUNSWCtBMzNvWm14?=
 =?utf-8?B?VytIUGI5SmhrNm40eGxnNWJ2V2xTNnJKZHRLRGNZSnBUdlVKWU1oMXdBdHll?=
 =?utf-8?B?UUJhOUEvSGtETEl5RGp5dmxnck0wSm5ZOStRUVMvZlFqb2Z1UFVsbkhreGN6?=
 =?utf-8?B?cTdad014OTBTZWR4ZE85L3RsTXFYSWhGcExBY1ZXWDZVd0ZPelUwOHJRVDls?=
 =?utf-8?B?YVZRVWJaU0ZkbHNCOW5EKy9BVEVzY09Ncm1OM2xqY2NKdXhVMHBpWDBmVW45?=
 =?utf-8?B?Wm9MUnZhbUxBS3NaMU5BN29CZE1mdC9UL0lBYzhMcnI1TzJMcDFXUDA3b2gy?=
 =?utf-8?B?UXFxT01YaFVpRW02WU9PdlhZczVianBMbmJhSy9vUXNaTC9IK1VzSXF3YjNQ?=
 =?utf-8?Q?mel1N3Uj3QLYnAQbZkpipjLCjfgOBetd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d01ld0RPc2w3RjZUQkdFU2lDeXhLdU9kSjlqVHlDK0IzMW53SXpEcVVFRHZ0?=
 =?utf-8?B?YlJySnRxL0tqNEUwUmtOK0x5U1F1N0JtQTlhZFpIT09NbHNsS0kvcUI2SmN1?=
 =?utf-8?B?YzdWMkNmWXRYbE1RR0N5K2VETktDaFR4QUt2OWtMWS94WWFBeWFzUkhxbXBs?=
 =?utf-8?B?RVNzazljQncxaVBSaHljWDE5YllvL2ttMmtRMlZURUx3dG1zODkvdmU2aW56?=
 =?utf-8?B?dUhTZmhVWnlDY1k3UTB2K2FiQ1dEVmJwb1ZqaFRITXFkbGptdldOVzJiM0g2?=
 =?utf-8?B?NFU5QzZ5WkU4WmloTUFnc1BnLyt0NHVId1ZGSXlpTldKQXBVVEp5VGZsY0Y5?=
 =?utf-8?B?Vy9EMi9ZbFRKNVgzV3dCYVdIMFpKZjBNZmVIVDNLclBKR2Y2RVo2TTBuV2xJ?=
 =?utf-8?B?eUxKbms4KzNmRHhVVnhtZ3FlSjNYQ3FiTVp3ZTQwSGNkSFBhUHZTNFdpcHVi?=
 =?utf-8?B?c2dQWUhqRG95MkRtbW5VQVAvTnZpMXpLWVMwcGEzRmZhVjQxTS9qRC95QVFt?=
 =?utf-8?B?VHpTL1A5RWNTbWZVWFBGNjRRVjhidmlrcU5ST0xXaFBTTXdxbGRoY2wvbVVE?=
 =?utf-8?B?dkxPOFQ0TjIvZmNVaUM0S09PWnRlZTUwZmxEbTJtZHZZbXBGVFBDKzFSeHlU?=
 =?utf-8?B?Z2Iwa09uTkRMNFlqcGdjMzl3Q3JQSTFDVy9tNGpScXM3V2h4dEdFb3VjY3k5?=
 =?utf-8?B?bjdWNDBtVkQxZGxkVDRlbVJQZTJRYmQzQVM3RnJGc294a2R0NFhzUzZEYnho?=
 =?utf-8?B?RXJWRUZhT0pPbCt1MFRJSUd4WlNDOS9mMWw1bzRaVlQwTnRld1Z3SFdyZDZS?=
 =?utf-8?B?VmFCL0E3VWFNb2k4K3FkM2tvR3NUTGViZVpDZ2hGTENadDFDQktaVUJwTEh3?=
 =?utf-8?B?M3QvRjVtL3cyamJkNFZ2NUgzUHJuV0g5akdkQ3hPNjhwTEZsOFdTSm5ZMVNz?=
 =?utf-8?B?dnJEUHJaREFLRjhORitFeUNuVERhNk5RQitpa2FxZThEbll0WEZsZ1pjRUV1?=
 =?utf-8?B?eFRpZXoxRzFkZEhIZWs3L3FkRHFJQXRPWXcwQjR6eWw2US9zSllBa2VOQVF4?=
 =?utf-8?B?dXB0d0ZFSFF6dWtQaVR5blZ4enllbEtIbm1uUmkwcE50ZVJWWElDZ3FQazJC?=
 =?utf-8?B?bm9QZWl4SU5CRlJXRUxqQ3R3SlFENktsY0lnYTRLWDgrbGQ0Ly90Tk1nYVB3?=
 =?utf-8?B?bEJFZy9UL3NIU3FpRmRRQ0hRQWd5UFVwSmlUcll0VlplTVVFcGNhbGRmVXFh?=
 =?utf-8?B?WTI0b2EybkFLeGptT0t1V05LZ1ArbUpybytlbllrd05IQzRuY3FqZHZUUFho?=
 =?utf-8?B?YnRUWnVSaXBsdUE1UkFDeHhwdFV1VW90TnB6Z1BVUVhRWFVPb05OalpabXVw?=
 =?utf-8?B?MUhjWm5RWlV1R3ZDN052MzhZYUtrQUtuSVNEa2VJSzNuRlYzOGtoVHBSMnJV?=
 =?utf-8?B?Nm1EWGdSQTluQzRXdUZLNXdWT2RHcGlDMkJUUFNjODBvSG0xVGVESndFa2Nu?=
 =?utf-8?B?eFpaTWNTWU1hVE9JZDBoblQ3dHBIQVArakdjd3lkUEZrZXczdXlhK203eTQr?=
 =?utf-8?B?RWJUckkxSVNaeTBIRHNiMWJrZ3I0aTN3YW41MEJWMHpaTFlXYWlwczgwWGFW?=
 =?utf-8?B?MTMzcjlpTnQ2TkFzUFhyeE9JeWR3aEZrVy9mWnNHcThrWUdrMHU4N0x3L002?=
 =?utf-8?B?QWR6T0RZWTN2NXlycFBNR2k4aHVIellLYXhDdVBiRUFQNHBRSTA4MXpKSTQv?=
 =?utf-8?B?YXhNNk80ellrYTdqb2NPNzQwZzJVRmN3SmNFeE04T1daNzBYY2Y3T3Y2bkUr?=
 =?utf-8?B?QjJsSHl4clF1LzFsR3JUV1FST25SclhER21BeW81dG5IOGNSUWk1QWI1Z2pT?=
 =?utf-8?B?SCtCQ1haZUNndElCVVdkekIyTlhuUDZUM2lxdk0zUFpHM0w1NkQ4dHRLRzFB?=
 =?utf-8?B?b0pTbHpSRnI2M085MVYvSWFtM1ljTXM0NW1xZ2lUWC9OMERRZWtuZVJOU0ha?=
 =?utf-8?B?cGJJVFZDdTNBdDJwYWk4VkhLaWpXWUtUQytESXAxWWN6Y1B0QmdvUUpuSEV3?=
 =?utf-8?B?QktIamkzZ1FBMUl1QXJ3NXNtZ0RHWmM5YUJpL2dVQUZhd3JWemgyVTQvV3Nj?=
 =?utf-8?Q?4wUS2weZZnbxdD/qgSBflMX/i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86219408-af12-47ae-3a35-08de37ea51a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 12:47:46.6390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/1kZbP1JuGBckCNF1YaJE9TfSEpGYMcr2lWTAAH1q1KBgNCr1m+F0eN02obOAEp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7564
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

On 12/10/25 10:58, Philipp Stanner wrote:
> On Tue, 2025-12-09 at 17:58 -0800, Matthew Brost wrote:
>> On Tue, Dec 09, 2025 at 03:19:40PM +0100, Christian König wrote:
..
>>>>> My educated guess is that drm_sched_stop() inserted the job back into the pending list, but I still have no idea how it is possible that free_job is running after the scheduler is stopped.
>>
>> I believe I found your problem, referencing amdgpu/amdgpu_device.c here.
>>
>> 6718                 if (job)
>> 6719                         ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);

WTF! There it is! Thanks a lot for pointing that out!

>>
>> Which is after:
>>
>> 6695 skip_hw_reset:
>> 6696         r = amdgpu_device_sched_resume(&device_list, reset_context, job_signaled);
>> 6697         if (r)
>> 6698                 goto reset_unlock;
>>
>> The job is likely added back into this free list here:
>>
>> 6676         amdgpu_device_halt_activities(adev, job, reset_context, &device_list,
>> 6677                                       hive, need_emergency_restart);
>>
>> So free_job runs and 'job->pasid' explodes.

I've read over that code like a hundred times and didn't realized that the job is accessed after the scheduler resumes.

>>
>> Save off the pasid on the stack at top of this function and I suspect
>> your UAF goes away. This won't untangle this hair ball of code but I
>> believe this at least prevent explosions.
>>
>> But let’s dig in further—amdgpu_device_halt_activities calls
>> drm_sched_stop (Xe just calls drm_sched_wqueue_stop for reference). This
>> function stops the work items, then adds the offending job back to the
>> pending list, iterates over each job, removes the CB, leaving the job in
>> the pending list. If the CB can be removed, it removes the job from
>> pending, maybe calls free_job if it’s not a guilty job, and if it is a
>> guilty job, defers the free_job to the timed-out job so it doesn’t
>> disappear. Like WTF?
>>
>> Oh, it gets better—amdgpu_device_sched_resume calls drm_sched_start,
>> which iterates over the pending list and reinserts the same CB that
>> drm_sched_stop removed, then starts the scheduler. So the guilty job had
>> its CB successfully removed, and now it can immediately disappear—also
>> like WTF?
>>
>> Free_guilty is clearly a hack around the job not being reference
>> counted, and it doesn’t even work in some cases. Putting that
>> aside, I think calling free_job shouldn’t really ever happen in TDR.
>> Imagine if drm_sched_job_timedout just took a reference to the job like
>> normal kernel code—free_guilty could be dropped, and immediately this
>> all becomes safe. Likewise, if the run_job work item had a reference to
>> the job, which it takes before adding to the pending list and drops
>> after it’s done touching it in this function, then run_job and free_job
>> work items could safely execute in parallel rather than relying on an
>> ordered workqueue to keep that part of the code safe.
> 
> I can tell you how I design it in our Rust jobqueue:
> Drivers create jobs, and in submit_job() the pass ownership over the
> job to the jobqueue – IOW after pushing a job, a driver can't access it
> anymore. In the run_job() callback, the jobqueue either passes the job
> back by value (ownership) or borrows the job to the driver so that it
> can be copied (this is done so that the JQ can hypothetically do
> resubmits).
> 
> This way there is no need for refcounting (in Rust / jobqueue).
> 
> Maybe the core of the problem is not so much the lack of refcounting,
> but the lack of ownership rules. Why even would the driver need the job
> still after it got pushed? It should be fire-and-forget.

Yeah, that sounds sane to me as well and is exactly how it was initially designed in the drm_scheduler as well.

The job is basically just the information the driver needs for the submission which it gives to the scheduler on push, and the scheduler gives back to the driver on pop.

The full execution time is represented by the scheduler fence and not the job. And the scheduler fence is reference counted exactly because of the reasons Mathew brought up here.

I'm absolutely not against reference counting, what I'm pushing back is abusing the job object as something it was never designed for while we already have an object which implements exactly the needed functionality.
>>>> And my uneducated guess is that it's happening in amdgpu. It seems a
>>>> sched_job lives inside an amdgpu_job. Can the latter be freed at other
>>>> places than free_job()?
>>>
>>>>>
> 
> […]
> 
>>>>> It basically says to the driver that the job lifetime problems created by the scheduler is the driver problem and need to be worked around there.
>>>>>
>>>>
>>>> My POV still mostly is that (with the current design) the driver must
>>>> not use jobs after free_job() was invoked. And when that happens is
>>>> unpredictable.
>>>>
>>
>> This is somewhat of an absurd statement from my point of view. I have a
>> valid job pointer, then I call another function (see above for an
>> example of how drm_sched_start/stop is unsafe) and it disappears behind
>> my back.
>>
> 
> The statement is absurd because reality (the code) is absurd. We all
> are basically Alice in Wonderland, running as fast as we can just to
> remain on the same spot ^_^
> 
> What I am stating is not that this is *good*, but this is what it
> currently is like. Whether we like it or not.
> 
> The misunderstanding you and I might have is that for me jobs having to
> be refcounted is not a reality until it's reflected in code,
> documentation and, ideally, drivers.
> 
>>  The safe way to handle this is to take a local reference before
>> doing anything that could make it disappear. That is much more
>> reasonable than saying, “we have five things you can do in the
>> scheduler, and if you do any of them it isn’t safe to touch the job
>> afterward.”
> 
> Yeah, but that's drm_sched being drm_scheddy. Before I documented it
> there were also these implicit refcounting rules in run_job(), where
> the driver needs to take the reference for the scheduler for it to be
> non-racy.
> 
> It also wasn't documented for a long time that drm_sched (through
> spsc_queue) will explode if you don't use entities with a single
> producer thread.

That is actually documented, but not on the scheduler but rather the dma_fence.

And that you can only have a single producer is a requirement inherited from the dma_fence and not scheduler specific at all.

> drm_sched got here because of gross design mistakes, lots of hacks for
> few drivers, and, particularly, a strange aversion¹ against writing
> documentation. If Xe came, back in the day, to the conclusion that job
> lifetimes are fundamentally broken and that the objectively correct way
> to solve this is refcounting, then why wasn't that pushed into
> drm_sched back then?
> 
>>
>>>> To be unfair, we already have strange refcount expectations already.
>>>> But I sort of agree that there is no objectively good solution in
>>>> sight.
>>>>
>>>>>>
>>>>>> Let me respin to my documentation series and upstream that soonish,
>>>>>> than we can build on top of that.
>>>>
>>>>>>
>>>>>>
>>>>>> P.
>>>>>>
>>>>>>>
>>>>>>> 2. Move reference counting to the base DRM scheduler job object, provide a
>>>>>>>    vfunc for the final job put, and document usage. Medium invasive.
>>>>>
>>>>> I strongly think that reference counting the job object just because the scheduler needs it is a bad idea.
>>>>>
>>>>> With that we are just moving the hot potato from one side of our mouth to the other without really solving the issue.
>>>>>
>>
>> See above—I can’t say I agree with this assessment. I think the lack of
>> reference counting is exactly the problem. I don’t really understand the
>> pushback on a very well-understood concept (reference counting) in
>> Linux. I would sign up to fix the entire subsystem if we go this route.
>>
>>>>> If a driver like XE needs that for some reason than that is perfectly fine.
>>>>
>>>> Nouveau doesn't need it either.
>>>>
>>>>>
>>>>>>> 3. Move job (driver) side tracking to the scheduler fence and let it
>>>>>>>    control the lifetime. Very invasive.
>>>>>
>>>>> Thinking about it more that is actually not so much of a problem.
>>>>>
>>>>> Let me try to code something together by the end of next week or so.
>>>>
>>>> The hero Gotham needs :)
>>>>
>>
>> Are you sure about this one? I think unless the problems around
>> drm_sched_start/stop and free_guilty are fixed, my feeling is this
>> entire thing is still badly broken for anyone who wants to use those.
>>
>> To sum up this whole email: I strongly disagree with option #3, but if
>> that is the consensus, I will, of course, support the effort.
> 
> 
> I would like to discuss those topics with Danilo, too, who returns from
> LPC soonish. Also to get some more insights into Nouveau and our use-
> cases.
> 
> My suggestion is that we pick the conversation up again soonish.
> Christmas is around the corner, and I suppose we can't fix this all up
> in 2025 anyways, so we might want to give it a fresh re-spin in '26.

Since we finally found the root cause I'm all in postponing that till next year.

Christian.

> 
> 
> Greetings,
> P.
> 
> 
> 
> [¹] The strangest aversion in drm_sched, however, is the one against
> locking. Locks were only taken when *absolutely* necessary. It's as if
> the entire code was designed by some gamers who want to show their
> youtube subscribers that they can get 1fps more by changing RAM timings
> in the bios.
> drm_sched might be the component in the kernel using the most
> synchronization mechanisms: Spinlocks, RCU, atomic integers, atomic
> instructions, refcounting, READ_ONCE(), just accessing locklessly… even
> Paul McKenney would get wide eyes here. The only thing we're still
> missing is seqlocks and rw_locks, but maybe we can add those /s
> 
> That's likely sth we can't get repaired at all anymore.

