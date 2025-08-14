Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355BCB264C9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FADA10E879;
	Thu, 14 Aug 2025 11:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="qc8YGxrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012007.outbound.protection.outlook.com [40.107.75.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF6310E876;
 Thu, 14 Aug 2025 11:56:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzvYPNrS5y0SlueMxFt4jGPfszoQtMep+Pt3IxwbCPMVYKGCAi4e04bfIsp09HbrQqQA48ylHxPQH7gmAd8apI19GkFQImo7nkfT+M2qFbTU/VHr82Z/VaFRCj0+8b/K0DrMpxlWLcVuVaJVRYdTmDybrl8z/uQCmhP4jsxuxvbRHnoThNofrQpo4Rxc2JsbMTKfzV9f1dMpNYk/8uiRiRV9KZOchtoLPcJbuGmGqWxFs8IZsJty61SCGmUQOpU4rWGqCbGFaByBuiFCumJIlvM3nh+BP+gq9dFUbzwy2YlM/5AJonZeWlFHXB28a+zbWBUsXdWrHfeDlra5A/dE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qm7j9WjCP6Mkeq3rLr30tsIHCqZzhgB75btllES1k/8=;
 b=a9JWxwdyLYWwKV3WR4yMhQ1vf8eJFRAKYnPcdEIH/dZY8as2eiqjzjEWlQbNs39WWxcHf95SRP9pfOKtsecNN9Ejy0iHLo0S+D9pnnP7heUdq5+0ciI3gLxId9J+lLKukCvXamyqQrbVNzKWsWkYPLoVUupuoD8l3XQQW8OXlChaQZROpgP32Ekw2mEZlglQy+02I6peC9HBbCoUPrY4obRlMytIP4DslFEx+Ousk/Tn4/kRHa/copPh1vY8AuQjCDWl4f0s/j3Rc2n6kjOK2LjoUlMogc/dkiNdXyiWdvY2oHPuBKkWLwQKGZHz1zSuKu2O22iUHkkr5FLIm2pOfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm7j9WjCP6Mkeq3rLr30tsIHCqZzhgB75btllES1k/8=;
 b=qc8YGxrxs/lYiUA5L83YTvYoSoEOZ6EEv0NRqseXEEBprsPccfk3DRkZsXXH0UhhWpxH1vS+cNnYfSl1d50VOp/L5FQ6AjNbb7RpCk4xFPXTH/xpwvhtGgnDbudsa6s1+MJmdqu+SL3cxkbBgMuU2ZtxZh/MEBgFjZvCGfylmzJ27ciQtcPmcopfezEMaYOlNHz29nGPDXG3Q5Nps48EtAz471pZIr26YsYBlSQ2i9CAMWbUsd5n4kronSOVl/nuX23zyLy9PKXYakeTRs5mUWosrhEuFXP9p8eueyioXeOopzBYh9yLyD9rz2SBjv4Ue9ay6jETvhCLNGlu80qK+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 11:56:29 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 11:56:28 +0000
Message-ID: <6ef5e1e8-3868-46c0-a31b-505f8a91d37a@vivo.com>
Date: Thu, 14 Aug 2025 19:56:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Move the memset() function call after the
 return statement
To: Tvrtko Ursulin <tursulin@ursulin.net>
References: <20250814093957.137397-1-liaoyuanhong@vivo.com>
 <d77e242e-af6c-4693-b207-576b823a0c0f@amd.com>
 <14ed323d-de4c-4f98-a16c-8bdb1b92c34d@ursulin.net>
Content-Language: en-US
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
From: Liao Yuanhong <liaoyuanhong@vivo.com>
In-Reply-To: <14ed323d-de4c-4f98-a16c-8bdb1b92c34d@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:3:17::33) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3a713b-95cc-49ca-a468-08dddb299a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG5uY0hBZVlhS1FtckJ3Ync5RCtzU2U0K1FjL3dtOFhXVS9MYTZBRGNjamhi?=
 =?utf-8?B?MjR3ZVptenA1WkpxL1hFTnBEMGZMREdOZkNHN3AwQ3FacjhvdEw3WjJyWUxB?=
 =?utf-8?B?bi9iVGd0eXFlTWVhaTFuZm1HeXlMdWNBVWVKNFBjaVdrNzJVMnhRQzh3cTNu?=
 =?utf-8?B?RFYwQ2pqRStOSG0yN294d2NUTjdFQ29WbldnUjh1OEd1aHh1L2lNdUlDajM2?=
 =?utf-8?B?c0J6cllRQ2M3Y29ySEppMTd4QzdEMmwrWFNoRUZCeE5tTHhXYzNNa2w3R0hP?=
 =?utf-8?B?VDBkWjcyRXBLb2laOFMzTGJzZjkzYkhWRDUydE5UMzN4ZGJJQjE3Q05WNElv?=
 =?utf-8?B?ZkxkcjRMcGhsbFBiSk9laGlKT0tCb20zQzg4NTByVTdPOGVzRS9YUXJiWVJl?=
 =?utf-8?B?TE9YMDJQUzJON1M2SktiVTg5WU01a3BQem9hc0xhK096SkpVdHhuSFJFRkQ5?=
 =?utf-8?B?dDNKMHJPZUJXL05VSXhMenZFOXdBS3NvYUg3a3lMRWxKNDBaMlVJaDcxQjAz?=
 =?utf-8?B?QTdvRXcrRWtqZnlMelVrWW9sK1hnOHhjMDd0dUhEOFpISjVSSXJrcFMrTDky?=
 =?utf-8?B?TzRGZlQrNXozWTNJQm1pTWtiQUtFUEh5dlVKaWRYeHVackoyMDFPdllmVEFI?=
 =?utf-8?B?MWlNcXhENTd3ZHA1L2hsUVdEVnNGRnc4K1ZVOXRSZ3l5c3NEcDhQWGxIdi9w?=
 =?utf-8?B?OTlpejVWYnV0WnQ4YVlySmpET3lGZ2ZrcitVZGF6Y1AyTDFNdGh0NGs2bnh5?=
 =?utf-8?B?dXBxa2FjQ1pwZWV4Y2FPOWNTWjgrZjdkS05xNnZuSzdQR1hZejdLNnJXdDhW?=
 =?utf-8?B?cEdYQ1lxNUNsNm5LaGVGSUY2ZW92SFZUYVJOajJPcXFBR3VzSGFOeEFkWU4y?=
 =?utf-8?B?SmxvWmY2VDhiVEJIaUcwR2RKQU5SSXlFYWVJMUtGNG5PQW5kNUF4WHZ0Zndy?=
 =?utf-8?B?eW5UN1M4RE91NDVzWjJUbTBvcGRxd2F5aHRYL0FmNnJHSksxRC8vYXNWTlFn?=
 =?utf-8?B?YXpJOTNaeVZzMDVPTzkyVTV1WVBjdXBxdjFCYmNpNFFMV21LSjN4aFZLMlJT?=
 =?utf-8?B?cDNvdTg5OS9zR2c5T1E4RG1DUVZjU0ZydDdNalh1WFNndjBlWmkvNE1FRmo1?=
 =?utf-8?B?MFFTTG45eS9FekM5ZXpTQlJjOXA4MW16U1F0ZEhvdXhGWHhKby9FdDUzQkJG?=
 =?utf-8?B?VDNGbjZYQXFwc0RHcTVqU1RSL01BZXRMVk0yMkpRdTVqZ1RMWHRqRUlXa3Vr?=
 =?utf-8?B?L2F1aGp0UEVBMXR1TVFXWTc1T1VlWXpBRGFSMHU4UlFvY3RwZUxEZ0pJamJK?=
 =?utf-8?B?WG1aMnlpWGE3OVpXS2wwcTdvMjlzVXEvVU9wRXVVdjFFb1d3czhEVmZSODdZ?=
 =?utf-8?B?bnpKeC9YTWIwSlJWNjNPTmdVdmE5Y1dLbVFUbXRIMzV4bEFrNUxZQm82Ykgw?=
 =?utf-8?B?YmxQYldyWWZnMlhzak5lZHRTdW1IbjdoSzRtUFYzVTNIUUF2eDhqS1hUdDJ4?=
 =?utf-8?B?emxsVC9aYmpFWnlyNjByOStPU3phYjRzcjY5QzhOa2lla2RTS2FUOW5hR0xl?=
 =?utf-8?B?ZXJBQ0VYRTRXNTVWd1FCdjFLNW9vNk8rMWtiT3JZand2MWJPQ0IxdVNQVzZB?=
 =?utf-8?B?ck42TEFLbVI0ZlJQMFBKZHF1bXdraEx4OTRYQ3NUUWE2Ulk1NUZZYTFhZWQv?=
 =?utf-8?B?bDcwWjdETkJyN2ttSnhUcGJhRm5kZzVpbVpHTFd2Yys2L0xYbk1JZDlVMDVF?=
 =?utf-8?B?YjZCdm5YRUZqYi80aTN0WmMwNjBEYStUS0pVdzk2M2E5bnZQSWdmNmNvYjBP?=
 =?utf-8?B?N3NRdy9uYWZ5Z0puZlgrakpnWXh0bVZsblNEWHVhTm9tSi9qdk1sckl3YlJU?=
 =?utf-8?B?eG5qRmVjUzhDYUtMWHViMFdaN1d6T1N5WDdEV1V1ZENLOXpPUkhIbW5FZTEy?=
 =?utf-8?Q?Z2yY2zoo5rA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d25GR01UNCs1c1loUll6SXFJaG5oZ3dkc3o5NzBoM3RIZjlqRHBPYStvbTVR?=
 =?utf-8?B?RGxJYnNPVDVKOGo0L3ZQWm9wY0U2QTRlZ1hpWW10RVUvTmNObkM2UmpPV0Rl?=
 =?utf-8?B?Q3VXeGxtaStMbE4vQlpHRFN3QWlXeUxKa2NzdTR2MUlvclF0bWV0M09Bcm9r?=
 =?utf-8?B?RGdRMzAwcnoxOGlVY09sNDg4RnJ2akJHK3dob2tCeEVzZmFBcDNIbUVTVjRP?=
 =?utf-8?B?QkViWHpTeDRMcHdFY2RzMmtvRld0a21PNFRtK1BDTVZRK3R3RXN6ampxSmxs?=
 =?utf-8?B?aGI3WklPUkY4TE5sL1RLU2Y1VndLNy9wWGR3b1doeStvdU5oOGIrSStIYzBO?=
 =?utf-8?B?a21VaW5GUUE0bFB5REpXRzlZSytycjZUaTZMTHQwK0ZrdHNzVkFMWC9vbFFq?=
 =?utf-8?B?Q3IvN1VFNXV3bTVpcjNjMk4rYXNvNCtZODNrcXF1MTc2d3NnY1dYd1pBdGFH?=
 =?utf-8?B?VDVPbERuS3cvWmNZSUgxNFdtWFlPQ0N6a2NwY2gwUDN1RHZsaDdmVnRtOXUx?=
 =?utf-8?B?MzFlZ2k2czRZZ3Vla2pWRExhbFRXcmErYks1QUxNNitoelhtUWVWWEFGQjNi?=
 =?utf-8?B?YTM1OXlzUU5DSXl2ZVpOMDk3dG9MTHB4azE5QUtPdnZqZmUyUEVsQTFINnZB?=
 =?utf-8?B?L25NMmNLdlFOc2w4OFRLVzNxRWdkRU9rZ2p1RTBNbmNTWm12WlJETithRE9q?=
 =?utf-8?B?bTh0MW5NQzJWTWtud3ZFbzEwc3pEQUF0UW1TYllZc1UwMk53eFE3TGIyaEFR?=
 =?utf-8?B?QWdmbDFjNXlLZ3V3enBEaEZHaytJUnVxSE5GZm02UzNiQVlMR0pFMW1FNnBj?=
 =?utf-8?B?VUF4SVh1eWZJeGxMQlV3alp3bHBGMTBYRnJVaFdvOVQ5aXNpTmhBa3ErSi85?=
 =?utf-8?B?RmYreHJDWk9ldmdnZE1qSjBFTXlJTytlK2VoVUdqT0RuUjNqZ2RPRWw4dXl5?=
 =?utf-8?B?bDZvOHk3TFN5OUV5UlAxMEpZdExLeExFaXJabWdvR04vQTNLeFhQZnFTcXFI?=
 =?utf-8?B?LzNNNllYNm51NXZmMXFOK1AxVGVZanNFMkhianhCaldiZ2lESU0xbDNxK2c3?=
 =?utf-8?B?YmJwQ2VsT29aM043d0V3MGN0cmRzZFRvcHVqMEF1eTBDRGJaa2c2R3AxbVFz?=
 =?utf-8?B?aHZLS3B1Mnk5NnZYaDV1bm9oQjlIMit3UjNEOUFkNjNOUHEySFdEaitBalo3?=
 =?utf-8?B?aFRETzZObjFsQytBWnljS1BmSis5eDB0S2wzbXgwdk5KdWdoZ0ExY2tET09q?=
 =?utf-8?B?QnIrOGw3Zm9MUlErL0g4b1BOMjlEeWJkQlRvdWg1dUVzeE91SEVqQWtnZVNW?=
 =?utf-8?B?dU1KaFVrQk4yN1NCSkMrUEkwNE5PTW8wNEtPbXp1VXNpS1BRQUJIQ3RqT3Yy?=
 =?utf-8?B?NjVNWXlsR0Ywd240ck9aVTZsV1ZjOTNOZUQvc2FCWFRiZ2JFajduV2svczh3?=
 =?utf-8?B?VFRITFR5Q3lobTgxbUl3cWxKbmZFL1ptSDIwaUlDRDRCb1Rlbk1RaXhvM1BQ?=
 =?utf-8?B?amVDK2Rta3lzYldkZEdiRDY3N1dSeHh3SEdpUkd3MFJKSUJ4WXlheUx2NFRi?=
 =?utf-8?B?N2xVTjQyK1p2YzVWczlpRWRISisxVFY2YkRLVWw2ZDRjR2F1ZElNNEphMHkv?=
 =?utf-8?B?ZjZveURyUlBOYmlGTHZkMTQ2MHJiNWFhYlorMzVyalg0by9uTHZrSEtEak1M?=
 =?utf-8?B?TWl0eFdBVmRNaCtZQnNXOUlwQW5LbHFEVEVjMmpVZUtDQXFHUlViUUlLZUJz?=
 =?utf-8?B?ak1wL3hhZnRJa0lYWjJHZERWZDZFKzRRZDlnZHRWYWQ5WU9KbnUrdXd3aDVF?=
 =?utf-8?B?eU9CcUhhYTFyQUhSOWhjaDZraXc5NktGMnM1c1BrczdtNzVtUVJjOHh6MGRp?=
 =?utf-8?B?bCtPL3Y0WURqb1Q1bkpRRGlISkptaENPNmtDWFFLdUs5Vyt3d2huSzNMZjlR?=
 =?utf-8?B?T0ZWRDNmV043aUR6cFdQNjBYbE9ybWREVTNJNmVLM1Qvbis1YmVHemhRNDhH?=
 =?utf-8?B?dkxaR0poZWhwV2JvSHlmMzZmRkRkQlcraVphbXhXaGZMODNaNXpzS2UvQkJH?=
 =?utf-8?B?NzdSVFEveTArbVRsNkllZ0ZjcksxMHZGWDNqdVl5c28zSHNFc1YxMWlyQ215?=
 =?utf-8?Q?0YewM9kHw/aTorYdGGGGb5Mcb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3a713b-95cc-49ca-a468-08dddb299a04
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 11:56:28.3029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RN2BPfG8ydrjkZbhC4g/gBhRDARg1wU1UH03NM8haIPfb2jYTmIDnZOT4dJPoSDtyB8HJikASvqb1Ct3CmUY8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734
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

On 8/14/2025 7:07 PM, Tvrtko Ursulin wrote:

>
> On 14/08/2025 11:11, Christian König wrote:
>> On 14.08.25 11:39, Liao Yuanhong wrote:
>>> Adjust the position of the memset() call to avoid unnecessary 
>>> invocations.
>>
>> Hui? That doesn't seem to make much sense to me.
>>
>> We memset the local variable because we need to make sure that 
>> everything (including padding bytes) is zeroed out.
>>
>> Even if that isn't sometimes necessary because of error handling we 
>> clearly shouldn't try to optimize this.
>
> To interject with a curiousity, it is even worse to move the memset 
> away from the declaration block when the often enabled 
> CONFIG_INIT_STACK_ALL_ZERO is on. At least when they are close 
> compiler can figure out it only needs to memset it once. Move them 
> further apart and sometimes memset happens twice, yay.
>
> Main point when CONFIG_INIT_STACK_ALL_ZERO is on, and it often is, 
> there is no way to avoid the sometimes pointless init. I have some 
> local branches which try to address the worst offenders but it is so 
> much in the noise that I don't think I ever sent them out.
>
> Regards,
>
> Tvrtko
>
If we converts memset() to = { },can it alleviate the problem?


Thanks,

Liao

>>> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
>>> ---
>>>   drivers/gpu/drm/radeon/atombios_crtc.c     |  8 ++++----
>>>   drivers/gpu/drm/radeon/atombios_encoders.c | 20 ++++++++++----------
>>>   2 files changed, 14 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c 
>>> b/drivers/gpu/drm/radeon/atombios_crtc.c
>>> index 9b3a3a9d60e2..0aae84f5e27c 100644
>>> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
>>> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
>>> @@ -770,13 +770,13 @@ static void 
>>> atombios_crtc_set_disp_eng_pll(struct radeon_device *rdev,
>>>       int index;
>>>       union set_pixel_clock args;
>>>   -    memset(&args, 0, sizeof(args));
>>> -
>>>       index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, 
>>> index, &frev,
>>>                      &crev))
>>>           return;
>>>   +    memset(&args, 0, sizeof(args));
>>> +
>>>       switch (frev) {
>>>       case 1:
>>>           switch (crev) {
>>> @@ -832,12 +832,12 @@ static void atombios_crtc_program_pll(struct 
>>> drm_crtc *crtc,
>>>       int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>>>       union set_pixel_clock args;
>>>   -    memset(&args, 0, sizeof(args));
>>> -
>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, 
>>> index, &frev,
>>>                      &crev))
>>>           return;
>>>   +    memset(&args, 0, sizeof(args));
>>> +
>>>       switch (frev) {
>>>       case 1:
>>>           switch (crev) {
>>> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c 
>>> b/drivers/gpu/drm/radeon/atombios_encoders.c
>>> index d1c5e471bdca..f706e21a3509 100644
>>> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
>>> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
>>> @@ -492,11 +492,11 @@ atombios_dvo_setup(struct drm_encoder 
>>> *encoder, int action)
>>>       int index = GetIndexIntoMasterTable(COMMAND, DVOEncoderControl);
>>>       uint8_t frev, crev;
>>>   -    memset(&args, 0, sizeof(args));
>>> -
>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, 
>>> index, &frev, &crev))
>>>           return;
>>>   +    memset(&args, 0, sizeof(args));
>>> +
>>>       /* some R4xx chips have the wrong frev */
>>>       if (rdev->family <= CHIP_RV410)
>>>           frev = 1;
>>> @@ -856,8 +856,6 @@ atombios_dig_encoder_setup2(struct drm_encoder 
>>> *encoder, int action, int panel_m
>>>       if (dig->dig_encoder == -1)
>>>           return;
>>>   -    memset(&args, 0, sizeof(args));
>>> -
>>>       if (ASIC_IS_DCE4(rdev))
>>>           index = GetIndexIntoMasterTable(COMMAND, DIGxEncoderControl);
>>>       else {
>>> @@ -870,6 +868,8 @@ atombios_dig_encoder_setup2(struct drm_encoder 
>>> *encoder, int action, int panel_m
>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, 
>>> index, &frev, &crev))
>>>           return;
>>>   +    memset(&args, 0, sizeof(args));
>>> +
>>>       switch (frev) {
>>>       case 1:
>>>           switch (crev) {
>>> @@ -1453,11 +1453,11 @@ atombios_external_encoder_setup(struct 
>>> drm_encoder *encoder,
>>>               (radeon_connector->connector_object_id & 
>>> OBJECT_ID_MASK) >> OBJECT_ID_SHIFT;
>>>       }
>>>   -    memset(&args, 0, sizeof(args));
>>> -
>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, 
>>> index, &frev, &crev))
>>>           return;
>>>   +    memset(&args, 0, sizeof(args));
>>> +
>>>       switch (frev) {
>>>       case 1:
>>>           /* no params on frev 1 */
>>> @@ -1853,11 +1853,11 @@ atombios_set_encoder_crtc_source(struct 
>>> drm_encoder *encoder)
>>>       uint8_t frev, crev;
>>>       struct radeon_encoder_atom_dig *dig;
>>>   -    memset(&args, 0, sizeof(args));
>>> -
>>>       if (!atom_parse_cmd_header(rdev->mode_info.atom_context, 
>>> index, &frev, &crev))
>>>           return;
>>>   +    memset(&args, 0, sizeof(args));
>>> +
>>>       switch (frev) {
>>>       case 1:
>>>           switch (crev) {
>>> @@ -2284,11 +2284,11 @@ atombios_dac_load_detect(struct drm_encoder 
>>> *encoder, struct drm_connector *conn
>>>           int index = GetIndexIntoMasterTable(COMMAND, 
>>> DAC_LoadDetection);
>>>           uint8_t frev, crev;
>>>   -        memset(&args, 0, sizeof(args));
>>> -
>>>           if (!atom_parse_cmd_header(rdev->mode_info.atom_context, 
>>> index, &frev, &crev))
>>>               return false;
>>>   +        memset(&args, 0, sizeof(args));
>>> +
>>>           args.sDacload.ucMisc = 0;
>>>             if ((radeon_encoder->encoder_id == 
>>> ENCODER_OBJECT_ID_INTERNAL_DAC1) ||
>>
>
