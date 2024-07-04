Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105FF927E42
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 22:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE5E10E113;
	Thu,  4 Jul 2024 20:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d8BZMXfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E7910E078;
 Thu,  4 Jul 2024 20:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmuNFGEc/hblGXtl3qLJ3utT/u8Q9PxMi5Zlf6aakzQWBQ09EEKKAXqrbkXQfSeyyq7PG7kXE7ZlYS4DEvucgHMXhd64f9f8mg7c4JsEgOuMtjryVEZMvx6WXoI8DlVwf1GqmbeLmz2GIo8KBe4FQWw0rAfN2SbV5qkBtYjLFaVnpic3Wdu9EX2soYQvfTjsFhLggoZlgcINYfQoC5p/J5WlkgzlYZ0fkhnmTkWA915CxnVCi5QRQ+57OI3lvyLnStGAAx9tHOLusTYlzddghg233xiJX+U3gYjkc8+FoZMrTiGj6tjxhGDWyEQejs6/VOSgBWSImeUUk3x8aJM6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bh+0U/z9TP7whi81/SWY3tZXHnQJn/CdRshzkdH5jUc=;
 b=EObdkMKLFImIQxzRXS032t0yqneja9aikX1cv0I3bL3Y8vXV/EptO6OFqY/cehv9oOEo9b1fk8ah/2WFtiMBaiobYvfVJPKvFBOF7er0FrP2+EOhGLIOf5SuPkgxeFwJl2CNC1L+abhjOv/Fjj2ZBGQiBD+2QZg3F3euclVa3JAQ2SgNUjjMuK/J1nRQSpbCZKazl0Lf5D4ihiu5pvBhS0TqfBn6lnfRFWNAgbh2oFOowUDzlErExBpvVpnn9OSsnaqUjnpXINRTdhgIcArdZ9ecrbZAW+6+Re+J+n66RHco3UsphAPXQ25+EAGarfpiDvdKlp27DlTavZ5Zgdl4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bh+0U/z9TP7whi81/SWY3tZXHnQJn/CdRshzkdH5jUc=;
 b=d8BZMXfo/x0/BURJS0FAduFclg4X++SouiS5Shwt3UwUsNf1Au4XYCPWJtbi/OQhqr5FcO5Gb/J9sj/oSn0sLfYLCW4ni56p/bBE6B8npfITBIkJcKl5Zkl33jPhcLXMViGYDcIQxFTgr/OBYp1Y7e8wB9gDjpijV6wvfPGB/s0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by LV2PR12MB5918.namprd12.prod.outlook.com (2603:10b6:408:174::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.27; Thu, 4 Jul
 2024 20:15:31 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%3]) with mapi id 15.20.7719.028; Thu, 4 Jul 2024
 20:15:31 +0000
Message-ID: <55479c9b-1686-42db-b8da-aaa93c589660@amd.com>
Date: Thu, 4 Jul 2024 14:15:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display/dc: Remove dc code repetition
To: Joao Paulo Pereira da Silva <jppaulo11@usp.br>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
Cc: luanicaro@usp.br, paulormm@ime.usp.br, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240613160549.139004-1-jppaulo11@usp.br>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240613160549.139004-1-jppaulo11@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:408:fb::25) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|LV2PR12MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: d73db4e3-319b-4282-b024-08dc9c660df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTdLSkdGM0FkYzlyNnJuM3h4bHFsNFJEV29rRXo1TkFuYU1OWWRCQ0pKTzdn?=
 =?utf-8?B?ODN5OXllQkV1ekRaQ2M2dUtVZmczVFFvZHRkbmlMenFhbkhzTHoyRU95dTQ1?=
 =?utf-8?B?T2dkVnhPdmhiTk80QUdkdkdpc1lFcWx1RXVXYkE2YW1SVXRlZG5hdnZ1MG81?=
 =?utf-8?B?Z0pKM2YyMFVCd0krc0UzY0ZIQkZPWmV0ZnJqZkIxUi81bTFBUE9NVm5HS3hu?=
 =?utf-8?B?dUhnVkNOUUNjMkxiSWR5NnlIZHA4WmZaMFRaN2tmYlR5MllOSlVrbEdzMGVU?=
 =?utf-8?B?UjZqaVZUeE1LZ29vdXhnM2pYMWN6R2hCL2U1UVV3ZndrMUJzZHl1ZFl1amRm?=
 =?utf-8?B?NFZzNENsLzMyWkprTC81VHlaZEZaVHBMK1M3cE9ZRUZac0w2TjB6TTBRMGFu?=
 =?utf-8?B?OTUyeGRrZ2FDSXg5MUVTcS9sRHVwUlBnL1E3ZE5LZGZZU1MrNlE5dk1rYXU0?=
 =?utf-8?B?cVJ0NDcrNzJ2UFd3TmpoWllubUs5MFpVZEFtd2xTS2I4TXBaNHhkdURETDlX?=
 =?utf-8?B?Z3N2U2xwTDlxYnppWEt6ZWNzenNEU1VFUnF0TlFDUFgvMVA3TjhqOFdadHhE?=
 =?utf-8?B?TzhLVnRLMEhnKzU4VUFkYkhGSHM5NnZKOVgxRmVPT3ZOSUhKaVNBRy9iRUV3?=
 =?utf-8?B?azhxdSs4QjlDQkhWamJGdm9xM2U4emN2VVluNWt0cFFnd0dhSDQyQ2VKd2tx?=
 =?utf-8?B?blZxbkVlMFlTbXFvbVp0bGRtSVgwb3lTNVZRME1KL1l2d3lVWGcvUXFmRlNz?=
 =?utf-8?B?VEN4aUFKUjJjblRsb0ZEeHIzTjRRcm5abEUwT1Z6V0ZUNTZKREoyUit5N3Rs?=
 =?utf-8?B?NnJsbVJBQ3k4aGI0SFFnYXFYWFdsTTc0SUVQMkZQWE5Wak9OQXhYdk1Ib0Jy?=
 =?utf-8?B?WWZ2MlN0RUExWURXMFlhcno4d2dNU2FRcVhhQXYyamxoL09xWjhuSzRUdS90?=
 =?utf-8?B?YUEray9vdng4S09RSGV3Zm1HMGJnTzhvU1Y3dTlmMGMvMUtkSHFGTFpVakN6?=
 =?utf-8?B?R0xVNnIweDc4ZW9kRWhVSCsvVzJ0L291U1laQlhIV0lnU3dvT3UvVlhlUGoz?=
 =?utf-8?B?WUovbDBEYjN5ajRwTW5jdFFTdWFzOXdGNlVOVFdlQXAxMXpTTWY1anFOYTNa?=
 =?utf-8?B?NTJYZHUyV3crY1NwZ3ZuZXZleXhqdW9wOEVzaDN4K3JHc1ZuWG04WElwOUJF?=
 =?utf-8?B?QTFSc2pETWhHem1xcTRsaDIvRlh0V2hTTXU1Q2poMzd2YStBY2lVbkdjTlpi?=
 =?utf-8?B?SlgyYmxPZENBQk9OejZ1L3QvV081L1liTGIrL1FHVnpVUE51NG4xZDdaK0NT?=
 =?utf-8?B?TSt6Sks5Y08wZnduWGpsYlVVa3BURjk3N1hiRUhKNWVTZzZzeEZLY2g4b2pw?=
 =?utf-8?B?SlhIVXBLTGdiOVlmOTl5ZzFlV3BzTk9qbFFiazZHampvZlA4ZmR1OVJBT25D?=
 =?utf-8?B?QVJ4L241clVFVE9wV3pQTnBKYzJkYzZYWFNrcURad09ESUY4TVZqUThKbXBI?=
 =?utf-8?B?bElNeEU2Z3VVZUN3c2JZYk5YYkVacUh5WENqZTlIdTU5aFF0UjByMnN4U1Bq?=
 =?utf-8?B?bGkxbmQ4TDVKTzhXYVpzWDZBMzk0dUEvZ2duSXVlSnQ2REtQVTF5blltYXVD?=
 =?utf-8?B?WTVDSjVSWU9XejlpNUFGYzg4cWFpR2liSHUrTSswMCtCd0lQY3BXb0hVSHQ2?=
 =?utf-8?B?akdkKzAvTHFYUklsaHVUemQwUERtcFpiTTRGQUJGYnVNV245LzRrL1g4TzNX?=
 =?utf-8?B?d3d3QmQ0N0pUMlczNU1WM3p5ZFVMUUNEdEFQSGRUWmxCT3puVXR4aThLUEZx?=
 =?utf-8?B?dGQ1b280SGZ4eG5KbXNNUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akVZT2J6OXpKNmNjU3g0K0ZOT2dITkVuUUxhMkxnV0prVGRTOW4vOEdIK1gw?=
 =?utf-8?B?VlVydDlPbi9Ed1c4WlBXdlMyVjcvd2RUQjdJSHZWQnVQNXRQOTlvbGJYaVdN?=
 =?utf-8?B?TkIzUUM3WE5qRGJwSk5MTmRxbGxuKzFScHh4WFZ3TnFPUVV6VW4yYUF0NzFo?=
 =?utf-8?B?eGR5dEQ0MWRCWWFYZ2tGOGFCcFNBbmJkMllsbjU5TXdlZlozeUxRL0orNThQ?=
 =?utf-8?B?dzVMZlB6NW0rc3pFNEthdEQ5UW1sb3Ftb1hIeEx0MCtTcjNIQjlKM2Y2SlZu?=
 =?utf-8?B?WkJJWjBqOTNTUE9KUS8wUGh3NnRrS1dPejNGTG5xZDR4MWRFS1dEMHlJTS9z?=
 =?utf-8?B?LzVuTWpSd2NiWCtHVzRVcFhHeGpka2RTTGdjWUZEM0FCWlBKbEZ4a3A4UEJh?=
 =?utf-8?B?cytDWHg5WDJrU2pqelh5N09QcTl0WW4xMFlBZjJhYzMvWGdBT3lTekpxMndW?=
 =?utf-8?B?SEVGNlBIMHdKekt0N2dKVDdOZXJpWmpJYlF1dWV2bFhyTGdQYVBQWkV1TDNF?=
 =?utf-8?B?RkVEQUN0YWEyUlZGK0NxRm12bFU0WHhzUG10L3FwQ0l0ajFHMUMxNHlHWExq?=
 =?utf-8?B?Q213UXdNeFFGWUdiNFJKRm5nc0dmUWlxQ3dzOC94UnNFRzh1aU10QmZrOHJU?=
 =?utf-8?B?emk5ckFXRjVsQmtxNUd5N01OMXZ1VHh5UVY5N2NuendsTmtIc2NzQnNlUjVT?=
 =?utf-8?B?TTFqMURlM1J6NytrMEZsc2V3RWpFaWd3NkYvZmo1bzBrTllveE4yL1FpUHZZ?=
 =?utf-8?B?eHgrR0VSc3I2ejk0WmNJYVJvOEtFSjllMVFsemMxKzNSRTFlTzUyTis4aDdh?=
 =?utf-8?B?R0dUWDduSjhlT0VSZzh0VnBzc2hGb3ZnbnkwZ3gvVDZsbmRHWXB2Y0gzS21j?=
 =?utf-8?B?Q09rS2w4YlJBMjhld0Z0Y2Q5bk1hVmNKSjJCNGRERHNiZ1FJK3BGVHkveGtj?=
 =?utf-8?B?VVB6N29XZCttMGJsSWNTL0dzb3B5R05mYm9ud0ZSeHRKTEVXMGhRS2VWU0hl?=
 =?utf-8?B?Y29ha0xCdDZIeGVJTDRWQ1puTDg0V1R1QStnejRieUU2anRjZVNzZXUxVlBI?=
 =?utf-8?B?NkF2eHVRelJlZkJ1cEQwemo5Tks2SzJ4c3lBZTRTYXBCK1F5bElGWFk4dGhF?=
 =?utf-8?B?MXVJYlpoZU1NcDBCU1hpeU5EdDhsNVlGSHBkQXNoajFqMUR5WUVaek5TN0pY?=
 =?utf-8?B?eURrLzhteSsyMzdvNlBHV1VNaDJxSXpLRXlVYVhDbEdOam8wY2s0UVJ5TER6?=
 =?utf-8?B?SnhPMTdKbHFqYnJFSUtwQzgvOEtaVGdRNGVzRTl6UnpuTlZ1UGRXQW55ckZZ?=
 =?utf-8?B?RXFKVnhndFZ2VlJ5bXJDUkVWc0FQRWFnTVZPdjhnT2NWNlJNZjQvZFNnUDl1?=
 =?utf-8?B?M21OR0xXY3hPMHRudWNIaTRvSnB2V0FrcUJTZE5aUlZMS2pENVhlWUZja0tB?=
 =?utf-8?B?NEVlcXlzdXczT1VvbTVPbUFCaXIxUEZCblB6SGdaZ2c1dmxVVGpVMVBFc0ts?=
 =?utf-8?B?V09TL1ltTG5ybGZOUzl0N0g0R1R2Ni82SkRjYXpNdDR5ZFVXNU1nbzA3MWJN?=
 =?utf-8?B?TjVNQWRBUUNYbTlpTDNjK3F5VFl6OXgra3JvM2oxY21jUml2M3ZLTFdnYm13?=
 =?utf-8?B?a3FTRUhUVk5ZZ3JGUVowMS9NaWFIOHR0ai9RWUh0TFM2TGliV2kvdDZyREt5?=
 =?utf-8?B?QWk1NTdzWFZRTnJkN1A4NU9yVlIzb1pkVWl0eTFHTWhZbjJBaXBEbXdqZ2VB?=
 =?utf-8?B?NGlCUi91NzAxS2FBOWdDZy9kbkhaUzlpSllGKzhsU2NQNWdKb0tDQmU5QVNz?=
 =?utf-8?B?RWRvQVd2cEIzWE1yQmtXbWFTK3NmM21XOEx4NnNsdjNBK0RiNXFKcndLYk0v?=
 =?utf-8?B?Q0ljRHhPMXAzZ0FhOW5ZaXh3L0FtL1FsSVAySnRiYnFVR0VqZkZMOFBFR0JE?=
 =?utf-8?B?N3pnbWdaZUcyaHBQTnBXcVFsLzB4NnI2VGkvOU51QUswaTY1b2FQSHN2YWZO?=
 =?utf-8?B?SXRNU3AwVVZnYzJwTlNoR0xCU3htNWJGRmsvTExteEZqOXo2UmY0V2hXbnJj?=
 =?utf-8?B?bVJVaHAwTlVwYjV5SkdRekQwN0FtV2x3YkZsUU1WQTRsTmUyOFlQUlBKSFVE?=
 =?utf-8?Q?x6Dyw2U/Z8vuIEl7QnZ9syS7B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73db4e3-319b-4282-b024-08dc9c660df4
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 20:15:31.5998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcayJhf7vpPgvzWNr+ESyh3MgDerg96yiXv9tn1UxC6LeOMegB1FrskLtD5icEsgklecKxlkj4S2UGvoaxeqLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5918
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

Hi Joao,

First of all, thanks for your patch. Follows some of my comments:

 > On 6/13/24 10:05 AM, Joao Paulo Pereira da Silva wrote:

You can drop the dc part in the commit title. Also, the title should 
highlight that you are decoupling one part of the code in a single place 
to avoid duplication.

> Code is repeated in functions optc1_enable_crtc
> (dc/optc/dcn10/dcn10_optc.c) and optc2_enable_crtc
> (dc/optc/dcn20/dcn20_optc.c).
> 
> So, remove it with the creation of a macro.
> 
> Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
> ---
>   .../amd/display/dc/optc/dcn10/dcn10_optc.c    | 29 ++-----------------
>   .../amd/display/dc/optc/dcn10/dcn10_optc.h    | 27 +++++++++++++++++
>   .../amd/display/dc/optc/dcn20/dcn20_optc.c    | 29 ++-----------------
>   3 files changed, 33 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> index 5574bc628053..facdeeb41250 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> @@ -41,6 +41,8 @@
>   
>   #define STATIC_SCREEN_EVENT_MASK_RANGETIMING_DOUBLE_BUFFER_UPDATE_EN 0x100
>   
> +#define OPTC_SRC_SEL_FIELD OPTC_SRC_SEL
> +
>   /**
>    * apply_front_porch_workaround() - This is a workaround for a bug that has
>    *                                  existed since R5xx and has not been fixed
> @@ -517,32 +519,7 @@ void optc1_enable_optc_clock(struct timing_generator *optc, bool enable)
>    */
>   static bool optc1_enable_crtc(struct timing_generator *optc)
>   {
> -	/* TODO FPGA wait for answer
> -	 * OTG_MASTER_UPDATE_MODE != CRTC_MASTER_UPDATE_MODE
> -	 * OTG_MASTER_UPDATE_LOCK != CRTC_MASTER_UPDATE_LOCK
> -	 */
> -	struct optc *optc1 = DCN10TG_FROM_TG(optc);
> -
> -	/* opp instance for OTG. For DCN1.0, ODM is remoed.
> -	 * OPP and OPTC should 1:1 mapping
> -	 */
> -	REG_UPDATE(OPTC_DATA_SOURCE_SELECT,
> -			OPTC_SRC_SEL, optc->inst);
> -
> -	/* VTG enable first is for HW workaround */
> -	REG_UPDATE(CONTROL,
> -			VTG0_ENABLE, 1);
> -
> -	REG_SEQ_START();
> -
> -	/* Enable CRTC */
> -	REG_UPDATE_2(OTG_CONTROL,
> -			OTG_DISABLE_POINT_CNTL, 3,
> -			OTG_MASTER_EN, 1);
> -
> -	REG_SEQ_SUBMIT();
> -	REG_SEQ_WAIT_DONE();
> -
> +	_optc1_enable_crtc(optc);
>   	return true;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h
> index 2f3bd7648ba7..aea80fa6fe91 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h
> @@ -604,4 +604,31 @@ struct dcn_optc_mask {
>   
>   void dcn10_timing_generator_init(struct optc *optc);
>   
> +#define _optc1_enable_crtc(optc)					\

Let's avoid the introduction of a macro. Just create a function for that.

> +	do {								\
> +		/* TODO FPGA wait for answer */				\

You can drop this comment.

> +		/* OTG_MASTER_UPDATE_MODE != CRTC_MASTER_UPDATE_MODE */	\
> +		/* OTG_MASTER_UPDATE_LOCK != CRTC_MASTER_UPDATE_LOCK */	\
> +		struct optc *optc1 = DCN10TG_FROM_TG(optc);		\
> +									\
> +		/* opp instance for OTG. For DCN1.0, ODM is remoed. */	\

I think the original comment had a typo, I guess it should be "removed" 
instead of "remoed". Can you also fix this?

> +		/* OPP and OPTC should 1:1 mapping */			\
> +		REG_UPDATE(OPTC_DATA_SOURCE_SELECT,			\
> +				OPTC_SRC_SEL_FIELD, optc->inst);	\
> +									\
> +		/* VTG enable first is for HW workaround */		\
> +		REG_UPDATE(CONTROL,					\
> +				VTG0_ENABLE, 1);			\
> +									\
> +		REG_SEQ_START();					\
> +									\
> +		/* Enable CRTC */					\
> +		REG_UPDATE_2(OTG_CONTROL,				\
> +				OTG_DISABLE_POINT_CNTL, 3,		\
> +				OTG_MASTER_EN, 1);			\

Maybe you can convert this patch into a patchset, where the first patch 
moves code around, and the following patches fix typos and code style, 
such as the parenthesis aligment with the parameters.

> +									\
> +		REG_SEQ_SUBMIT();					\
> +		REG_SEQ_WAIT_DONE();					\
> +	} while (0)
> +

I was thinking... do we have more cases like this one? If so, maybe we 
can create a generic optc.c file. Anyway, this is just one idea to add 
to your radar for future patches.

Thanks
Siqueira

>   #endif /* __DC_TIMING_GENERATOR_DCN10_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
> index d6f095b4555d..012e0c52aeec 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
> @@ -37,6 +37,8 @@
>   #define FN(reg_name, field_name) \
>   	optc1->tg_shift->field_name, optc1->tg_mask->field_name
>   
> +#define OPTC_SRC_SEL_FIELD OPTC_SEG0_SRC_SEL
> +
>   /**
>    * optc2_enable_crtc() - Enable CRTC - call ASIC Control Object to enable Timing generator.
>    *
> @@ -47,32 +49,7 @@
>    */
>   bool optc2_enable_crtc(struct timing_generator *optc)
>   {
> -	/* TODO FPGA wait for answer
> -	 * OTG_MASTER_UPDATE_MODE != CRTC_MASTER_UPDATE_MODE
> -	 * OTG_MASTER_UPDATE_LOCK != CRTC_MASTER_UPDATE_LOCK
> -	 */
> -	struct optc *optc1 = DCN10TG_FROM_TG(optc);
> -
> -	/* opp instance for OTG. For DCN1.0, ODM is remoed.
> -	 * OPP and OPTC should 1:1 mapping
> -	 */
> -	REG_UPDATE(OPTC_DATA_SOURCE_SELECT,
> -			OPTC_SEG0_SRC_SEL, optc->inst);
> -
> -	/* VTG enable first is for HW workaround */
> -	REG_UPDATE(CONTROL,
> -			VTG0_ENABLE, 1);
> -
> -	REG_SEQ_START();
> -
> -	/* Enable CRTC */
> -	REG_UPDATE_2(OTG_CONTROL,
> -			OTG_DISABLE_POINT_CNTL, 3,
> -			OTG_MASTER_EN, 1);
> -
> -	REG_SEQ_SUBMIT();
> -	REG_SEQ_WAIT_DONE();
> -
> +	_optc1_enable_crtc(optc);
>   	return true;
>   }
>   

