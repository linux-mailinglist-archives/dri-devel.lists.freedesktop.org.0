Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56904FE8DB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 21:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DD010E742;
	Tue, 12 Apr 2022 19:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A0410E742
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 19:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlsnXqoNcyeovgoUh/WqAIXDEGG6KERAGN85Q2Rm9uWOWNZ/YA5u4NKTfLl6cXuyEy2oRxGxQK0OdSj8V2ke7zKPkxjDfZhEXwBq37YYCawVpgLT/B5+BndTrf2MwvdB/yvfccecLokUw9liQ1NDyyA2G0Y4lplqSby+8OhbPA9NUAra3YhcPO0PSsEsT//T/QQrWmY5E7c2SJsdUmpARP+Bm1uYO3AhbyOvdMVoSgRzv5hnkreYe0I9byr/MA+WLMhGTPPsbSjWxpIguL/ebrvXMllOxeONgJQrUskDg7Tw8LlCbkLutmMyEWap6u4FDDRyE6Y4LREh3qWmrvQuTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8+CpsgdgLP5MUCLdjEOUvLxVXKt1nqr7Rp65cbOJVc=;
 b=ekpIMmUHVA1kbVjNZ2mVz0UvgBs8ovqrPd8rAYXWsGxgY7Y1z8/MoOqsahBKxWyMuAa9fXl9l9XFlX/bLjsnjn/wJU1qRL+wYa6DpOa71MiuK1ECsdhudHi17sYxa8+hINIgIn/75e70PU7nm4UdsEMq5qWDY0a7I0CShVSYYlhc50nXcmFvlMQUSYQxgVxf4si8tfcBX6yHiYX1R/K8roEapDwayuCaiWv300VtR2NCZeeolhtYN7WD3Smx1kqerRJn60AQK1f3YlcvfXRLkgdZlwulH+jq7C9Pr4sDjSFuuI4/0ODUpFjlyjd7c5nYFv7COIDlF5whrl4QaWvxlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8+CpsgdgLP5MUCLdjEOUvLxVXKt1nqr7Rp65cbOJVc=;
 b=nY1HowT+B+Brn1kn0bP8knvdpmQQMVnS0Co6McVGQg0nuacBzxucJSifoAvq7+TsAGheqUe8bC+8P6xMuwyfkQa1CSUZ2G7VBLutgPMg7xDgRqTqzjNusFl1RSVKiVlUbmJ3CdFVY0KtcQJrCTB7rvflVycv7Gl9/dUZaMNwWGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BL1PR12MB5285.namprd12.prod.outlook.com (2603:10b6:208:31f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 12 Apr
 2022 19:40:55 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::4967:ac3d:d5eb:ebb4]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::4967:ac3d:d5eb:ebb4%9]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 19:40:55 +0000
Message-ID: <f6de2b9a-005f-d1f5-9818-cfbee2bdddc5@amd.com>
Date: Tue, 12 Apr 2022 15:40:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <064d8958-a288-64e1-b2a4-c2302a456d5b@amd.com>
 <a04733af-5ff1-a1b4-527d-68b28a037231@collabora.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <a04733af-5ff1-a1b4-527d-68b28a037231@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::12) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b3ee33-15ef-4679-a0c2-08da1cbc5bba
X-MS-TrafficTypeDiagnostic: BL1PR12MB5285:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5285067E5C7377203CDBBFCFEAED9@BL1PR12MB5285.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fz/0qsCafzvmwr4/evoKy8k0f/Wz6ew1SloHZBXVUnA2SfnrnFS1urWIy7G5Mz7Dlm2V9Of9HKnngTznN2Y0pfS5KryWfYbcv/xtwzcI3PiuAwrcUkLPZP5YW9pAHmYqTLIYZSezOl9yyiYSPBPMR1IHaO6OajkHbgEX2wqTtaOLMXxHWsK38Wynjw74Rp0Tqqvz+jOUW+HWVWoeRLnzAYwuCXKkovABnuys5azmCKyrYWY51hZQwTwvCpICmvuoesvnwxMVhD7l8IOvrf+xEeZXRiTfgAH8vlrg67elL16KCrFF6QMRgTzjy7LKTT/MOXh/EtQmkgp5bzus0l8tEhZ0wVEexJLGoMbO2wX2Vl+6Jii5/LxSTRYzAHMXS95rLn86fj/+dWivgplK7LNkkOPKZKlNYB+lbLV3FrKWUV3Lb+0ne5A51OuiOjJUVWusl8kXxFxP+xOpjSIfYRHLLa96uZEeymg5VIx/RuJMcpCbVDdPMlIHQGkqsLVedBgJBB/BOrP3PdtUIOTdIWZhRX79Puu4lBHT0bh4/zrlucuDKdO9zWMTJf6vg3lOVDSDQBCUiqnH08YV23fmL8rLLoSMMk4+b8Yr44WhmGN6xrHwUIe9EQOJwkmnxpFL+h1RbSYW7BenqkMypHHLU4VXXhSXLsA6ogVqAnt7s5ORLI+EDKd1Crq0FPnaW4+3IAxkX5cuz0Tfub4GtbFLYFnYPgNdA1YEQMQV1rk1O4Z/RRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(44832011)(5660300002)(316002)(83380400001)(38100700002)(186003)(2616005)(86362001)(6506007)(53546011)(31686004)(6666004)(6512007)(2906002)(508600001)(31696002)(66946007)(66556008)(66476007)(7416002)(8936002)(6486002)(8676002)(36756003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cncxaTdKc21yK3VhR2N5YXVTSEgwSjgzUjY4OGlaZlI5MUs3ck1rT0hZOGVE?=
 =?utf-8?B?UUVMYXA5Z05uazFUZXBwam1FQklSaEh0bXVMZmNwQmhYM1N3SUxsM1hwV2Nu?=
 =?utf-8?B?VDNVbkVwNU5MZ3B3MTVIc1ZJTXFZaVdxd0sxSm1QY01IR21YT25oK3ZpT25D?=
 =?utf-8?B?QWJjeHU3SmZEdzVYbDlGZ1dyWCtjam5YNTRKRE5hVUI0dCs1OFdyWDk1VDdh?=
 =?utf-8?B?dU9jTGlQeWY3Vll2cXBQc1ZsVGowS3QxR0Z3MnNpTVNickl3KzMxbzBHampi?=
 =?utf-8?B?T1lvNktYZUdKRUJQaHBxVjdJVzNoQ2xUVFltVlRQK293OEliSnJJS1NwNmlW?=
 =?utf-8?B?Q2lyVjM4R0ExMXUrV2lMSnNLclBXaWZuR3BtN0RWU1o0aC8xa1B5dUNkOFhE?=
 =?utf-8?B?dXVqSGFmMi8rbm82V0FmZTJPWnQ4RE9tOGtrQzRXenVNZ1A5MGhwS1RRdlJI?=
 =?utf-8?B?aXE2Vmlub1NrK1YydXNudlVKT2lmWjVFMk9aTjBabncrYjZSQ24yZGFDK3hr?=
 =?utf-8?B?Tm0xOFpYYkxDZ2hmNDN3SzI4NE1ram1kVStuMTRPdjZCV2NTSi8wY1c3UjdK?=
 =?utf-8?B?cjBWbEM1QVdVWVRLYXNDcVg1ODU3ZTlCeFNTSWNvNkliejVWMjFNZ3BNa1BM?=
 =?utf-8?B?aC9ESGFjamZHQkVRa1B1T3hERU8rdW5hZTAxOFFGeGtXUys1Y0dybmlxdStu?=
 =?utf-8?B?L0xaOFJ5L0NoR3dreEcwUy9HWFR3WkNoQmNJRUdNS2hpT3FiYlBiNVYxM25i?=
 =?utf-8?B?dmdLcFZWd1lrbzZEWnZXWDFXV21BV2Q4V2p6bElaRFdLZGx4a05Sb2hGUXA3?=
 =?utf-8?B?dkkwYXJRM3hxZGpIVWVEaUlIR09weEtvSU11YzNlcENsbXpmQXFjaVNaZDQw?=
 =?utf-8?B?ZjFqTlFFcVFTdGhFV2xXeGRiNGFicHo5S2lkM2g3U0grNzVkc2h2YW1zQzJh?=
 =?utf-8?B?dkZBNDQrRWdTSGE2Y3dpUjgrZ2dHN3QySUN3djljQ0xQb0UrTWZMdld3UHRz?=
 =?utf-8?B?ZXZNcmZmbHNrQlpoN3pOTFhtQXljUXZUQXl0bEk1NklGcXBUQ1ByMXNuemo1?=
 =?utf-8?B?VFRPUkhKTEM2WmhGTGg5dEM5TGttVmU2T0xQY05SbWpxVjJOWVhwUUgyQVQx?=
 =?utf-8?B?b2gwNkFac0xJMENIUVB1ZlYxcHlEZFZNejhObVNDV3RVSXo4YTVBdTlWTVR0?=
 =?utf-8?B?RDNoZXRKVFNrNjZQMXBXRWwwc0w0UmZCdmRZbzhQMlZJdjhnY2t5K01qSUNw?=
 =?utf-8?B?TnBYTTYxa3p4Y3M4RXlSK3cxbEtQeFc4eUphYUNiQnVocCttTGFLUFc2NG81?=
 =?utf-8?B?TG5taHVQMUt5Q2RxczJVaGo4dWoycTBXNHNHSlRDb2wzRDgzMGczRHlWbWZP?=
 =?utf-8?B?S0tydlFDSUhWUmcvK05vK2VyNXBPTWtWOWp4MGV6L2tydlFLTDYzay82OGRL?=
 =?utf-8?B?ZjgvY2J6SUNPSTFTeWpqNjNPZzhmNlBCZXRnOG9SN0pQK2FqL0FXak9DZElP?=
 =?utf-8?B?WU14d0ZEbm9ubUhrRHo5WHg3RmU1N0pXdUtSOER0SjZaaWVLNExmQW8xRXBa?=
 =?utf-8?B?cldHZXZqTWM0S0JJLzJKWDlHYm1ERDVROVRlRTQzRlMwdmxWbVFRcWpSZHQr?=
 =?utf-8?B?anJnb3RVZDl5STVhRGJkcEdtdlZaMnowZm1IaXlOUi9HRDk0RmdxSEJJalBK?=
 =?utf-8?B?R0NheFdVVkIrd3VQRmRpeitLSC9HbXdlMHN2a2tTTnJtVGxxMTlmV0FZZmtk?=
 =?utf-8?B?aVRLLzhEZ2ZOUG96a2Zwb2ptZ0hONGhKNjFWWk1wVGNLTmNsVmpaeWVBQ3d3?=
 =?utf-8?B?U3JGaFZrT3FWZ1FNbWhKb2NqODVUQ2t1R1loNkN1cDJYZTdhSWxGZjBjUmRi?=
 =?utf-8?B?NFdTZ09ZalUyOW5seGlhclpRVnhLSHRiaWQ4dkFLaERCenk3eEdkS0JpMkZB?=
 =?utf-8?B?YlBkN3dTVVNWdHRxZWJOM2s3a0kwbGw3QkJwQkVLK1pKRnJ6Y2Z1d2pGaXBX?=
 =?utf-8?B?TlVyaHFmNklQODRVYkloN3pCQi9JUnJiUlRLYk1UbXlvdUlvZXdyQ2dHWlFI?=
 =?utf-8?B?aHFJNStRc2RRRlpDZHRUNmtzTTN2cW9SbGlEbXo0TnNTYVlLTkZ0dzdXaDZW?=
 =?utf-8?B?VFIyNnhNNkRzTHZtcDRINXFSY09GRmxjZ3NXQzV3NEdDWHE3ZWZBR200akRp?=
 =?utf-8?B?QjBoUjg0UGpPb3NodUVRbnpHMXNWRkUrZFJSK0NBUnd0WEtkRVFraTY4MWZI?=
 =?utf-8?B?S2NSL1NDalJsNGs0M1loVmpOdk96OHdhdEpabDZYaWRvRCtpTnZQV2YwUndq?=
 =?utf-8?B?WDVSUExwYzhLN3Y0SjlHZkxnSXA2c3BYS2lHcGEzL2l1NXpIRVpMaWxETUQr?=
 =?utf-8?Q?A9Hxg5WLomWUW1PbRiDNBUEe0xr4k9oJJ+tMBWkYq8Y9u?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Fzy4evj1h/GFw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b3ee33-15ef-4679-a0c2-08da1cbc5bba
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 19:40:54.8795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4CNoftl/4w6GwmQOyVZsD3wNXsU5af98gst5TFoVttv0rx8KNfcbnb376618wgiNJNT5uR9w3YV4j3exGNRKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5285
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-04-12 14:20, Dmitry Osipenko wrote:
> On 4/12/22 19:51, Andrey Grodzovsky wrote:
>> On 2022-04-11 18:15, Dmitry Osipenko wrote:
>>> Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
>>> mutex when job is released, and thus, that code can sleep. This results
>>> into "BUG: scheduling while atomic" if locks are contented while job is
>>> freed. There is no good reason for releasing scheduler's jobs in IRQ
>>> context, hence use normal context to fix the trouble.
>>
>> I am not sure this is the beast Idea to leave job's sw fence signalling
>> to be
>> executed in system_wq context which is prone to delays of executing
>> various work items from around the system. Seems better to me to leave the
>> fence signaling within the IRQ context and offload only the job freeing or,
>> maybe handle rescheduling to thread context within drivers implemention
>> of .free_job cb. Not really sure which is the better.
> We're talking here about killing jobs when driver destroys context,
> which doesn't feel like it needs to be a fast path. I could move the
> signalling into drm_sched_entity_kill_jobs_cb() and use unbound wq, but
> do we really need this for a slow path?


You can't move the signaling back to drm_sched_entity_kill_jobs_cb
since this will bring back the lockdep splat that 'drm/sched: Avoid 
lockdep spalt on killing a processes'
was fixing.

I see your point and i guess we can go this way too. Another way would 
be to add to
panfrost and msm job a  work_item and reschedule to thread context from 
within their
.free_job callbacks but that probably to cumbersome to be justified here.

Andrey


Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>


