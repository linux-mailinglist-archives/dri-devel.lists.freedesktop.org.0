Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92838543AE2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 19:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DB7112DA2;
	Wed,  8 Jun 2022 17:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2086.outbound.protection.outlook.com [40.92.22.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D06112DA2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 17:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJ0+fO3aeWIMUl6yBVp1xcei4rbxwK3kpZ2OenxH31+QiN5gFi2LNihCrUV8IvjhFwYf+Q37EQVp7Z0Px6IgstHcYf3QFck8vWZHdrrnotGplmEy5+TjgJpXFCSIE/ZcVPJ5wCJ+cwXv3aJou6+bHkJCbdq6vByykWHQJvg/ul8NMauD0iUihTEobqkgMbGW3r11r2ZPaBH9CZLnqJTt/pP0xKs1GSwiuxT/e80maXn/aE/ts/5NzzAV37ICeTWXnHXESQQ6mK2Y+4RmbSoDL19/nfFTCxMeqs1MT6ONpx2jTQwsiehh+TbLlP1yiYiaUU1+iNOmvOZ/3FLUUDZyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/ZWhNMlw8mWZIAvNcpRzRqd5PIDe4PURgDvrwRotoA=;
 b=nmijgvlzWOcf/rQseCOn98zSe33/RwDNVOw+eqO2cl4XWRXDahnqe645BjFSGj2sbySOVh6MOIWViyIYE9b8ad3/7bTP5VLulB8CshvyVe5XiTAccBJ3/mjujrW1RsIcMIU8fhn0jaApOiulTu8Uzaq1uUjh3LsSeP+mOScmGQcoFEgmUvrbBWk/XPguKkiZ9ghApi7V+rhpEnQKsA8OgCq7mfdMaqbAbQK9WRcsCIBQqC37LR5qnvUiKzOAEgiXKzyQ7PiOKmrszdAi5cce1JAbvT3N0YsIZkjnADF+hgtapsUJxk+LeX6GKFGypN6W+wYcGebnEZA043hXo4immA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by MWHPR0201MB3546.namprd02.prod.outlook.com (2603:10b6:301:76::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 8 Jun
 2022 17:55:42 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e%5]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 17:55:42 +0000
Message-ID: <BY5PR02MB7009332C6051986F76B44DA2D9A49@BY5PR02MB7009.namprd02.prod.outlook.com>
Date: Wed, 8 Jun 2022 23:25:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/3] drm/panel: nt36672a: add backlight support
Content-Language: en-US
To: Sumit Semwal <sumit.semwal@linaro.org>
References: <20220401001810.81507-1-jo@jsfamily.in>
 <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
 <BY5PR02MB70099A0E4C060E52284DCE46D9A59@BY5PR02MB7009.namprd02.prod.outlook.com>
 <CAO_48GH5V2-Z0cqGJoF68hzZjqhY6_aGxReSk+ByC_zrLWusYQ@mail.gmail.com>
 <BY5PR02MB7009AA50A0F7D570877DA646D9A49@BY5PR02MB7009.namprd02.prod.outlook.com>
 <CAO_48GEvQhMOst0KhM9CU9y1cv3q+4hbXM9MentRn7QPTs_mQA@mail.gmail.com>
From: Joel Selvaraj <jo@jsfamily.in>
In-Reply-To: <CAO_48GEvQhMOst0KhM9CU9y1cv3q+4hbXM9MentRn7QPTs_mQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [kowSQQCwZT5wl6CQhKtSgceu4ll4WVt0tFmfrxMJsSFpVcwTsKC+2Thi7XRCrHcE]
X-ClientProxiedBy: PN3PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::17) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <16b152d9-d6d9-eb79-4010-f5d51492b5df@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ac699fe-34ee-4050-af05-08da49781a9f
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3546:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4jNJ+uBVNDyvrLjBsCqLOscIiqz4394pQx5K0vf46xdNRpygx+jRxq7YeiePjbCt6ve0x9uU64aWr/2ISjGMrFhGVijzvJGN8m68zgeUkht6vIcTaeioLBtBNc/G3/tt24Rh7wd0DmOHiyD6R7mH1My8Wc9v725iBzjxnjcWv6w2XhSF8uzpxaZU95w8oSmgZLcWG+Ryo40iUHxwzuu/Cbjj77PtKDMutbdMoctRPvqLwXn/MHrgMrBeEa7LpdY5VGKWcOhGx8zQodOivnVAf9mZGXEYFA36+NdGKfrqhwrY3aqm5mBtvbwrTw1FtjUFxq+cEpmiokDrOc6ZRi1e7NObYSQB9UZev8VtR8BSnF4WNTAzUmXc2XfmfTAZiEXfrHpiG/aUcNGN9naQuG2BUlBcE7SHJ/mz4Eax6YbpWUrkfYOyiPHcHOTE+gVonTfD5Et5Xj6pB6nrITks/M8rV9IamDOXuMaaiABv7BLgbPpibKVuNcBL/pWaeDCIxgQjbezqCzmY98k/1RrC882xRAaH5gGveALzzD0vKRth990jjqfuAMF9Fc/OKL3T8iVD2VquGAV5buQ7YUEe5lpuQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFFYMTVrY3RxSFR1dU56VEdBZHMvcmJDSWZmVERzbjNYSE82b0laMW9TTGVz?=
 =?utf-8?B?d0lSMTBCSTNEbGhyN1ZOSmtFWTFicVlSSm5vZkd0Q1hwSlNtQWFEWnNoU21w?=
 =?utf-8?B?Si9pdXVBUVdVY2Rnbk5FdE9QNGZyS3VXQ1h6d2YxYlRzSkNDSXBieVRWV0cw?=
 =?utf-8?B?ckZRc3RtSVNUVXhCQzFMTFdoK2NxajY1d0FpTi94S2w1Z0Zzc2QrcTBVemJE?=
 =?utf-8?B?TEg4eFU4YU91MlFsUE8zNFNEV2V3RTJWOE5BZS9WTG5wc1Q1SFUrUHdQL0dY?=
 =?utf-8?B?RnlqeW5LeitJc2lBUGs3N1Y5d21obUVsTVloL0k1Z1N0ZFhRdlQ3YmVjSGI0?=
 =?utf-8?B?R2twZVFWRVpYT2dLaVk2TW94NERxUjVRVUVxL1Mxb3Y0M3djdlpNUXNkWkR2?=
 =?utf-8?B?L0JGQVVGYlJCbjNmSEw2N2JWdjUreUk3UUNyakN5QW55bllDQlBqWXFrRFll?=
 =?utf-8?B?R3liZHY2cC84cFlQdHVGeGRpbEx0N0gzTWVGaFNnWWlvRHlpYldpZGNoY1Vh?=
 =?utf-8?B?cmhRbGxmOEE5V3VVbFRlejA1Znp2cmYwUm5XM09GU1djbmtHaXNsY2VSODVQ?=
 =?utf-8?B?SktSYkFHY3MwVE1ud1lLU3I1emY3aFdRM20weXV4aDB6OUxzMkhKckp6aits?=
 =?utf-8?B?NUN2UHU0TmlpV0huNW83SlVDZ2taM3NlOHZyczBIdXpKbmxxWnd4NzRWVlhC?=
 =?utf-8?B?cnU1MmtIQlZDZTU3RmQ2QnBpSklqdnJ3WXVhOTltOEY3MnlnclJCMHNXTjJt?=
 =?utf-8?B?UlpFcWFZeXJPZHEwOUVBT0xId0o5ZG43aHZzOWY3d212YnZGMmwzTFR5Y0Ir?=
 =?utf-8?B?MS9rN1QrWnEySzZubmRveTdoZnU4akFaSk5kS0JJYzBTcmhQbWR5V1F0Wkc4?=
 =?utf-8?B?TTF3T3hPQkxvUnk4NE5vL0xGMFBKRlNZdDY5NGplNXhrT1ltRENnS2p4ZXNm?=
 =?utf-8?B?MXNTQ2l1RmFXbEVSY2tOMFl6ZWpaYkszMmZ4cWNvdzVIREdaSTFTeTZWU0l2?=
 =?utf-8?B?NEhvcGtuWDJEbk9rWW1Ka2hzbTUrV2VQWElJS1Y1MFR2aUdEYzY3T1RBbSti?=
 =?utf-8?B?MEZ3ZVNYWmF0c3MvWHVPeVF4WFkvN1ZUSldJVFhqUStJTVc3Q2xZMitGRWww?=
 =?utf-8?B?N0pKaDI0bVlUdDU0WUlZVjB4SjY3TW10VG1XY0paWCtTVWlXMktSS1dZTHlp?=
 =?utf-8?B?b0Z6akFHNk5PWCtLanVONXJzeGVnMHRiMWFibURCNysvK2dUVXZ2Rm5SQ1Az?=
 =?utf-8?B?STZEOXN2VEgwOWhjUnFPOCtGOGY2YUZ5cWR0R3Vtb29hazQ4MDFNWHZEY0xn?=
 =?utf-8?B?NVBhZC9HL2piNzJJQjRWTjN5RHJla09kUXNPNy9UeUJQVDcwZ0o5cHlZbDlJ?=
 =?utf-8?B?TFNBd0NzaHk0MndpMTBSWURjcjlRRnFqL2ZNRUNyUXVNQ0s4dkRidWExVEZD?=
 =?utf-8?B?OVo4R0VWNk9hRnoxNTZuTlBlNnduaXlsNExjbnFvM0kwZlBDSHZiV0tuSHJy?=
 =?utf-8?B?aDdMUFoyOHV2dHp1cVd6VWtJVk9ucHArOWpPS0hTYUtlYWNHTG5KU3hzM0lI?=
 =?utf-8?B?RnZPa0pYOURoWkRXeTg4M09lbEkxNkxuUmNHa3gzbjdvSHBaL2ttUXpvRmFB?=
 =?utf-8?B?OU5haEl4ZWJ0ZU15a1FuNFVydmdBU1JydnRSbFpxT1FFc3JWNml1WUNjeHlF?=
 =?utf-8?B?WUZYZUM1eXpaTmRGakxtTEc4bEI0SlRoTjRmM09pWHhpOFVHZnhyOFN5ZnRY?=
 =?utf-8?B?Z0NYUmZtbDZobXEwTUJjZHFVY0Q5Wk45dlVBeHFyQnIxMDlvTk9LbUFTSXFz?=
 =?utf-8?B?KzQydC9sdUIzc21Bd3lneXJzSDJGeXBkbG5EcHd4ZFdvcUNYd2xBMERhK1lH?=
 =?utf-8?B?SHk1TjNnWnVXZjBwM0d1RzV3Zlh5elpZSWNWRTZacXpWYWwrZFNhR05LNHJV?=
 =?utf-8?B?OTl3V1NBTm5zK2FOU1FQa3gweG1McmtUSlhYdHNhTWU4NHhHOFBaVlgyTFo1?=
 =?utf-8?B?Vlh3bHJWeE13PT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac699fe-34ee-4050-af05-08da49781a9f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 17:55:42.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3546
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sumit,

On 08/06/22 23:22, Sumit Semwal wrote:
> Not for 5.19-rcs for sure, but I think it should make it for 5.20-rcs?

Ok. No problem. Thanks.

> Best,
> Sumit.

Best Regards,
Joel Selvaraj
