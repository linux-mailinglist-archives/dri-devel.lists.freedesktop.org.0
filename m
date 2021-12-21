Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0168547C71B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1DB11B5FA;
	Tue, 21 Dec 2021 18:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD0211B5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:56:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8KBiWT8KNj5EeViirenXn4rTqQGCCDJekj1SAyCMDcHnld0Kmyv48+BoYuDAFXKr5seROz1XyN3m6/ZHkGRM13I7cjW5YJFlLbyuN4Fcsa9qRWxbfyL+FRMzmS2RCRIpqOpn+VZ8Gy2M5+L6BCm2+Rx7nLKFAmXUkbKZlmGBrz9/OaXoPlBY975Aac9sPOpKZA9Rd2FYKGe347DabDP1wKWCDcR1bbxhGFZ+tRGSbIbEj9vB20x09g6yziuRfhqAfVOvWtSAh+y8qIMgh1OXdnmB96EQu6iT8BnNW7W10TPJg6E0ajIwwv3cs9wxr12lsQbZrydX0ChpwO1Gpg5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5v+gzw7pFRn9dfIZQqJrofqu7k3jad4oQyykkMAr68=;
 b=SmAiOBQMqcqjPQ2ibmdlwykVJo+CipPPNHviVo0vv+vjAB2Ye6vjUu+mg3+2jAOESjDWz8MS45J1H7zt5MDiX1w8Idr8TBhbKlUKc15VA6jc/W51SJl2j+3U51fkEKxdPs6xh++noQt9RAgsS8GXpXSVFEdx8vq6oKyoktoh9z2lsZb4oqPu7xx2pUGuuAjRLCAF2otjDupQI7i8g2Qk4fe3i+nUFo+WgFebz5ywuCV4eo94Fb1rSFD++P82snAn9ojUV/Q7AwC5KF8VLdMHEfzzU3QTatWI/54A9FYBO9QZweRWYyPVnSEEdg4ZNIqU+dRajBprpqsnr9K+MWj/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5v+gzw7pFRn9dfIZQqJrofqu7k3jad4oQyykkMAr68=;
 b=dclnxGwuY+UOmS59lxWLgZj5EVq552pR0SNL5UXDMWukO4np95Bbesj6KrDGMXCaT3cYE82ORT8JrsrCQDwu0KXzbMcK7Pr9BTVgrRARAx4Om+rJVP0zD3Z624x2kzV293R9skxxb4UdZsdUYEdE1xdpWLV/FblE78S0gX7rWyi1ItTPWsqT1T6GxciFEkAZHorz91SfCcZMz0+LQVJ6PvaPwQiWHDn3pAM/VLRok4IL85XqG2Qz3xcL5Gkf2QjMmvscjAh6rqSBMMFvK8o9A2CrrvYlKn4lwql1hab+2eC93v1mU0Ic2LcqUWy6nGLSu0tA3xgPjsXHwvWWegHsUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 21 Dec 2021 18:56:01 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%5]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 18:56:01 +0000
Subject: Re: [PATCH v16 08/40] gpu: host1x: Add initial runtime PM and OPP
 support
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <20211130232347.950-1-digetx@gmail.com>
 <20211130232347.950-9-digetx@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <21212ddb-205f-71d6-0199-d75768eaf32c@nvidia.com>
Date: Tue, 21 Dec 2021 18:55:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211130232347.950-9-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:205::45)
 To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4759d3c9-fe87-46d6-2d7e-08d9c4b387ce
X-MS-TrafficTypeDiagnostic: CO6PR12MB5492:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB54920018F7D4461B715AFDCED97C9@CO6PR12MB5492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0KYasui4KMQX0w2/bae6ptIPpJ/N9aHcuPhZXMYP2zCpWNv2UQXNrRe72tk19+3kCjahJrHl5fbB6fL7MxGZiJPxvW7HoROnkf5w30PF1LoRcN3CX3DCf8CjbYW1LsDN5AoT3gKn+viwIS4j+rof9NeVS9+A4zvNKtLnOYIiDd6YUcCzdEkcTmV2WJKqBmydCRPWBtpLQLa/BUMG06GlzeCpEXS/OFtde+jopCj1tGodgpgQWszCV0UFlNNI1Vel330vaEIySslUFxwDsyctRngp4jy2o/yHq3ht5mIEaSNkZOaCCWong2I753+9c3cUxhTpVZGR1HmyJ0a6JPihjfMjggnyAyS/jibwsvSsO68Sn4SA+S9bnU5OzReJLiYO/2qNPhV0QiXcZQH6JnpmrpY4Ix549kjACcLzhEIAz0e8gG5tGzXrWXAsrqZOY/UWIADugZsAd6EFLeilOVyaCx4xoL26dL3WDcQYJJOmYdH+yCDiiK1gys3Tb1xmKXQSzC991Y6vifr0uUaYeyI5AbkxL9prMN16hA3e/fpN/rjcYo97mqsVLOS7yEPTojrb/GWQJBJji6902+d3dRCqkwjWnJxuFPN7kn4Yqk5iIKj7aCHTOEXwe0VeVVDa1sLbJQ/YFGVECW4vlsbY1fd9bHGBV5K52fX0a9lStCrnBdXtRkSn8QC6kay/xhtrT2V7zHMFDs5dszb13O6PX3wugA2MAw+XUH3Z4eJXOUhFnyx6H2uOY8FQN9WCYMNPwexO8qN57N4LfTG9/LX0Douy4ra/8C3m2iIYbeo5R8fCoa4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(4326008)(6506007)(53546011)(38100700002)(66556008)(26005)(2906002)(86362001)(921005)(31696002)(7416002)(8676002)(5660300002)(2616005)(110136005)(36756003)(4744005)(6666004)(186003)(508600001)(55236004)(66946007)(316002)(8936002)(6486002)(66476007)(6512007)(32563001)(45980500001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0swQ0oyQzk4VlZSSVZCZEpTUHZMS2ZESDRmbCtnakcwTUxDajd0RVZ6dUVW?=
 =?utf-8?B?a0Q5NjA1NS9NRDAxTmY1bHJ6MERiSjBRZ3ViTklraGZTSjlFUGpGOVdoTVlP?=
 =?utf-8?B?dDBPcHpRVk1rZmliYm83S3VkcmY1N1Z2YXkwZlFTZUlkcnV5RVltbEtTdnMr?=
 =?utf-8?B?Y2NETklXbFZSYzAxSDlzSGZiU056RDhGZWZMd1BKTzRUMi8wMS9WMmN5VUU4?=
 =?utf-8?B?d1BrZWwvMXlSb2RiT2htL1pLSzcrN1R4ZmVrTDlZa2ppN09ma2lCMktJd2V5?=
 =?utf-8?B?eEVEQmhYeXJPbjArZUw5eGluaElyTm1XYzd4UUZscGVEZXJmb3RNeTZ3V1ZO?=
 =?utf-8?B?NkU3MlZYVUE1Q2lYTWIzVmIrd3NnZnR1cThpdVNnYURIZjJuMExXcWFjeFkx?=
 =?utf-8?B?SEhONWhmT0Z3V0Q0dlF1VU5FWEdBOTRsZ29Ia3hiSk04cjA0bkQ2U2U1THdS?=
 =?utf-8?B?UndSLzZDSEZRTnhIaURBeUM0cjBPS3d6S3ZBRjkrR1VvUFd1bGljS2VkcnNn?=
 =?utf-8?B?bkp5UDhabVN6MDI1MDJXR3pjRldodldwdnFoeGhRWEFWVXIrRjRzeWxCUW1H?=
 =?utf-8?B?emVJRmxYcDF0bWdmNTZZZ0gwZzdUN05FMGNuL1RGdCs0V2swa1RtcEJ2T0Fr?=
 =?utf-8?B?YmRqZkdzeHM0Q0J4YTN2NGF0aFVMU1dqb0JVMUJpVWpML0NYb3hzUndhUkdS?=
 =?utf-8?B?QU52N043TXowcHFlUVNpSWRmN1V0QnNaVE11SjdLNUJFR0hEbjVrZlFrdHIx?=
 =?utf-8?B?a1dpc3dkQk9VL3dnc29ESktrSXQ2bFRkSEpRbFRDdTdaVFgzdE54V0NYU3R6?=
 =?utf-8?B?amFJTVVTZG1lNHJ6ZEVvdVpDaWhZNjZGWm5ndnVMMi9oYVpuc0IvUWtHNko4?=
 =?utf-8?B?WE14WEIwYUNhN2o5Q1hzaWJOTWR0Qkk4SUN3ajNiTUdDZVFpdXkvQUlzRm96?=
 =?utf-8?B?clp2OGw1bHljaTR4cDUrT2lCNjlrKzBUL3lhYkhPWGQ5aXYwRzRMOTIzYi9x?=
 =?utf-8?B?Uk01QngycnQ2WFZCRTFDWEZNNjQ2R0NZSUptSTRhckhHS0pYME9MOVU4ems2?=
 =?utf-8?B?UjdKc3VnTjA4d3JVaktrRTRqL3haM0U4RlcrRFg3czFFWVhwZXhZQ2JCK05x?=
 =?utf-8?B?bzArUjdSVzFicEludjdEVS9kQzgrRmdueVdmRGNpTVYwYnc3YzhYK2I0WjZW?=
 =?utf-8?B?eG9FY3g0Unlac1o3ZU82UWJIaWh5bkhpVEJmTnlBN2lpR3lJd2VhNlFpdE0r?=
 =?utf-8?B?bkVTVWtTSEIzYzlTT0dVYWt1SEZOWnNpekhKQVVOYkdqQzFLQTVQblRYdUdK?=
 =?utf-8?B?Z0Ird2MrVUtQaXZUbXh5S0IxZHNMbVN2anNVYmk5UUkwTVJyRFpucmFQUzZt?=
 =?utf-8?B?YnFYK1ZjS2ZEbC9OUjZobVdGck13bVZVSm9kT2dkbmZNa3g4RGQzN2hCSEJD?=
 =?utf-8?B?RDB0eVpiSm9JL0RCeXBiT3g3SmZyZWx4RmdFTzEyTmNpeS9UcDZMeUFCUUF4?=
 =?utf-8?B?Qi9tVHYrNUp1ZmRUU1VXS1lFbTZLQ1lhai9HaSs0SThBUURnMFR4QzlDY2xF?=
 =?utf-8?B?K294RXR0aUhCSTFCbHp0Sm9ESGJMZXUrWEMyN1paMkpqdE1TRjFpOXRROU1i?=
 =?utf-8?B?MG9DU1FRRGpEaEZud1ZON1ljWndJYTBuT1A2cUZxQ2IrNTV5MUxGUjVZU3ZP?=
 =?utf-8?B?TkI5QWZ3TmlrVmd5UVhmREFtTE1rTi90RnZQZHFGMlpKT3dHeTE3L01oMG8x?=
 =?utf-8?B?NUxSZUhxQUtvbzFlbGxMVitFeGcyOXpwakd1TXJrNmZxUFpRY2hDdUFTVTVT?=
 =?utf-8?B?Q0ViNGNESDdxU3NXWjNOZzBQTFM4aHpaVVVhb05JK0l0TEJ5aFgveVBkSFEv?=
 =?utf-8?B?M1Y5dWVHVEpodnpYUGtRNU9IeUlSbkRwZFVibVRkWkE5RmVPR3ZRV3ZBZFpz?=
 =?utf-8?B?RVZRVWJLL1J6V1FTTkZxNU11SEJhbm1lM3VJMGh2QVk2MWY4bW14dG9qNmRD?=
 =?utf-8?B?Z0hVRk1HVUgxZFA3ZzIrQ3dPM0o5d3F1RGJzcUI4cXROeFVwUHAwZ2lQZllU?=
 =?utf-8?B?MmxldDdrSU1uK1hYMlpTV1Y3YWpyempZYXdWRXRqcSt0MWNIN1dGTmp4OCtj?=
 =?utf-8?B?d2FFOW5iaFlNMGNVaXdLWDF6aGlFNUE1SFp4T21aVjVpa3NjWnBkYjVuS1hr?=
 =?utf-8?Q?jVlfxQEcLgHYdRs3JdwTxEg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4759d3c9-fe87-46d6-2d7e-08d9c4b387ce
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 18:56:00.9109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eu2g65v2wupkEfGa+ULr0z6AR+9F093TcCCJ93GsDW1MOIXSuJ+QT/6yVbWdr7ys3tbZuyIbUekcU7I8X8TNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry, Thierry,

On 30/11/2021 23:23, Dmitry Osipenko wrote:
> Add runtime PM and OPP support to the Host1x driver. For the starter we
> will keep host1x always-on because dynamic power management require a major
> refactoring of the driver code since lot's of code paths are missing the
> RPM handling and we're going to remove some of these paths in the future.


Unfortunately, this change is breaking boot on Tegra186. Bisect points 
to this and reverting on top of -next gets the board booting again. 
Sadly, there is no panic or error reported, it is just a hard hang. I 
will not have time to look at this this week and so we may need to 
revert for the moment.

Jon

-- 
nvpublic
