Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33297DA41
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 23:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44A210E86D;
	Fri, 20 Sep 2024 21:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l/F6rCWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6E410E869;
 Fri, 20 Sep 2024 21:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pmh96tGYwiz+uBF/ZHi22Qk6zuRyPNgjEy2LKkmwKLxgFJqeS/766ZJBy5OM9Qu6FTLM+54sEkdHhsFkc8WVpznHYtTXD/eNX66gU0VCExiyJmBwSCKSOqJnCKT2dtwvA8TCfS9stdivtxkC0dMKcQgOz0yCT8/CJt64GAtQitaR1/c3AUJIQP2Y0AaXb0mAeFZnCwPbqknxouQo0WbPfaqlNiXUHQm711cPtRuGTZi0kA1g3fP3AIcOiCGQMjd/Pa/e13kw1pWJj3imu+Doi/+boqY3f1S0LtGA0BquJSCp2wiueCxSxdXoQfWxTcRzGM06yIoqi7osfDuUzpB8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KHDtprffdunfKQoy1L4wYArc8KKRfg/GaxvgsPct4g=;
 b=YvbwYH80s9GOZMcviAreHT3unvy5orMdydLiGSNsiKnNdcOxxvPovF3M0sVHEESpsHUTMH/L6/QoKNCxExcHA902RVj7FW60uaJ8TXeQsrvqzc+SzA+gEFQILzJLjzqCQAFHV7sq9WjvzYaeNevh1xdTuWkYOnV7HkY6rmoQnXXNaUaWKGWPBTDwNgQiHmN6mByNcn8L/jbofGgOxf2wKYjPd7eFimO6RsQxLYsaYven0V16nGnFu2wwMcdqfnCj/MhT1sPg63BcNNrihq9O89Wy1CevmipDyt0PwVpwxsDxIBXbuJlkn3ve86eN1EbumERtk5V3uDFwbb/aD4xgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KHDtprffdunfKQoy1L4wYArc8KKRfg/GaxvgsPct4g=;
 b=l/F6rCWmPX3SkiClPi09N0bb/L93hC7IC9WYkLp9o7X0uizwLzBlAgPhbtSiEspWUwn4RfelV5jTIZbqLeBbg9G706qH8k6/ZiXjDeAGFfpcL1k0Bqd7zetsqqGL7mYC/2Oi+Auvs0++0VHOaJsGE2rjCF/vCMsqU3ZwJvWAmpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Fri, 20 Sep
 2024 21:22:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 21:22:31 +0000
Message-ID: <95aa3c7a-62c8-4c05-8591-893ddbe576e1@amd.com>
Date: Fri, 20 Sep 2024 17:22:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display/dsc: Refactor MST DSC Determination Policy
To: Jani Nikula <jani.nikula@intel.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, lyude@redhat.com, imre.deak@intel.com,
 simona@ffwll.ch, wayne.lin@amd.com, rodrigo.siqueira@amd.com
References: <20240919173944.256887-1-Jerry.Zuo@amd.com>
 <87h6aa98cl.fsf@intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <87h6aa98cl.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: dc74fb34-b996-41a7-2504-08dcd9ba55d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGgyZy9kM0pkdVdkcGpBckFZU1ViUlVIWVJaYkdUTkNOMWpSNitmMmYyS1R1?=
 =?utf-8?B?MFNKZCtmb08yTngwdHFwZitqR0p1R2xOd1dLTnNrRFBwbUovemNHQklvR1do?=
 =?utf-8?B?bVFRZnhqVHFiMHhBd1F0VUVQcit2S1RNS2RiWE1DS0swTnFhazFNV0hSYlBy?=
 =?utf-8?B?VFh0c3MwT3dlWnVHRko0RjhwbFF6NlVIbGFHSFFrMUp3QWpGM251c3lYZXMv?=
 =?utf-8?B?QjJtZGRrSVNQb25sM1o5aUlFTG10VUpBb0VmM1JGcHBrYU44RURQUXFXU20z?=
 =?utf-8?B?WDk1YVp3SzRPM1RIZXltMnVWVEk3ekIrd0ZSR1dsUEVhSHhlSm1GQ1dTTGx1?=
 =?utf-8?B?NmtkY0xDY0dTWTIxZlI3UkZsSG9ETTZaS2VHcGdjOWw1aFJmTElSKzA2NDFM?=
 =?utf-8?B?MWNVcW5RVmpidTI3dDdiUjQ3ZnpaN2ovMWIySDJEKzEwOE1IYkZMS2FXdm93?=
 =?utf-8?B?eVRYNU0rc3dkdGlGbWgrS1hkSVNEZ0ZQWkdFNWR4cXFmTllxOGFCclJTaElT?=
 =?utf-8?B?N1dvbmtqOUwya3U0SE82a05DU0dhTlNQNzgwK3drTFdsVjBvWVViMjlnd0ZN?=
 =?utf-8?B?dHl3a3daY053NDMrT3BFdGV3NHRBcGxRaG1ORXMxeFpMOFZWR0xScnRCdWhk?=
 =?utf-8?B?QmVQaGp2SkdtWkgrMlVySUwzWDg0YmdOSWEzd2wzZGw5MG00QVc2NXRyNU1K?=
 =?utf-8?B?Y1pMSU42SjdlVVhvSEVRS1hOU1BoUHNLdGdwR0JBUXpldmFhb2RBZDNkdnhr?=
 =?utf-8?B?YjdQUHlSTnRYYmNVTzhySDZiN2lPcHcyeVJ1R3o2YkpXa0orVUVHRFB6bVFQ?=
 =?utf-8?B?S3JXUXNqTk80NzBJWUVxRTJKTnVFYzFiWnFwUGN0eXVJbFpRcXFSRHNMOUli?=
 =?utf-8?B?dEtVY3dlWDVHVm9pdFZxeDJXRDg0bTcyM29IZFJhZDlpVXE4OXlET2Evdk1V?=
 =?utf-8?B?MGxHTlpJUjN1T05hZU9vL2VaajNtNjRNWmUyazJBdUJqSE5IZjRJTU84WWJJ?=
 =?utf-8?B?b3B3eVNSWHhwU21ZRi9mUC9QNFBBRnhCS0Ria3l6alVLYlhQZGRvRkxBaW4x?=
 =?utf-8?B?WkpIOGxJRXJ0UFo2dDR6TkozWlNKTEJaNTc4VnduQ1hoTDU2NW9GSHZkb3d4?=
 =?utf-8?B?cDhPckRCN1FNZ0RiSjFmMWZnWTVxeUw1ZWRHR0tMUjNwK0dQckJzL0JRdytl?=
 =?utf-8?B?bXd6TGFRc3htV0JXSHEvU0trM2NCclQzNDVQUFRMZmxzZTArRFZ1WG1VUmFs?=
 =?utf-8?B?dmx1NUZOU3lESGUwWURsUDh4d1FwREpwOVpkbDRCWUJBRVRpVTRIUVN3aXRI?=
 =?utf-8?B?aGRaRS9PL1pjZmlqU2kxY0dNMHU1U3JUVGd4TmZZL3QzcmtmeCttUGp6RFFw?=
 =?utf-8?B?Q0hvejRZd0l2aktmTEJ5dDBrU3ZXcjlMRlFQQTN5TUlTY1hiLy82QytVdTV5?=
 =?utf-8?B?K0tjSzhmaEpXa0Z5b29kYVdESllJVVowYStaMVNaTGJzaUJmQjRYRzNUZUJ1?=
 =?utf-8?B?ZWNBMDhReVVsZzlURXdodUtZNmx1MUdyNXZlRHNZZFd5SzNlZktZT3Bycy9G?=
 =?utf-8?B?RUUzUWlZdUVZZmxjbHNiTzI1ZkxTeUdxSVIxdC9ZdzF1NG9ZeHkwR29sQ05n?=
 =?utf-8?B?b0kzNURNcEFzdkczMjM4S2t2QzVwdzZoejNUSkxCM2Q3OG1yVEtUUStxcnVn?=
 =?utf-8?B?Qi81OTVOYUtJbzR6cVJhN1FPNnhETVl4UTMrUXZWYjhwaEF5M05RVVB4c0NB?=
 =?utf-8?B?eDRjVEJURldGNVNlUllxZTlHdGJ6YTBOS3RYU29OOXJhOE1DbWlaaE40NWFH?=
 =?utf-8?B?eUhaMEg2TiszU2ZWTC9YVkJOelNGMnZHVWdUZ2NzcjZla3VyVFBnUDhwSUVF?=
 =?utf-8?Q?sBDQ5KwtaPQtw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlpLSGNQN3NLZVV2Z1lsd1Y4dmRwQWl0aFlPd3lQZGFaNE8xREtuRUtsWktp?=
 =?utf-8?B?YTZvTnZOUEZaVFpmTlhoanVncnpSck5JR0l2WVh4NkpNOVlKdGRtMG5kbnow?=
 =?utf-8?B?T1RiU3ZyREhFdzByNm96TytFL3YwaFZKNDhtWG4rcCtmTGVTSkRFUFhmMk9E?=
 =?utf-8?B?ak1Pc0M4RVEwbG5BYVVuWjlobUo2T2hXSkhHdDNEc1NoazJkSk9OaDR0YlFl?=
 =?utf-8?B?dGNOMG9KRjhoeEhYWXRGSzMxdXc5TmZJb0poUzM4SXFMWnhURnc1K0FCZ09o?=
 =?utf-8?B?OU1oUlUwMFA3a05HRHUwNWM1QkVRVk9jZjRpaW5nMzBTZEEzcXR0b1Q5UTJH?=
 =?utf-8?B?VFJnOUlxa0xobmhORHJQOWk1dlczbldKMm95Vk5qRk1VV0ZZUUVHdk11N0JP?=
 =?utf-8?B?dUY5dXpCbUxaK2txclNkZmx4bDFwVDNwWmYvMmhVejk2QzM5N3RnV1dreDd2?=
 =?utf-8?B?Nm53elpSSU92Y0VOTGgyMXRmT3NrSUl6UWlSaVBmaW03R0YvTGloK3VpMHNI?=
 =?utf-8?B?eGlKS1dXOVFVZDJ4aDhhUnIyaElCS3F2UDFETnh6bVVDeWdxM0Z3dUtNZTVV?=
 =?utf-8?B?YlhIVi9OeFJqOVFkY2JzaUxpaTVNTjlQOW4xYnVKMnpod3JaM2YwOW5FT3Ew?=
 =?utf-8?B?bm10NVNBbTcrSkxmNFp2UmR0RnRacDM4SUZNQnluYWJzWTZIRnVvdUlpWUFy?=
 =?utf-8?B?eXJzTFBoU2FhLzhydUFtSDZmVW1XY2ZjcHpqUnFVY3N2U3pwaTZ1SlpJUFpa?=
 =?utf-8?B?NytodTVEcW15cXB4T3M3eDl4MHJmSmlGNkd3YTRUNmhTZ2dmTWV3Y1FDVnBt?=
 =?utf-8?B?dzFCTDg1cEh4RHdnMHMzWFJjNUpZWllxYXFhejVyemhMblNRcmptK2p6aEJE?=
 =?utf-8?B?UUtjbTJDWWpMNXBzUEhJL2JQV0VhLzlSRWJyeHZhbkx5czhubDkrT1ppaHps?=
 =?utf-8?B?T1VkU2hQYnBRT0JHRFZ6RW8zdjZZa2xLVXZqUW1nSUFaVGczcUJuOTNjR1RG?=
 =?utf-8?B?RHR1VWh3MnBUdC9rTjFHeDFhYVV0M0tGM1k5VHZsa0lDdko0azFMRGMvMGZz?=
 =?utf-8?B?NFN5SlhCSWduMThXUXI5K3VkTXdxZmw3b0lLamh1YjFXNUJoMUNjSmo1a1U3?=
 =?utf-8?B?MDJ0R0xhR3ExbXhTbnB3WUxrVXlkYjJ4OEhHVmlKaDFwc0NUQVRkSEFuREVo?=
 =?utf-8?B?emlzeHdjTFpzdEt1MzZlYWk2Mk9yWitFcEcwYkR5YVZleVlNNWFtZVFtZGkr?=
 =?utf-8?B?V0krRmJBSHVKdVdYVXVzMmJDNW9HWFdMMEMzMWp1cWkraUhmSWtoNTNaWjEr?=
 =?utf-8?B?b1NIZXNjajUzeXdUYXdldjhRSjkrTG9lcVd1U2FoU2E3cmE4TXltRVhrYnJ5?=
 =?utf-8?B?eEJGZVpKQ3dLajFqdjRDbU10L2RlWFRTRUVOV0VlcWdCRDJVOWNnY2JheFpU?=
 =?utf-8?B?QTZaVExhdjR1cTFlVTdkU3pQT3dLWGxEL2xlMnVkSFJWd3F5RDUrUms1Y2ww?=
 =?utf-8?B?bDBNTVlGenp0dzdCcXloVXZ6WlV1YjRRNThaM2gxdTZlN3Z2ZHBBMUNKeDg5?=
 =?utf-8?B?WWVBL1lRUUQxLzZUU013L1VVQnZ0TzNVL0M4NzMzQ0QwWks2UVRwRzRmUlp5?=
 =?utf-8?B?eWtTWlBxMDROdkFCbjBsK1dsMlhaNUFBK0VGVHllYzZINDFmcmNUNENIdFhO?=
 =?utf-8?B?WHpqN0hNYkhtenM4Y0hIci9zRFRmUlJrSXNudjNEYit3OTJPVWw0MHI2NU81?=
 =?utf-8?B?Wm50dUFERTRYNmZhdjlkLzh6Nmx3eFRHK0ZjaSs3b1NFQ2NwV1NtWnUwLzJM?=
 =?utf-8?B?SFptZDhWSFJaczR2WE51R3NMajlOYXFocFFBLzlKNTlMd2hkdWFRSWtubkV3?=
 =?utf-8?B?TkMrcTBhQXhQOWsya0RxNE45QzJ2dWNSSjlvcUMrNUtDRWg2S25JSmRCV1I1?=
 =?utf-8?B?UDN1bUVaNDhBU1doYTlYazFwb2FmZUhnMDdKUEV4YThoMEoyUmhmSklFZlhE?=
 =?utf-8?B?ZTFWYmNycXM4L0MweE54Tm9vU0lzS09lZXNjZUp6UEx0L3BLbDdOaTNEaCtC?=
 =?utf-8?B?ZnhBNSs5ZmlPbHVLZXd3WkN5SGJ5LzlOdTZDS2ZaMnFYZ1JaM1hVQXU0UTNv?=
 =?utf-8?Q?23SKEajyq3h9LtKtc3H65/kj0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc74fb34-b996-41a7-2504-08dcd9ba55d2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 21:22:30.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkGJ3W4Hztwk2sX7HDN7EW0PRxA9zeuG28PHKS3jj353dcE3Z+mcmlL11GuaBsVCSS6/LbN9GAS4Zq2cEu5cpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
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



On 2024-09-20 01:56, Jani Nikula wrote:
> On Thu, 19 Sep 2024, Fangzhi Zuo <Jerry.Zuo@amd.com> wrote:
>> [why]
>> How we determine the dsc_aux used for dsc decompression in
>> drm_dp_mst_dsc_aux_for_port() today having some defects:
>>
>> 1. The method how we determine a connected peer device is virtual or not
>>    in drm_dp_mst_is_virtual_dpcd() is not always correct. There are DP1.4 products
>>    in the market which don't fully comply with DP spec to enumerate virtual peer device.
>>    That leads to existing logic defects. For example:
>>
>>    -  Some 1.4 mst hubs with hdmi output port don't enumerate virtual dpcd/peer device.
>>       When probing the hub, its topology is constructed with a branch device only, with
>>       peer device type set as DP-to-Legacy converter for its HDMI output port.
>>       Under this condition, drm_dp_mst_is_virtual_dpcd() will still determine it's connected
>>       with a virtual peer device with virtual dpcd. And results in the section for
>>       analyzing DP-to-DP peer device case of drm_dp_mst_dsc_aux_for_port(). That's logically
>>       incorrect.
>>
>> 2. Existing routine is designed based on analyzing different connected peer device types, such
>>    as dp-dp, dp-hdmi peer device, and virtual sink. Such categorization is redundant and unnecessary.
>>    The key info of determining where to do dsc decompression relies on the dsc capability from dpcd
>>    only. No matter the mst branch device enumerates virtual dpcd or not, if it's supporting dsc, it
>>    must declare it's dsc capability at somewhere within its responded topology.
>>
>> 3. Synaptics quirk analyzing today is unnecessary as long as we determine dsc aux generically
>>    by dpcd info.
>>
>> Based on above, we would like to refactor the logic how we determine the dsc aux today a bit.
>>
>> [how]
>> Ideally, dsc_aux should be determined by the topology connection status and
>> dpcd capability info only. In this way, dsc aux could be determined in a more generic
>> way, instead of enumerating and analyzing on different connected peer device types.
>> We construct the refactored algorithm into 2 parts:
>>
>> 1. Firstly, deal with all known quirks or w/a for branch devices in the market that
>>    don't comply with DP spec and can't determine its dsc aux in a generic way.
>>    e.g. Force to pick root aux as the dsc decompression point.
>>
>> 2. Refine the dsc determination policy by generalizing detection solely based on
>>    topology connection status and dpcd info, instead of analyzing it by enumerating
>>    different connection types of the peer device.
>>
>> In addition, we add parsing vendor data 0x50C ~ 0x50F into dpcd quirk routine for
>> expanding the ability to determine specific dock products that shall pick root aux as the
>> dsc decompression point.
> 
> Too many changes in one patch. Please split up.
> 

Thanks, Jani. Agreed.

Harry

> BR,
> Jani.
> 
>>
>> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
>> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
>> ---
>>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   2 +-
>>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 +-
>>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  59 +---
>>  drivers/gpu/drm/display/drm_dp_helper.c       |  30 +-
>>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 259 ++++++++----------
>>  drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
>>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
>>  include/drm/display/drm_dp.h                  |   1 +
>>  include/drm/display/drm_dp_helper.h           |   8 +
>>  include/drm/display/drm_dp_mst_helper.h       |   5 +-
>>  10 files changed, 181 insertions(+), 208 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> index db56b0aa5454..0da703f4ccac 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> @@ -1370,7 +1370,7 @@ static int dp_dsc_fec_support_show(struct seq_file *m, void *data)
>>  			 * enable DSC on the sink device or on MST branch
>>  			 * its connected to.
>>  			 */
>> -			if (aconnector->dsc_aux) {
>> +			if (aconnector->mst_output_port->dsc_aux) {
>>  				is_fec_supported = true;
>>  				is_dsc_supported = true;
>>  			}
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index 50109d13d967..f3613f38b9b8 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -806,20 +806,20 @@ bool dm_helpers_dp_write_dsc_enable(
>>  	uint8_t ret = 0;
>>  
>>  	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
>> -		if (!aconnector->dsc_aux)
>> +		if (!aconnector->mst_output_port->dsc_aux)
>>  			return false;
>>  
>>  		// apply w/a to synaptics
>>  		if (needs_dsc_aux_workaround(aconnector->dc_link) &&
>>  		    (aconnector->mst_downstream_port_present.byte & 0x7) != 0x3)
>>  			return write_dsc_enable_synaptics_non_virtual_dpcd_mst(
>> -				aconnector->dsc_aux, stream, enable_dsc);
>> +				aconnector->mst_output_port->dsc_aux, stream, enable_dsc);
>>  
>>  		port = aconnector->mst_output_port;
>>  
>>  		if (enable) {
>> -			if (port->passthrough_aux) {
>> -				ret = drm_dp_dpcd_write(port->passthrough_aux,
>> +			if (port->dsc_passthrough_aux) {
>> +				ret = drm_dp_dpcd_write(port->dsc_passthrough_aux,
>>  							DP_DSC_ENABLE,
>>  							&enable_passthrough, 1);
>>  				drm_dbg_dp(dev,
>> @@ -827,24 +827,24 @@ bool dm_helpers_dp_write_dsc_enable(
>>  					   ret);
>>  			}
>>  
>> -			ret = drm_dp_dpcd_write(aconnector->dsc_aux,
>> +			ret = drm_dp_dpcd_write(aconnector->mst_output_port->dsc_aux,
>>  						DP_DSC_ENABLE, &enable_dsc, 1);
>>  			drm_dbg_dp(dev,
>>  				   "MST_DSC Sent DSC decoding enable to %s port, ret = %u\n",
>> -				   (port->passthrough_aux) ? "remote RX" :
>> +				   (port->dsc_passthrough_aux) ? "remote RX" :
>>  				   "virtual dpcd",
>>  				   ret);
>>  		} else {
>> -			ret = drm_dp_dpcd_write(aconnector->dsc_aux,
>> +			ret = drm_dp_dpcd_write(aconnector->mst_output_port->dsc_aux,
>>  						DP_DSC_ENABLE, &enable_dsc, 1);
>>  			drm_dbg_dp(dev,
>>  				   "MST_DSC Sent DSC decoding disable to %s port, ret = %u\n",
>> -				   (port->passthrough_aux) ? "remote RX" :
>> +				   (port->dsc_passthrough_aux) ? "remote RX" :
>>  				   "virtual dpcd",
>>  				   ret);
>>  
>> -			if (port->passthrough_aux) {
>> -				ret = drm_dp_dpcd_write(port->passthrough_aux,
>> +			if (port->dsc_passthrough_aux) {
>> +				ret = drm_dp_dpcd_write(port->dsc_passthrough_aux,
>>  							DP_DSC_ENABLE,
>>  							&enable_passthrough, 1);
>>  				drm_dbg_dp(dev,
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> index 6b5eed37532b..61ee3c38a29a 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> @@ -183,8 +183,8 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
>>  		dc_sink_release(dc_sink);
>>  		aconnector->dc_sink = NULL;
>>  		aconnector->edid = NULL;
>> -		aconnector->dsc_aux = NULL;
>> -		port->passthrough_aux = NULL;
>> +		aconnector->mst_output_port->dsc_aux = NULL;
>> +		aconnector->mst_output_port->dsc_passthrough_aux = NULL;
>>  	}
>>  
>>  	aconnector->mst_status = MST_STATUS_DEFAULT;
>> @@ -214,21 +214,6 @@ bool needs_dsc_aux_workaround(struct dc_link *link)
>>  }
>>  
>>  #if defined(CONFIG_DRM_AMD_DC_FP)
>> -static bool is_synaptics_cascaded_panamera(struct dc_link *link, struct drm_dp_mst_port *port)
>> -{
>> -	u8 branch_vendor_data[4] = { 0 }; // Vendor data 0x50C ~ 0x50F
>> -
>> -	if (drm_dp_dpcd_read(port->mgr->aux, DP_BRANCH_VENDOR_SPECIFIC_START, &branch_vendor_data, 4) == 4) {
>> -		if (link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_90CC24 &&
>> -				IS_SYNAPTICS_CASCADED_PANAMERA(link->dpcd_caps.branch_dev_name, branch_vendor_data)) {
>> -			DRM_INFO("Synaptics Cascaded MST hub\n");
>> -			return true;
>> -		}
>> -	}
>> -
>> -	return false;
>> -}
>> -
>>  static bool validate_dsc_caps_on_connector(struct amdgpu_dm_connector *aconnector)
>>  {
>>  	struct dc_sink *dc_sink = aconnector->dc_sink;
>> @@ -237,32 +222,14 @@ static bool validate_dsc_caps_on_connector(struct amdgpu_dm_connector *aconnecto
>>  	u8 dsc_branch_dec_caps_raw[3] = { 0 };	// DSC branch decoder caps 0xA0 ~ 0xA2
>>  	u8 *dsc_branch_dec_caps = NULL;
>>  
>> -	aconnector->dsc_aux = drm_dp_mst_dsc_aux_for_port(port);
>> -
>> -	/*
>> -	 * drm_dp_mst_dsc_aux_for_port() will return NULL for certain configs
>> -	 * because it only check the dsc/fec caps of the "port variable" and not the dock
>> -	 *
>> -	 * This case will return NULL: DSC capabe MST dock connected to a non fec/dsc capable display
>> -	 *
>> -	 * Workaround: explicitly check the use case above and use the mst dock's aux as dsc_aux
>> -	 *
>> -	 */
>> -	if (!aconnector->dsc_aux && !port->parent->port_parent &&
>> -	    needs_dsc_aux_workaround(aconnector->dc_link))
>> -		aconnector->dsc_aux = &aconnector->mst_root->dm_dp_aux.aux;
>> -
>> -	/* synaptics cascaded MST hub case */
>> -	if (is_synaptics_cascaded_panamera(aconnector->dc_link, port))
>> -		aconnector->dsc_aux = port->mgr->aux;
>> -
>> -	if (!aconnector->dsc_aux)
>> +	drm_dp_mst_dsc_aux_for_port(port);
>> +	if (!aconnector->mst_output_port->dsc_aux)
>>  		return false;
>>  
>> -	if (drm_dp_dpcd_read(aconnector->dsc_aux, DP_DSC_SUPPORT, dsc_caps, 16) < 0)
>> +	if (drm_dp_dpcd_read(aconnector->mst_output_port->dsc_aux, DP_DSC_SUPPORT, dsc_caps, 16) < 0)
>>  		return false;
>>  
>> -	if (drm_dp_dpcd_read(aconnector->dsc_aux,
>> +	if (drm_dp_dpcd_read(aconnector->mst_output_port->dsc_aux,
>>  			DP_DSC_BRANCH_OVERALL_THROUGHPUT_0, dsc_branch_dec_caps_raw, 3) == 3)
>>  		dsc_branch_dec_caps = dsc_branch_dec_caps_raw;
>>  
>> @@ -279,10 +246,10 @@ static bool retrieve_downstream_port_device(struct amdgpu_dm_connector *aconnect
>>  {
>>  	union dp_downstream_port_present ds_port_present;
>>  
>> -	if (!aconnector->dsc_aux)
>> +	if (!aconnector->mst_output_port->dsc_aux)
>>  		return false;
>>  
>> -	if (drm_dp_dpcd_read(aconnector->dsc_aux, DP_DOWNSTREAMPORT_PRESENT, &ds_port_present, 1) < 0) {
>> +	if (drm_dp_dpcd_read(aconnector->mst_output_port->dsc_aux, DP_DOWNSTREAMPORT_PRESENT, &ds_port_present, 1) < 0) {
>>  		DRM_INFO("Failed to read downstream_port_present 0x05 from DFP of branch device\n");
>>  		return false;
>>  	}
>> @@ -501,8 +468,8 @@ dm_dp_mst_detect(struct drm_connector *connector,
>>  		dc_sink_release(aconnector->dc_sink);
>>  		aconnector->dc_sink = NULL;
>>  		aconnector->edid = NULL;
>> -		aconnector->dsc_aux = NULL;
>> -		port->passthrough_aux = NULL;
>> +		aconnector->mst_output_port->dsc_aux = NULL;
>> +		aconnector->mst_output_port->dsc_passthrough_aux = NULL;
>>  
>>  		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>>  			MST_REMOTE_EDID | MST_ALLOCATE_NEW_PAYLOAD | MST_CLEAR_ALLOCATED_PAYLOAD,
>> @@ -1293,7 +1260,7 @@ static bool is_dsc_need_re_compute(
>>  			continue;
>>  
>>  		aconnector = (struct amdgpu_dm_connector *) stream->dm_stream_context;
>> -		if (!aconnector || !aconnector->dsc_aux)
>> +		if (!aconnector || !aconnector->mst_output_port->dsc_aux)
>>  			continue;
>>  
>>  		stream_on_link[new_stream_on_link_num] = aconnector;
>> @@ -1778,13 +1745,13 @@ enum dc_status dm_dp_mst_is_port_support_mode(
>>  	}
>>  
>>  	/*DSC necessary case*/
>> -	if (!aconnector->dsc_aux)
>> +	if (!aconnector->mst_output_port->dsc_aux)
>>  		return DC_FAIL_BANDWIDTH_VALIDATE;
>>  
>>  	if (is_dsc_common_config_possible(stream, &bw_range)) {
>>  
>>  		/*capable of dsc passthough. dsc bitstream along the entire path*/
>> -		if (aconnector->mst_output_port->passthrough_aux) {
>> +		if (aconnector->mst_output_port->dsc_passthrough_aux) {
>>  			if (bw_range.min_kbps > end_to_end_bw_in_kbps) {
>>  				DRM_DEBUG_DRIVER("MST_DSC dsc passthrough and decode at endpoint"
>>  						 "Max dsc compression bw can't fit into end-to-end bw\n");
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> index 6ee51003de3c..fedeec8f8bea 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -2259,6 +2259,7 @@ EXPORT_SYMBOL(drm_dp_stop_crc);
>>  struct dpcd_quirk {
>>  	u8 oui[3];
>>  	u8 device_id[6];
>> +	u8 vendor_data[4];
>>  	bool is_branch;
>>  	u32 quirks;
>>  };
>> @@ -2266,26 +2267,31 @@ struct dpcd_quirk {
>>  #define OUI(first, second, third) { (first), (second), (third) }
>>  #define DEVICE_ID(first, second, third, fourth, fifth, sixth) \
>>  	{ (first), (second), (third), (fourth), (fifth), (sixth) }
>> +#define VENDOR_DATA(first, second, third, fourth) \
>> +	{ (first), (second), (third), (fourth) }
>>  
>>  #define DEVICE_ID_ANY	DEVICE_ID(0, 0, 0, 0, 0, 0)
>> +#define VENDOR_DATA_ANY	VENDOR_DATA(0, 0, 0, 0)
>>  
>>  static const struct dpcd_quirk dpcd_quirk_list[] = {
>>  	/* Analogix 7737 needs reduced M and N at HBR2 link rates */
>> -	{ OUI(0x00, 0x22, 0xb9), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_CONSTANT_N) },
>> +	{ OUI(0x00, 0x22, 0xb9), DEVICE_ID_ANY, VENDOR_DATA_ANY, true, BIT(DP_DPCD_QUIRK_CONSTANT_N) },
>>  	/* LG LP140WF6-SPM1 eDP panel */
>> -	{ OUI(0x00, 0x22, 0xb9), DEVICE_ID('s', 'i', 'v', 'a', 'r', 'T'), false, BIT(DP_DPCD_QUIRK_CONSTANT_N) },
>> +	{ OUI(0x00, 0x22, 0xb9), DEVICE_ID('s', 'i', 'v', 'a', 'r', 'T'), VENDOR_DATA_ANY, false, BIT(DP_DPCD_QUIRK_CONSTANT_N) },
>>  	/* Apple panels need some additional handling to support PSR */
>> -	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_NO_PSR) },
>> +	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID_ANY, VENDOR_DATA_ANY, false, BIT(DP_DPCD_QUIRK_NO_PSR) },
>>  	/* CH7511 seems to leave SINK_COUNT zeroed */
>> -	{ OUI(0x00, 0x00, 0x00), DEVICE_ID('C', 'H', '7', '5', '1', '1'), false, BIT(DP_DPCD_QUIRK_NO_SINK_COUNT) },
>> +	{ OUI(0x00, 0x00, 0x00), DEVICE_ID('C', 'H', '7', '5', '1', '1'), VENDOR_DATA_ANY, false, BIT(DP_DPCD_QUIRK_NO_SINK_COUNT) },
>>  	/* Synaptics DP1.4 MST hubs can support DSC without virtual DPCD */
>> -	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
>> +	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, VENDOR_DATA_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
>>  	/* Synaptics DP1.4 MST hubs require DSC for some modes on which it applies HBLANK expansion. */
>> -	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>> +	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, VENDOR_DATA_ANY, true, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>>  	/* MediaTek panels (at least in U3224KBA) require DSC for modes with a short HBLANK on UHBR links. */
>> -	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>> +	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, VENDOR_DATA_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>>  	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
>> -	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
>> +	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), VENDOR_DATA_ANY, false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
>> +	/* Lenovo dock that needs root branch for dsc */
>> +	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID(83, 89, 78, 65, 83, 50), VENDOR_DATA(4, 6, 90, 0), true, BIT(DP_DPCD_QUIRK_DSC_MUST_ROOT_DECOMPRESSION) },
>>  };
>>  
>>  #undef OUI
>> @@ -2305,6 +2311,7 @@ drm_dp_get_quirks(const struct drm_dp_dpcd_ident *ident, bool is_branch)
>>  	u32 quirks = 0;
>>  	int i;
>>  	u8 any_device[] = DEVICE_ID_ANY;
>> +	u8 any_vendor[] = VENDOR_DATA_ANY;
>>  
>>  	for (i = 0; i < ARRAY_SIZE(dpcd_quirk_list); i++) {
>>  		quirk = &dpcd_quirk_list[i];
>> @@ -2319,6 +2326,10 @@ drm_dp_get_quirks(const struct drm_dp_dpcd_ident *ident, bool is_branch)
>>  		    memcmp(quirk->device_id, ident->device_id, sizeof(ident->device_id)) != 0)
>>  			continue;
>>  
>> +		if (memcmp(quirk->vendor_data, any_vendor, sizeof(any_vendor)) != 0 &&
>> +		    memcmp(quirk->vendor_data, ident->vendor_data, sizeof(ident->vendor_data)) != 0)
>> +			continue;
>> +
>>  		quirks |= quirk->quirks;
>>  	}
>>  
>> @@ -2344,10 +2355,11 @@ static void drm_dp_dump_desc(struct drm_dp_aux *aux,
>>  	const struct drm_dp_dpcd_ident *ident = &desc->ident;
>>  
>>  	drm_dbg_kms(aux->drm_dev,
>> -		    "%s: %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
>> +		    "%s: %s: OUI %*phD dev-ID %*pE vendor-DATA %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
>>  		    aux->name, device_name,
>>  		    (int)sizeof(ident->oui), ident->oui,
>>  		    (int)strnlen(ident->device_id, sizeof(ident->device_id)), ident->device_id,
>> +		    (int)strnlen(ident->vendor_data, sizeof(ident->vendor_data)), ident->vendor_data,
>>  		    ident->hw_rev >> 4, ident->hw_rev & 0xf,
>>  		    ident->sw_major_rev, ident->sw_minor_rev,
>>  		    desc->quirks);
>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> index a040d7dfced1..85fa9234b46d 100644
>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> @@ -2258,6 +2258,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
>>  	drm_dbg_kms(port->mgr->dev, "unregistering %s remote bus for %s\n",
>>  		    port->aux.name, connector->kdev->kobj.name);
>>  	drm_dp_aux_unregister_devnode(&port->aux);
>> +	port->dsc_aux = NULL;
>> +	port->dsc_passthrough_aux = NULL;
>>  }
>>  EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
>>  
>> @@ -5445,7 +5447,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state, struct drm
>>  		if (!crtc)
>>  			continue;
>>  
>> -		if (!drm_dp_mst_dsc_aux_for_port(pos->port))
>> +		drm_dp_mst_dsc_aux_for_port(pos->port);
>> +		if (!pos->port->dsc_aux)
>>  			continue;
>>  
>>  		crtc_state = drm_atomic_get_crtc_state(mst_state->base.state, crtc);
>> @@ -5994,57 +5997,6 @@ static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port)
>>  	i2c_del_adapter(&port->aux.ddc);
>>  }
>>  
>> -/**
>> - * drm_dp_mst_is_virtual_dpcd() - Is the given port a virtual DP Peer Device
>> - * @port: The port to check
>> - *
>> - * A single physical MST hub object can be represented in the topology
>> - * by multiple branches, with virtual ports between those branches.
>> - *
>> - * As of DP1.4, An MST hub with internal (virtual) ports must expose
>> - * certain DPCD registers over those ports. See sections 2.6.1.1.1
>> - * and 2.6.1.1.2 of Display Port specification v1.4 for details.
>> - *
>> - * May acquire mgr->lock
>> - *
>> - * Returns:
>> - * true if the port is a virtual DP peer device, false otherwise
>> - */
>> -static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
>> -{
>> -	struct drm_dp_mst_port *downstream_port;
>> -
>> -	if (!port || port->dpcd_rev < DP_DPCD_REV_14)
>> -		return false;
>> -
>> -	/* Virtual DP Sink (Internal Display Panel) */
>> -	if (drm_dp_mst_port_is_logical(port))
>> -		return true;
>> -
>> -	/* DP-to-HDMI Protocol Converter */
>> -	if (port->pdt == DP_PEER_DEVICE_DP_LEGACY_CONV &&
>> -	    !port->mcs &&
>> -	    port->ldps)
>> -		return true;
>> -
>> -	/* DP-to-DP */
>> -	mutex_lock(&port->mgr->lock);
>> -	if (port->pdt == DP_PEER_DEVICE_MST_BRANCHING &&
>> -	    port->mstb &&
>> -	    port->mstb->num_ports == 2) {
>> -		list_for_each_entry(downstream_port, &port->mstb->ports, next) {
>> -			if (downstream_port->pdt == DP_PEER_DEVICE_SST_SINK &&
>> -			    !downstream_port->input) {
>> -				mutex_unlock(&port->mgr->lock);
>> -				return true;
>> -			}
>> -		}
>> -	}
>> -	mutex_unlock(&port->mgr->lock);
>> -
>> -	return false;
>> -}
>> -
>>  /**
>>   * drm_dp_mst_aux_for_parent() - Get the AUX device for an MST port's parent
>>   * @port: MST port whose parent's AUX device is returned
>> @@ -6074,114 +6026,145 @@ EXPORT_SYMBOL(drm_dp_mst_aux_for_parent);
>>   * This operation can be expensive (up to four aux reads), so
>>   * the caller should cache the return.
>>   *
>> - * Returns:
>> - * NULL if DSC cannot be enabled on this port, otherwise the aux device
>> + * port->dsc_aux - point for dsc decompression
>> + * port->dsc_passthrough_aux - point for dsc passthrough
>> + *
>>   */
>> -struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>> +void drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>>  {
>> -	struct drm_dp_mst_port *immediate_upstream_port;
>> -	struct drm_dp_aux *immediate_upstream_aux;
>> -	struct drm_dp_mst_port *fec_port;
>> +	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
>> +	struct drm_dp_mst_port *immediate_upstream_port = NULL;
>> +	struct drm_dp_mst_port *fec_port = NULL;
>> +	struct drm_dp_mst_port *dsc_port = NULL;
>> +	struct drm_dp_aux *upstream_aux;
>>  	struct drm_dp_desc desc = {};
>> -	u8 endpoint_fec;
>> -	u8 endpoint_dsc;
>> +	bool end_has_dpcd = (port->dpcd_rev > 0);
>> +	u8 endpoint_dsc = 0;
>> +	u8 upstream_dsc;
>> +	u8 fec_cap;
>>  
>>  	if (!port)
>> -		return NULL;
>> +		return;
>> +
>> +	port->dsc_aux = NULL;
>> +	port->dsc_passthrough_aux = NULL;
>> +
>> +	/* Check special case first */
>> +	if (drm_dp_read_desc(mgr->aux, &desc, true) == 0) {
>> +		if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_MUST_ROOT_DECOMPRESSION)) {
>> +			port->dsc_aux = mgr->aux;
>> +			drm_info(mgr->dev, "MST_DSC DSC_MUST_ROOT_DECODING w/a\n");
>> +			return;
>> +		}
>> +	}
>> +
>> +	/* Policy start */
>> +	if (!drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
>> +		drm_err(mgr->dev,
>> +			"MST_DSC Can't determine dsc aux for port %p which is not connected to end device\n",
>> +			port);
>> +		return;
>> +	}
>>  
>>  	if (port->parent->port_parent)
>>  		immediate_upstream_port = port->parent->port_parent;
>> -	else
>> -		immediate_upstream_port = NULL;
>>  
>> -	fec_port = immediate_upstream_port;
>> -	while (fec_port) {
>> -		/*
>> -		 * Each physical link (i.e. not a virtual port) between the
>> -		 * output and the primary device must support FEC
>> -		 */
>> -		if (!drm_dp_mst_is_virtual_dpcd(fec_port) &&
>> -		    !fec_port->fec_capable)
>> -			return NULL;
>> +	if (end_has_dpcd) {
>> +		drm_info(mgr->dev, "MST_DSC check port->aux for dsc decompression capability\n");
>> +		if (drm_dp_dpcd_read(&port->aux, DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1) {
>> +			drm_err(mgr->dev, "MST_DSC Can't retrieve dsc caps from endpoint port\n");
>> +			goto out_dsc_fail;
>> +		}
>> +	}
>>  
>> -		fec_port = fec_port->parent->port_parent;
>> +	if (immediate_upstream_port) {
>> +		upstream_aux = &immediate_upstream_port->aux;
>> +		drm_info(mgr->dev, "MST_DSC check immediate_upstream_port->aux for dsc passthrough capability\n");
>> +	} else {
>> +		upstream_aux = mgr->aux;
>> +		drm_info(mgr->dev, "MST_DSC check mgr->aux for dsc passthrough capability\n");
>>  	}
>>  
>> -	/* DP-to-DP peer device */
>> -	if (drm_dp_mst_is_virtual_dpcd(immediate_upstream_port)) {
>> -		u8 upstream_dsc;
>> -
>> -		if (drm_dp_dpcd_read(&port->aux,
>> -				     DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
>> -			return NULL;
>> -		if (drm_dp_dpcd_read(&port->aux,
>> -				     DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
>> -			return NULL;
>> -		if (drm_dp_dpcd_read(&immediate_upstream_port->aux,
>> -				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
>> -			return NULL;
>> -
>> -		/* Enpoint decompression with DP-to-DP peer device */
>> -		if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
>> -		    (endpoint_fec & DP_FEC_CAPABLE) &&
>> -		    (upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED)) {
>> -			port->passthrough_aux = &immediate_upstream_port->aux;
>> -			return &port->aux;
>> -		}
>> +	if (drm_dp_dpcd_read(upstream_aux, DP_DSC_SUPPORT, &upstream_dsc, 1) != 1) {
>> +		drm_err(mgr->dev, "MST_DSC Can't retrieve dsc caps from upstream port\n");
>> +		goto out_dsc_fail;
>> +	}
>>  
>> -		/* Virtual DPCD decompression with DP-to-DP peer device */
>> -		return &immediate_upstream_port->aux;
>> +	/* Consider passthrough as the first option for dsc_aux/dsc_passthrough_aux */
>> +	if (endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED &&
>> +			upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED) {
>> +		dsc_port = port;
>> +		port->dsc_aux = &port->aux;
>> +		port->dsc_passthrough_aux = upstream_aux;
>> +		drm_info(mgr->dev, "MST_DSC dsc passthrough virtual peer device and decompression at endpoint\n");
>>  	}
>>  
>> -	/* Virtual DPCD decompression with DP-to-HDMI or Virtual DP Sink */
>> -	if (drm_dp_mst_is_virtual_dpcd(port))
>> -		return &port->aux;
>> +	if (!dsc_port) {
>> +		if (!immediate_upstream_port) {
>> +			/* Topology with 1 mstb only
>> +			 * directly connected dp2.0 case which is enumerated as 1-to-1
>> +			 * sst branch device that output pdt is stream sink
>> +			 */
>> +			if (upstream_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
>> +				port->dsc_aux = mgr->aux;
>>  
>> -	/*
>> -	 * Synaptics quirk
>> -	 * Applies to ports for which:
>> -	 * - Physical aux has Synaptics OUI
>> -	 * - DPv1.4 or higher
>> -	 * - Port is on primary branch device
>> -	 * - Not a VGA adapter (DP_DWN_STRM_PORT_TYPE_ANALOG)
>> -	 */
>> -	if (immediate_upstream_port)
>> -		immediate_upstream_aux = &immediate_upstream_port->aux;
>> -	else
>> -		immediate_upstream_aux = port->mgr->aux;
>> +			if (!port->dsc_aux) {
>> +				drm_err(mgr->dev, "MST_DSC dsc decompression not support at root branch\n");
>> +				goto out_dsc_fail;
>> +			}
>>  
>> -	if (drm_dp_read_desc(immediate_upstream_aux, &desc, true))
>> -		return NULL;
>> +			drm_info(mgr->dev, "MST_DSC topology with 1 mstb only, dsc decompression at root branch\n");
>> +		} else {
>> +			/* Topology with multiple mstbs */
>> +			dsc_port = immediate_upstream_port;
>> +			endpoint_dsc = upstream_dsc;
>> +
>> +			if (endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
>> +				port->dsc_aux = &dsc_port->aux;
>> +			else {
>> +				drm_err(mgr->dev,
>> +					"MST_DSC dsc decompression not support at immediate_upstream_port %p\n",
>> +					dsc_port);
>> +				goto out_dsc_fail;
>> +			}
>>  
>> -	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD)) {
>> -		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
>> +			drm_info(mgr->dev, "MST_DSC topology with multiple mstbs, dsc decompression at virtual peer device\n");
>> +		}
>> +	}
>>  
>> -		if (drm_dp_read_dpcd_caps(immediate_upstream_aux, dpcd_ext) < 0)
>> -			return NULL;
>> +	/* Check the virtual channel from source till dsc port link support FEC */
>> +	fec_port = dsc_port;
>> +	while (fec_port) {
>> +		/*
>> +		 * Each link between the output and the source
>> +		 * must support FEC. Note that virtual dpcd fec is identical
>> +		 * to the fec capability of it's MST BU's DPRx
>> +		 */
>> +		if (!fec_port->fec_capable) {
>> +			/* enum path result of virtual peer device will return fec_capable as false */
>> +			if ((drm_dp_dpcd_read(&fec_port->aux, DP_FEC_CAPABILITY, &fec_cap, 1) != 1) ||
>> +					!(fec_cap & DP_FEC_CAPABLE)) {
>> +				drm_err(mgr->dev, "MST_DSC Failed to retrieve fec caps at port %p\n", fec_port);
>> +				goto out_dsc_fail;
>> +			}
>> +			fec_port->fec_capable = true;
>> +		}
>>  
>> -		if (dpcd_ext[DP_DPCD_REV] >= DP_DPCD_REV_14 &&
>> -		    ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT) &&
>> -		    ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_TYPE_MASK)
>> -		     != DP_DWN_STRM_PORT_TYPE_ANALOG)))
>> -			return immediate_upstream_aux;
>> +		fec_port = fec_port->parent->port_parent;
>>  	}
>>  
>> -	/*
>> -	 * The check below verifies if the MST sink
>> -	 * connected to the GPU is capable of DSC -
>> -	 * therefore the endpoint needs to be
>> -	 * both DSC and FEC capable.
>> -	 */
>> -	if (drm_dp_dpcd_read(&port->aux,
>> -	   DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
>> -		return NULL;
>> -	if (drm_dp_dpcd_read(&port->aux,
>> -	   DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
>> -		return NULL;
>> -	if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
>> -	   (endpoint_fec & DP_FEC_CAPABLE))
>> -		return &port->aux;
>> +	/* Ensure fec between source and the connected DPRx */
>> +	if ((drm_dp_dpcd_read(mgr->aux, DP_FEC_CAPABILITY, &fec_cap, 1) != 1) ||
>> +			!(fec_cap & DP_FEC_CAPABLE)) {
>> +		drm_err(mgr->dev, "MST_DSC fec not supported between source and the connected DPRx\n");
>> +		goto out_dsc_fail;
>> +	}
>>  
>> -	return NULL;
>> +	return;
>> +
>> +out_dsc_fail:
>> +	port->dsc_aux = NULL;
>> +	port->dsc_passthrough_aux = NULL;
>> +	return;
>>  }
>>  EXPORT_SYMBOL(drm_dp_mst_dsc_aux_for_port);
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index a1fcedfd404b..d39a7c6f5bfa 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -3219,7 +3219,7 @@ intel_dp_sink_set_dsc_passthrough(const struct intel_connector *connector,
>>  {
>>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>>  	struct drm_dp_aux *aux = connector->port ?
>> -				 connector->port->passthrough_aux : NULL;
>> +				 connector->port->dsc_passthrough_aux : NULL;
>>  
>>  	if (!aux)
>>  		return;
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> index 15541932b809..73cb1c673525 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> @@ -1699,7 +1699,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>>  
>>  	intel_dp_init_modeset_retry_work(intel_connector);
>>  
>> -	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
>> +	drm_dp_mst_dsc_aux_for_port(port);
>> +	intel_connector->dp.dsc_decompression_aux = port->dsc_aux;
>>  	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
>>  	intel_connector->dp.dsc_hblank_expansion_quirk =
>>  		detect_dsc_hblank_expansion_quirk(intel_connector);
>> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
>> index a6f8b098c56f..fa454506866b 100644
>> --- a/include/drm/display/drm_dp.h
>> +++ b/include/drm/display/drm_dp.h
>> @@ -980,6 +980,7 @@
>>  #define DP_BRANCH_REVISION_START            0x509
>>  #define DP_BRANCH_HW_REV                    0x509
>>  #define DP_BRANCH_SW_REV                    0x50A
>> +#define DP_BRANCH_VENDOR_SPECIFIC_START     0x50C
>>  
>>  /* Link/Sink Device Power Control */
>>  #define DP_SET_POWER                        0x600
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> index 279624833ea9..5eb583004d00 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -643,6 +643,7 @@ struct drm_dp_dpcd_ident {
>>  	u8 hw_rev;
>>  	u8 sw_major_rev;
>>  	u8 sw_minor_rev;
>> +	u8 vendor_data[4];
>>  } __packed;
>>  
>>  /**
>> @@ -711,6 +712,13 @@ enum drm_dp_quirk {
>>  	 * requires enabling DSC.
>>  	 */
>>  	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
>> +	/**
>> +	 * @DP_DPCD_QUIRK_DSC_MUST_ROOT_DECOMPRESSION:
>> +	 *
>> +	 * The device has internal virutual dpcd with dsc decoding cap,
>> +	 * but dsc decoding must be done at root mstb.
>> +	 */
>> +	DP_DPCD_QUIRK_DSC_MUST_ROOT_DECOMPRESSION,
>>  };
>>  
>>  /**
>> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
>> index f6a1cbb0f600..b04ca4a97af2 100644
>> --- a/include/drm/display/drm_dp_mst_helper.h
>> +++ b/include/drm/display/drm_dp_mst_helper.h
>> @@ -135,7 +135,8 @@ struct drm_dp_mst_port {
>>  	 */
>>  	struct drm_dp_mst_branch *mstb;
>>  	struct drm_dp_aux aux; /* i2c bus for this port? */
>> -	struct drm_dp_aux *passthrough_aux;
>> +	struct drm_dp_aux *dsc_aux;
>> +	struct drm_dp_aux *dsc_passthrough_aux;
>>  	struct drm_dp_mst_branch *parent;
>>  
>>  	struct drm_connector *connector;
>> @@ -956,7 +957,7 @@ bool drm_dp_mst_port_is_logical(struct drm_dp_mst_port *port)
>>  }
>>  
>>  struct drm_dp_aux *drm_dp_mst_aux_for_parent(struct drm_dp_mst_port *port);
>> -struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
>> +void drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
>>  
>>  static inline struct drm_dp_mst_topology_state *
>>  to_drm_dp_mst_topology_state(struct drm_private_state *state)
> 

