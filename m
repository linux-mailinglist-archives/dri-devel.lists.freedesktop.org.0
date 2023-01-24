Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D58679D12
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099C310E6A2;
	Tue, 24 Jan 2023 15:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CD710E6A2;
 Tue, 24 Jan 2023 15:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXCltaltKb7drhOMXZ0aFzNX/G/6PpZyrxBLBMo5c2AtQtCwdm5kYoTyOrbcW4vlzxlehx3is6mIoEwtO9URKH204FTG1pWB2guQgF7fTD2Z22qUBFMUJuPqHp8mubihYRD+owxg9AVv3JRw8anLbOG5hxD4Dbqq9OCwUVCjr/3ZcLEjZoHw52YKk4/+2xAkeQNUDV/mhZigmN6DrYIk1e339tJl7QOYplVqntwg/CeqpW9WAE/9g8l9RBKrZNDCM0Rt8lcgtnPlT6uuRKJmRPHhHq/ZP6MhKIqa3Y1jP/Gst6XS+dmojW+5rgrVIJa8VhJAybwhj/L2X+2CQkZGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gMlVTEDlbzgMBgEQiNbLVXUXtxu6XEQpK+bkSVAzXs=;
 b=VbPEwiMVb21VM2bfoO9JHw46F9qCr6Zb26t+eJb4W33+JdTfhZrd7ffjCmSN/yU0c8/z13fZ7NjcVvOsGlEhJ7u+F2VhdQ/QlX9ErCC0Eij5hdUr6vcCp5MRK/kAb4iZMRfp3TgRhR50bODvfrhUaa8Zz/KDRQbCru7y2dP8TzsrO6rzYbpB6/Sqz65SxBjL0wDd6nT/6bT6fgXocvcIKM+9ULNu6P8WPeCOarvGTcaJC3rMiqRjeqyszwVPVNr7gEXb2Txb/VJE96yYjfYGU5uMWm7lffrIzQ8Iia8gqN2TZ83nkC6PSOs2dLIT0MaCvq4NodZP16yuhdmcnFDtOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gMlVTEDlbzgMBgEQiNbLVXUXtxu6XEQpK+bkSVAzXs=;
 b=G321gUZe3Z0RFOFPyW1P/Laf1O/3PloFahNjaTLaGsWVAz2renEJJziP+/xG87c3JyB11XisVWtDDJNufRKM09b2Hf3bVe6zHL5atmlRLCJgtyon2cuNmoWv/ohJXuEHvwrjE5O8Qk3FuOw5dEVEWsytLpYmG0btLGwwIpl7/6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 15:13:06 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::2d5c:4370:2ece:ea]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::2d5c:4370:2ece:ea%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 15:13:06 +0000
Message-ID: <df4e08bb-8e24-441c-f392-fc359119acc2@amd.com>
Date: Tue, 24 Jan 2023 10:12:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 17/21] drm/amd/display: Format input and output CSC
 matrix
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230113162428.33874-18-harry.wentland@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20230113162428.33874-18-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0023.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::19) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 4925c1e8-3dae-4f91-46bb-08dafe1d7e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +sCk598CkE4SFUTPZ9z1W0aZjlPPMPRj4tYVCYhrP3FbjgXSUsManT4gJJV6e+IJu5tz7zdhfzgU168XsXw5zA9IF/KSu4RRy+FIB2TNPbMB0k5Z8TJQU1aO5LIsotibv5xAvdcC7Y3+LeBj1g/PkIiAgELkEmTfhEsLX0dEKb2ytwo0eS2O/LW+lPzdI1abVLdov7cEG7tdCsDr9DwRh017GOGglGTf+fS7TtMgaU9JcLqYz0uHozCWNiYrd2S8rtNM4Mvyg2vOfnmnLslBiT5yVZeiVEFHHd9sAHH56OOrd3FQ1KSaVgdx76XMjyaVxZyQlxAA06I5F3AJI+VkDDTPpj66/8TE/JfLWkMintxlB3jDZSq2BojwG81BDvOeOOwSsmNk0oxPmNshpXkCDSjt/geFJkQ8NQOlt82PkjVesm6uLmfTfWwT8SeAT1reF9r4Vs+NojwnpsVFttW/uPx3cohYWgNbxVcCFj3om50jPFfL2wy/m1kJBCK9RqTJ9OKki/ZiDrpA5oT/W5XIMi9Szyhdw2EIGnjzIZz2hTMJdLR639VIjigUI1bi3oz3evD5YlbzzOUWd6wbTyGqb9idRfQ9egrz3R5iU7f4HVustYyAatUmfqjS6ofSn0Q3qqThXwr73JVOB5b5myd6VOG0UQKJRE0Yg0XD/pxOHWDhj1Ps+qj7qzQpay7DFHwzSm87ELQLmB3xk02lfD0WziiB984VlgbfkT7Bi9xlMkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199015)(38100700002)(86362001)(36756003)(31696002)(54906003)(478600001)(316002)(66476007)(66556008)(8676002)(4326008)(6512007)(66946007)(2616005)(53546011)(6486002)(31686004)(2906002)(6506007)(83380400001)(6666004)(26005)(41300700001)(186003)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBPY3VBUWcxeWg5QTI5ak5OMnRFQlo4NGFBQURTVmduNmpmMlZPWG9Ccndl?=
 =?utf-8?B?L096bVIxQ0N5cDJ0U1VZY1ZGaVp5RmZXczdrY09uRFJ6L1N1RWt3WWhGOFRr?=
 =?utf-8?B?UWVYOXVCRjlRaVo5N0pWT0NaL09qUWwvWnFleFphWmIyVlhEWTNWQ2VyUkls?=
 =?utf-8?B?dlZSK2hiby9FRVdUcHVsSGh3ZHJVWTlRSHphM3QvZUt1cUhrcnhTYWxhNnJj?=
 =?utf-8?B?MmdZbk9PSG5HRTVzcm9HeGdoSiszUjF3c2VlcUl5SmlJcUNPNHRoSkIrVTAy?=
 =?utf-8?B?bWk4ZUNQSWNNZFlqNUNyUzdUc05sTTdvRkkxRHJ5VEdvcU9UYXNSNVEwS1FK?=
 =?utf-8?B?M2tCYmNDWVhkWDFwai9HVG9idzl1YW8wS2ZxSFdHa0ZYZThDaVRJWHlTbGVa?=
 =?utf-8?B?L1dKTWhjR21Mamd4UGN5VVZ0OUREdzA2OUN6dW83Zk96QllCZ3BiWXVHMTdZ?=
 =?utf-8?B?dXFSeVFuQ3hwOWFFdGpKRFVHUnJlQUtMdklrUURMVjRJYkptWG5ud0JEUFdX?=
 =?utf-8?B?aStsTlV2RXBUNHU3OHp5SlJRSEhXU2t3R1ZjQnE2ZnFBSkxTZnFUYUdTd1dC?=
 =?utf-8?B?Ym9vZkp3eklYdmFwK1IySXk4ak83Zk9RcXNJaUhVaW9OdVVRVUpIdXVFSEVa?=
 =?utf-8?B?eTNVUmZxbS9KeStnVEsxenJSUTNiMStudkxkbmVhamRBaUEzeUx3bFcvdWZy?=
 =?utf-8?B?MjRzUUhXWDhiQVNHb1A1aWV5amFsQVdYR1g4M25rUlY1c1JudHY4N0FBRHR1?=
 =?utf-8?B?T2JURW1kL0h2Rm5NYm1LL1dIbHhpNUNQWjhDQTErMlViYWJMaXRSVFVXVFhx?=
 =?utf-8?B?VTR3NmlzRklTN1RBbGtZbzhSSTdRVWRBcy9udmlrVVJCbWliMEdJTklUc25s?=
 =?utf-8?B?OU1DMURreUVIcDlkbzZnOTc5MmlVNVF6ZytrUkJ2aUJWaFRiaG5aRlFuc0Rm?=
 =?utf-8?B?dXNscWV5dlA3Q0p6elBPcUV2aHE5ZE91OWY4Q0VTQS9mRzBzTzE4UG9Nb2RZ?=
 =?utf-8?B?cmU4UFh2SUhsbWZaaUpjN3daWlAwVlBaSkpwc3VURGVjRFRESmhRNUFIZGc3?=
 =?utf-8?B?VzhlNmZ5OWNBMTN0NVkzNENEMTVkak9pTTF2emFMY2FCVHQ1YXUyV3JidWt1?=
 =?utf-8?B?ckF5Yk9kdDJvTmNBTytoZ0oyZVZvS1B0SnBwR3dLajR2dTE4MHNsQXg0TkxE?=
 =?utf-8?B?VWt6U1VvMkg0N2lVWWZsTzIvMk16ai9PRWlpdFdYcGZVU21oVFJ2S0RJelZ2?=
 =?utf-8?B?aWxZcEVnbG56dlF3TzI5ZEtEUFVUMkJDOFJlZFF6SkR1RmNOTkNEeWVVbCtu?=
 =?utf-8?B?T2hkQis0TWZKdWNaYXRHaDhhT1diOVkxd2d3L3JWQUJuUEM3U3dZbXJpcVk5?=
 =?utf-8?B?MDlveVJvdHlleWJodWUrWDVDNGNhWk5COWcrNzQ0WVIxY2crdHhESXAyb29x?=
 =?utf-8?B?enBTNEIvYU0wdXk5YTMxOUZzb25CZzl2VXBUL05vazlqdmg2Yk1wakpGZWFO?=
 =?utf-8?B?VnlGekIzWVhSbVhhUmtCdU9XVFpzQ05ZUDgzYjZ6dXVoT0ptT29JMGJDcHhV?=
 =?utf-8?B?UEV3UGZndmV3L1R4d1d0NTdaUitBOFRwZHhhTENzRVhlOHlNeXFLQ0NEZG5x?=
 =?utf-8?B?UVk1Tm83TW9BZThmS0xsVWxRWTRxRktvNFZDVy9sKzFZNlZVa29GdVdvMGE4?=
 =?utf-8?B?NG5QUzdXbE13NCtobURpM2lKdmJZYkhaTE1pcE12c2NtL3poSGV1djJpcDRV?=
 =?utf-8?B?dDBQR3NZc1BzL3hwNG55WXpZaUtpUFBHdEdpRlBLWThZR2pxRUVxZEY1cTdY?=
 =?utf-8?B?eU1PVmt5UzNvalJKK2FPTVY4c01OclRRSjdjbkNGUFQ0NFBjdHZRaVZFNkdI?=
 =?utf-8?B?bEJ0TW4zL0xZRFFtM2wwS05NaDEySll5OElUY0FpSGRhbGtzZlE4akxCaVpo?=
 =?utf-8?B?UkZIbkJyWjVEV0l4ZjVrV2tDUzRuVXRHNk5LSWZsZSs4MWVGNFFyM3dsRDJn?=
 =?utf-8?B?a2tKYlRSaTNnYWdxYVI2STErM1VOa3ZaZmFOT3l1Y0FydktEdXZ3MHc4aXlk?=
 =?utf-8?B?bElXYzNHNk8vN1VpbER5Vkw1YVBLSDV4by9sdzRjMzF6RU1oUzdzQ3lPSnd3?=
 =?utf-8?Q?SN7Hb0prWEbz0QPxcdUxsW/tx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4925c1e8-3dae-4f91-46bb-08dafe1d7e93
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:13:06.0090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY82dgZS0GQCm+R3m8MZyQcTg41kgriSNETJVqQOnWcSvSo3FmnJDWfznVAPhnrK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/13/23 11:24, Harry Wentland wrote:
> Format the input and output CSC matrix so they
> look like 3x4 matrixes. This will make parsing them
> much easier and allows us to quickly spot potential
> mistakes.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org

Reviewed-by: Leo Li <sunpeng.li@amd.com>

> ---
>   .../drm/amd/display/dc/core/dc_hw_sequencer.c | 38 ++++++++-----
>   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   | 54 +++++++++++--------
>   2 files changed, 56 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> index 471078fc3900..a70f045fc5c1 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> @@ -73,28 +73,38 @@ struct out_csc_color_matrix_type {
>   
>   static const struct out_csc_color_matrix_type output_csc_matrix[] = {
>   	{ COLOR_SPACE_RGB_TYPE,
> -		{ 0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
> +		{ 0x2000, 0,      0,      0,
> +		  0,      0x2000, 0,      0,
> +		  0,      0,      0x2000, 0} },
>   	{ COLOR_SPACE_RGB_LIMITED_TYPE,
> -		{ 0x1B67, 0, 0, 0x201, 0, 0x1B67, 0, 0x201, 0, 0, 0x1B67, 0x201} },
> +		{ 0x1B67, 0,      0,      0x201,
> +		  0,      0x1B67, 0,      0x201,
> +		  0,      0,      0x1B67, 0x201} },
>   	{ COLOR_SPACE_YCBCR601_TYPE,
> -		{ 0xE04, 0xF444, 0xFDB9, 0x1004, 0x831, 0x1016, 0x320, 0x201, 0xFB45,
> -				0xF6B7, 0xE04, 0x1004} },
> +		{ 0xE04,  0xF444, 0xFDB9, 0x1004,
> +		  0x831,  0x1016, 0x320,  0x201,
> +		  0xFB45, 0xF6B7, 0xE04,  0x1004} },
>   	{ COLOR_SPACE_YCBCR709_TYPE,
> -		{ 0xE04, 0xF345, 0xFEB7, 0x1004, 0x5D3, 0x1399, 0x1FA,
> -				0x201, 0xFCCA, 0xF533, 0xE04, 0x1004} },
> +		{ 0xE04,  0xF345, 0xFEB7, 0x1004,
> +		  0x5D3,  0x1399, 0x1FA,  0x201,
> +		  0xFCCA, 0xF533, 0xE04,  0x1004} },
>   	/* TODO: correct values below */
>   	{ COLOR_SPACE_YCBCR601_LIMITED_TYPE,
> -		{ 0xE00, 0xF447, 0xFDB9, 0x1000, 0x991,
> -				0x12C9, 0x3A6, 0x200, 0xFB47, 0xF6B9, 0xE00, 0x1000} },
> +		{ 0xE00,  0xF447, 0xFDB9, 0x1000,
> +		  0x991,  0x12C9, 0x3A6,  0x200,
> +		  0xFB47, 0xF6B9, 0xE00,  0x1000} },
>   	{ COLOR_SPACE_YCBCR709_LIMITED_TYPE,
> -		{ 0xE00, 0xF349, 0xFEB7, 0x1000, 0x6CE, 0x16E3,
> -				0x24F, 0x200, 0xFCCB, 0xF535, 0xE00, 0x1000} },
> +		{ 0xE00, 0xF349, 0xFEB7, 0x1000,
> +		  0x6CE, 0x16E3, 0x24F,  0x200,
> +		  0xFCCB, 0xF535, 0xE00, 0x1000} },
>   	{ COLOR_SPACE_YCBCR2020_TYPE,
> -		{ 0x1000, 0xF149, 0xFEB7, 0x0000, 0x0868, 0x15B2,
> -				0x01E6, 0x0000, 0xFB88, 0xF478, 0x1000, 0x0000} },
> +		{ 0x1000, 0xF149, 0xFEB7, 0x0000,
> +		  0x0868, 0x15B2, 0x01E6, 0x0000,
> +		  0xFB88, 0xF478, 0x1000, 0x0000} },
>   	{ COLOR_SPACE_YCBCR709_BLACK_TYPE,
> -		{ 0x0000, 0x0000, 0x0000, 0x1000, 0x0000, 0x0000,
> -				0x0000, 0x0200, 0x0000, 0x0000, 0x0000, 0x1000} },
> +		{ 0x0000, 0x0000, 0x0000, 0x1000,
> +		  0x0000, 0x0000, 0x0000, 0x0200,
> +		  0x0000, 0x0000, 0x0000, 0x1000} },
>   };
>   
>   static bool is_rgb_type(
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> index 131fcfa28bca..f4aa76e02518 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> @@ -70,28 +70,38 @@ struct dpp_input_csc_matrix {
>   };
>   
>   static const struct dpp_input_csc_matrix __maybe_unused dpp_input_csc_matrix[] = {
> -	{COLOR_SPACE_SRGB,
> -		{0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
> -	{COLOR_SPACE_SRGB_LIMITED,
> -		{0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
> -	{COLOR_SPACE_YCBCR601,
> -		{0x2cdd, 0x2000, 0, 0xe991, 0xe926, 0x2000, 0xf4fd, 0x10ef,
> -						0, 0x2000, 0x38b4, 0xe3a6} },
> -	{COLOR_SPACE_YCBCR601_LIMITED,
> -		{0x3353, 0x2568, 0, 0xe400, 0xe5dc, 0x2568, 0xf367, 0x1108,
> -						0, 0x2568, 0x40de, 0xdd3a} },
> -	{COLOR_SPACE_YCBCR709,
> -		{0x3265, 0x2000, 0, 0xe6ce, 0xf105, 0x2000, 0xfa01, 0xa7d, 0,
> -						0x2000, 0x3b61, 0xe24f} },
> -	{COLOR_SPACE_YCBCR709_LIMITED,
> -		{0x39a6, 0x2568, 0, 0xe0d6, 0xeedd, 0x2568, 0xf925, 0x9a8, 0,
> -						0x2568, 0x43ee, 0xdbb2} },
> -	{COLOR_SPACE_2020_YCBCR,
> -		{0x2F30, 0x2000, 0, 0xE869, 0xEDB7, 0x2000, 0xFABC, 0xBC6, 0,
> -						0x2000, 0x3C34, 0xE1E6} },
> -	{COLOR_SPACE_2020_RGB_LIMITEDRANGE,
> -		{0x35E0, 0x255F, 0, 0xE2B3, 0xEB20, 0x255F, 0xF9FD, 0xB1E, 0,
> -						0x255F, 0x44BD, 0xDB43} }
> +	{ COLOR_SPACE_SRGB,
> +		{ 0x2000, 0,      0,      0,
> +		  0,      0x2000, 0,      0,
> +		  0,      0,      0x2000, 0 } },
> +	{ COLOR_SPACE_SRGB_LIMITED,
> +		{ 0x2000, 0,      0,      0,
> +		  0,      0x2000, 0,      0,
> +		  0,      0,      0x2000, 0 } },
> +	{ COLOR_SPACE_YCBCR601,
> +		{ 0x2cdd, 0x2000, 0,      0xe991,
> +		  0xe926, 0x2000, 0xf4fd, 0x10ef,
> +		  0,      0x2000, 0x38b4, 0xe3a6 } },
> +	{ COLOR_SPACE_YCBCR601_LIMITED,
> +		{ 0x3353, 0x2568, 0,      0xe400,
> +		  0xe5dc, 0x2568, 0xf367, 0x1108,
> +		  0,      0x2568, 0x40de, 0xdd3a } },
> +	{ COLOR_SPACE_YCBCR709,
> +		{ 0x3265, 0x2000, 0,      0xe6ce,
> +		  0xf105, 0x2000, 0xfa01, 0xa7d,
> +		  0,      0x2000, 0x3b61, 0xe24f } },
> +	{ COLOR_SPACE_YCBCR709_LIMITED,
> +		{ 0x39a6, 0x2568, 0,      0xe0d6,
> +		  0xeedd, 0x2568, 0xf925, 0x9a8,
> +		  0,      0x2568, 0x43ee, 0xdbb2 } },
> +	{ COLOR_SPACE_2020_YCBCR,
> +		{ 0x2F30, 0x2000, 0,      0xE869,
> +		  0xEDB7, 0x2000, 0xFABC, 0xBC6,
> +		  0,      0x2000, 0x3C34, 0xE1E6 } },
> +	{ COLOR_SPACE_2020_RGB_LIMITEDRANGE,
> +		{ 0x35E0, 0x255F, 0,      0xE2B3,
> +		  0xEB20, 0x255F, 0xF9FD, 0xB1E,
> +		  0,      0x255F, 0x44BD, 0xDB43 } }
>   };
>   
>   struct dpp_grph_csc_adjustment {
