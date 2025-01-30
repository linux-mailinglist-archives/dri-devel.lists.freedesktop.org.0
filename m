Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390EBA2316B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFC110E9A6;
	Thu, 30 Jan 2025 16:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ANBnsArZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9DC10E368;
 Thu, 30 Jan 2025 16:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2GOtinTUBO730O6ChnRiISYZ5f46Q0AeR53IqReEDug3izN4QjlCyUXhp4Qs06Zs5gkwCK/VBlAufs7foAVdmsQj8bp5BzHhvPta9/EelGFgLrFMJLdQlOho3MOF61aWEZo937R33og7+v/JyIEi7hGz9o4c420f0rcXpKb422tM1dobKnYvL2q1KiM8tGQwM1xuiFaoCXrbfFXt8EnA4iie3GCmthTNGTBeyJHoVHYQP0AeR6LW9gsHV2J3l+RQV7kqTMkhInr696u6IboWdSMCrq6GMbbyoDtAInHxYS2aFuDp22E+gKP0VlmNXNiMjH1e/p/6p5l39T5d2oMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSnY0UtSYDntNoMkl7CKiXbkmH7VH9lXY835M/O3aCg=;
 b=fUtFDpLrznPCyMIPgSuVtTlWs1U2yuihpXb0nIzsPweGYMbnWjQrGjDf/r0vZpff6ecfF5dZJDySJgl6ubieyh9hlX75k4XNeMJWhe1yayOsF2ubH81xCJwZez399Nu4CQP4L7RHSeIMcEdQ7x3HQ+GvswnKdNAi0kIV5TcgZmvFIBwagZr9PzXxzqmmkL0KYRXhUo+Bgd6xVZlTjw46vF1fT+cdYisSxo7vnZxSO7VnsGVhXVHQvE4JuIqMU6R5pCygO5AtSnPf+wzlHRdzPDjh4Vuni3pcIHYXYQ+WjubUrPnXzCoA5aazHfJePm6XmrFHg90pZIYGnjSvqKRY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSnY0UtSYDntNoMkl7CKiXbkmH7VH9lXY835M/O3aCg=;
 b=ANBnsArZkQcWr5Z1/AfL2hDGKnrLS8kzd8xZXoNC1J0i7HUF4Ohjeiwt9LOse289Oo2KnAfQIC0Z4TyjdXd799HAcK2uBFLorLH5cJHm+OxZW6FLUxfa4XRuLNnm7nb0MsaTYhzAMGKsQPiPNUyLS9GL5sOit5hL+toDycJrLWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB8003.namprd12.prod.outlook.com (2603:10b6:806:32a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Thu, 30 Jan
 2025 16:02:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:02:40 +0000
Message-ID: <5d1cfcee-b575-4e01-8ec0-dd1bcbba9bc0@amd.com>
Date: Thu, 30 Jan 2025 11:02:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Increase sanitizer frame larger than
 limit when compile testing with clang
To: Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexdeucher@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20241219-amdgpu-dml2-address-clang-frame-larger-than-allconfig-v1-1-8c53a644d486@kernel.org>
 <CADnq5_Pun+zN1=B0eFMw1w8k_oD3fw626SdaEug24YRg8aOLKw@mail.gmail.com>
 <2025013058-fasting-gibberish-9718@gregkh>
 <2025013003-audience-opposing-7f95@gregkh>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <2025013003-audience-opposing-7f95@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0421.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bccb26-c8b5-443d-f675-08dd4147860a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2lTUEJscFZpc3U3M3dXK1dUUlBiMytCL044VkhIU2d6M0IxMzZ6eUdDc3pu?=
 =?utf-8?B?L1R5STBIdFdDMjJDRVV3ZjNXaVhFTnF0SWVVZHBXa1UwalNlZU5TZGkxSFho?=
 =?utf-8?B?WHpsbEwwSm9ZTHZ2eWluSlBzUGNaSk9IK3BwTS9TVHpWOERvZmZUZExTZTdV?=
 =?utf-8?B?akdpQkMrTnlTVmdkcDdGMFVHbXdDQ0crZ0tKeXNnT0hVVkgxa2h4dURrWS81?=
 =?utf-8?B?QUJ5Ukdzd2E4TU9WSmtjZ29xNGFlZmRxKytySGJHWmhwdXlBRi9IVXYyQWo5?=
 =?utf-8?B?Y2Y5cmk2NkNOVTlDQ1hHRlg5M04xdWFTVjkwT2FqYm5NRkJiTWVka2RCbmN1?=
 =?utf-8?B?eEVoaEhTd24zSzB2V0pqYmsyZFFndk81ZFZnU0I1bXRVMjFpMTFEbGZRSGZC?=
 =?utf-8?B?MnlDb1R6d3gzbW44TTFpcmZxVHhNY0lWeCtscWhVT2RDbTMvWncwN1pFMEth?=
 =?utf-8?B?UFhHbUVxOW1NcmJETExkcXdKdEIvaTgxR2s3aERLa2RnTnlPRmtqN2xZeThw?=
 =?utf-8?B?TitmTmxwbXdzMWs5TWkvb2NhTFY5ZzNEeVBqejU3TEtsMkw2OFZVMFpYc3Ra?=
 =?utf-8?B?RGhVL1RZMHplRm5oNFpZbmdlcCsvQXF1NWpUckhRYlBUeUl6ZVJibXZidi9j?=
 =?utf-8?B?WUNjOUFjTzJjdkM0UmRXZDUzejZSTHgrK2FZc0hJNkJxTlZhc2VYVFc3WWlT?=
 =?utf-8?B?MTVveWFDamtET1ZFaXRFazVRdU9uWnNieVh2ZkYxcmh4dEU1SFUwVWs0RnhP?=
 =?utf-8?B?N2ZUNW5jNzF1WXJvMnU1cDZQbm80S2llYlVkUFZVWm0zOGhUbEJNWTY1RDZQ?=
 =?utf-8?B?Y05WM0ZYRUFMTzVjVzlBUk5CWlVKV2xJUGhRRi9DZXhDTVhNaWdZcnZSeE5Y?=
 =?utf-8?B?djZmckczRHpMK3FtWEpVUU92MmlDZFZ4ald2dFdnVlc4N0UraU9zbFJRTWpr?=
 =?utf-8?B?UjNYYlpYaHZCWitXMjFkMzQ5L0ltUlllKysvQVNTMkQ3cWRYZHpFTGRCdmJk?=
 =?utf-8?B?dXBTMlZxQ3RERzJlRmpLaWt2WTJPVnBrUU1JNndhT3JHSTlJc1FWQ0dibnM4?=
 =?utf-8?B?STJBRGZDRFhUVnlJS0FoamxkNEtjeHV2bm9VMzVpdUpHV2lkNGMzUEZlR1p2?=
 =?utf-8?B?MXNHc2xYTlE5OVlMZEVKKzR5c2kvb3RWVU9HY09qSXhxZ1kzcCswcGUxVi85?=
 =?utf-8?B?SnJ0L1AyVlFEc3RWUlQvczNaVU55d0RIcUJhQjBDZ2ozYzMyaytlTTVWMUox?=
 =?utf-8?B?SXdoTE0zcXZOTkNqSVM0WDFDem1BMDJJR0lEanRUdnlCWnEzUlpETXd3QVFM?=
 =?utf-8?B?Q1hkMk9BMnpLVTN3ay9aUElzU3dXbVdCQnJyMlBsWHExUnRVOWxBNmJMSDFR?=
 =?utf-8?B?dXlKUnl6REcxT3gvRjZNcVowNW5WS2s5NUJ0NTA2NkEzZFF0T0N3eGtqVkdj?=
 =?utf-8?B?cVA5ODNtSSs0a3FkNFl0VnNuMGpkOEIza29XWGc2UGdQSzloUmNRS21kd1Rs?=
 =?utf-8?B?dlNLaXJjY0oxMU9SRzlIZllud0VvN0RxeXFDS1BMMXI4K0FZK0hPTjhoNVdz?=
 =?utf-8?B?OTAzWW1DUlF2ZFN6RUl4cGV1a2kwYlNsRjZOSkJ2Smw5MkFGZWVPbWxUTWo0?=
 =?utf-8?B?WVJvK3JKNlVvazRqczNtNkliQ1VFM2dqYzhhZ09Ta1V3cDhkd1B0VUpLVHYw?=
 =?utf-8?B?a1dGVG1Hejlha0pmNngvZi9KSlF1YnpLYURicklFWGFTeEdhcFRsTnliTmVX?=
 =?utf-8?B?aGNMYURNR0YwK0k3T3lZbFZGQTFmVXNpZ2dTcXZUQjVpM1pMMjlSaDd4VWZ3?=
 =?utf-8?B?TnA4MDdiT3VMdjFtdDFiV1hnN1FPbGZLRUJ3UUVDL3FYeFdmS29IUmRWcDdE?=
 =?utf-8?Q?MexP6+L+WnCP4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0FycG94eWZ6a3BpR0Y2VE9PRGYrYWhyOE4ydlcvaFpaalJwQWtrc2F1b2Nu?=
 =?utf-8?B?bEhnTTYzTjRLWkp3YlZmOHJKQW40bHNwSXdvenIzZitJSzZLZlZ6TTFIRXFo?=
 =?utf-8?B?SE5QU1ptNzlpVFpZZkN5UnViMTkvRXU3eHFWQ0NwdEttajBhOU8xU3FjY0hQ?=
 =?utf-8?B?SkdMUThGZm5ETnl0cjBiMGpyeml4YTQ4UXBJc0JvU0hIb1NKQVV6WUszRWgy?=
 =?utf-8?B?YzE0QklrbDZZeHo3aU1keDdSMGovM0gvKzFPZXR1MGtuTEYwblRsNm9jcUU1?=
 =?utf-8?B?UDgyQXY2MzlxSEhwWXpvT3pJL3MyZFFkd0FpZDM1RE5rZnRqS0NGWmZaajE2?=
 =?utf-8?B?TFAwRlNVRFY1elcyWEl5VU5IQUVQYkdzSlFLcHVOZmN3NlNwclQrZWZQZGNi?=
 =?utf-8?B?MytxdTh2WXJ5aUFlTFpRYmE4UEs5dlg0cUlweHJBcjdMUWxnaWhjNW9nMnY0?=
 =?utf-8?B?Sm1td0VBWWFwRjdWL1A0SkdqTldYblQ4WDh3TG1LZ3hWY0pVNyt5Y2ZMSHFZ?=
 =?utf-8?B?d1RqaFlkVXB1VjhGS2lucTBoU2E3cmgrSDZ6S0NhdVlnUW5XOXZ2WmgzbU5J?=
 =?utf-8?B?N1V4czBNaUQ2ZGl6KzUvdVkxWS8xQ1g0Q2V2dEh0V2tBOWpNOEluRHQ5VmpK?=
 =?utf-8?B?d2lYVUh0RlFVeXR3a2hRdFVwNUFWR3lsSnVsN1NxcGxKZVJjc3I0clF0dlVG?=
 =?utf-8?B?ZHRWNzhlTVB6bUpiMHpVWHkyMnhadmVxYlJiblF4MHlHOWFhS2hYU3Z6MEFa?=
 =?utf-8?B?OWpxaTUzR3B5bTNEbXNVQmg3alNDZWU4K2ZZd2NTSUo0TmZ2RE5mSXA3b29u?=
 =?utf-8?B?NkMxWWhtL1pLbk5HUFloUnJSZEVDVWUvTDFCNHAwMlgzT29HRWpzTUdvdGZk?=
 =?utf-8?B?SWxlOTVlRWNPYm0xRW1yUktQZ1RreFZzWWRRc1VXZFFGQWNSZWc5QVM2S0Nq?=
 =?utf-8?B?MDhGZGR3UloyYW41d1BmNzFRL2Z5aVNqQmZsbHNZRTkybnBVUk5BWmVmS01G?=
 =?utf-8?B?OWVVSFRCSmVobWlFMm5zRTVkaXJ5NmVWYmxNa2ZVV0dNakVkdXQzNDZKaHRp?=
 =?utf-8?B?WXgyNW1KQ2loN0hldWRkdGJBL2ZZcmEwV21qbFJwbTVSeVZ6YitLOXZGcUhz?=
 =?utf-8?B?Z1F1Q1BRY1MvNTlIa0doRWVHeUdVeWZpb0k1WEY3bEY5UC80bUV0MWpWQnBT?=
 =?utf-8?B?VkFtdEhnOUViUEk4TEwyaE1Ia05nSVNCdFc1Mkh2TXk5bEtDL1BCM3l2U2I3?=
 =?utf-8?B?eFRkbzlPTnQxeFYrcEg5c05laU9URUtZbVhPZ0hMdWZaUzllZko4cXp3cUZm?=
 =?utf-8?B?bGZRaWprZzhyVzFnRkRqcVhvT2NlMytFSml1aWxWNUJnaGNlcVZaYTFSZ2o5?=
 =?utf-8?B?YkROVVorZUFvTmgrNWNMY0N6WVRYSkRkM05VNXd2MlczblBGbzNXRWRoNm5E?=
 =?utf-8?B?V3kvS3A5WTFPaVJQOXJsMmVJOUY2dzlpenZhdmVUaGg2MWhYMTUwbjdXVHVo?=
 =?utf-8?B?eXJuVEs0cFEyOG0wVjY3NUpuak5LVnU0NE1rL29TUEJZUWFnL3I4VWpqcEJy?=
 =?utf-8?B?bzh1OXRGOHdxZGlXekF0cm1VQWh3TnNmdnRlcit3VTZPL3Y2b0RFRzg2REZB?=
 =?utf-8?B?RlM0WGIvWmUzRmRzMURsaHI5UEhPdFhSd3I4WXkxeTlLWnBNVjB1QWIrVFMr?=
 =?utf-8?B?UzdOMXF5SmhqUkhEZ0hQY1UyOHY3Y3BTRHRTcmFyNE81Zkc3bUs0TG5wZTNF?=
 =?utf-8?B?L2tncGJrTDVQcnBISGs2bmVXT0JQZzBxbnMvYlM1RzdnUDczNk9GSWowOFVR?=
 =?utf-8?B?aEhzZDRwd0NOaXB4OXp4dmFxUkl6WTBkVmxmK2k2L0JTRlpLMks4NlZhZnh3?=
 =?utf-8?B?cU1QQ1VBRFcxNFZqOEE3aXZ3aXEzdkNXeFJmeE5rUmJqc3Z6ZmZvMzEyZ1c2?=
 =?utf-8?B?Vk9MdDBXU2pvQjFBcWJCRDV6cloyQ2l2SmR0QncxcXRkaFVwRldZV1krVkRV?=
 =?utf-8?B?YUF2RnlaMitISlFPYkJReFBjTSt5YXA0ejl0SDZ4TjExTTh4L1EzdFRranY1?=
 =?utf-8?B?S0tRUmlWYm8rWHhJQUhVNStUN3cwdnlsTWFHRnhhbW9TZndGdXhGRXZCVGRK?=
 =?utf-8?Q?C3Kw/ryhSzw8jx0fYK4yADvRB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bccb26-c8b5-443d-f675-08dd4147860a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:02:40.5252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwyRGbNbQxEokPtWscdz7r4t0KtXwt+KN1KLXcv8quLZ/QnbzC5YCIR14Paiq0Ty39naHi0us0sP04z7oebtfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8003
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

On 2025-01-30 02:04, Greg KH wrote:
> On Thu, Jan 30, 2025 at 07:47:59AM +0100, Greg KH wrote:
>> On Mon, Jan 06, 2025 at 12:29:32PM -0500, Alex Deucher wrote:
>>> Applied.  Thanks!
>>
>> Thanks, but I am still getting this error on Linus's current tree right
>> now, with this commit applied:
>>
>>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.o
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6713:12: error: stack frame size (2056) exceeds limit (2048) in 'dml_core_mode_support' [-Werror,-Wframe-larger-than]
>>   6713 | dml_bool_t dml_core_mode_support(struct display_mode_lib_st *mode_lib)
>>        |            ^
>> 1 error generated.
>>
>>
>> I think the issue is:
>>
>>>> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
>>>> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
>>>> @@ -29,7 +29,11 @@ dml2_rcflags := $(CC_FLAGS_NO_FPU)
>>>>
>>>>   ifneq ($(CONFIG_FRAME_WARN),0)
>>>>   ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
>>
>> I do not have CONFIG_KASAN or CONFIG_KCSAN enabled, but I do have:
>>
>>>> +ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
>>
>> These two options enabled, and for some reason:
>> 	CONFIG_FRAME_WARN=2048
>> as well.
>>
>> Ah, 2048 is the default value, that's how.
>>
>> So this warning triggers even without KASAN or KCSAN being enabled, is
>> that to be expected?  Is the stack really being used that much here?
>>
>> I'll go bump FRAME_WARN up to get some local testing working again, but
>> odds are others are going to hit this if I am in my "normal" build
>> tests.
> 
> Ick, no, bumping CONFIG_FRAME_WARN=8192 doesn't fix this here either.
> Any hints?
> 

It looks like we always override CONFIG_FRAME_WARN...

> ifneq ($(CONFIG_FRAME_WARN),0)
> ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> frame_warn_flag := -Wframe-larger-than=4096
> else
> frame_warn_flag := -Wframe-larger-than=3072
> endif
> else
> frame_warn_flag := -Wframe-larger-than=2048

... right here for the default case.

You could bump that locally.

A more robust solution would be to do a greater-than check here
(for all the cases) and only set -Wframe-larger-than if the value
is greater than the one defined by CONFIG_FRAME_WARN. There are
a few "-gt" uses in other Makefiles, so I would think it's fine
to use that.

I'm no Makefile expert but if this seems like a reasonable course
of action I can take a stab at it.

Harry

> endif
> endif



> thanks,
> 
> greg k-h

