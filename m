Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAB4509AC2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 10:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687C210F3FC;
	Thu, 21 Apr 2022 08:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8828610F401
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkTg8SkUNFDm2sv/msmPxbETD9320NOALaQJG3tSOdTWvt5EuXD0F9PCdxJVaTc1NtTxzo2ctJm2SYM52hjYd9oseTWoXnO18YYpxTEHYIxc/xJeNbyTx3rzayQMucVQryzEuq7NRs8Ym+J6DbTfU0dv3gXbB6C1AMPOEwOdOIKzYa45nOT/xllDVP+dXmcQPA+D4rcQiwrWs44dibaSgVaj47WSYVt1RDW+q6LAxqfad4oGhwQMXWjv4DrsyhQVCSxQqXj457KnlDHRD29nSxdLSv2LLJhUsIxvPByjq4IxMgRd4ctph/ez4xcNuL+1SzelrIL3a7HXRPNXwT7jgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45LSie8imRkKKWFN/jyK6rB29JrCJZkt6R/NbzmUMr8=;
 b=h87i3b3lZCM7rkQE8AyfdUiVixVgbr/BIkA1SYmAsF6XM/iKw1r3R3s20dh9r4zE13v4PY/aCFblr98RHXOOs36p1UEMVBnCJYUaTpluOywYcXWGpWyWNkr2UKh8YeNcaEfVrqw+Z6oDTZDft0mYpIqgjJ//uUVlXyBWC2V+v1IU1l9qchMZwjMhubzm79Yc0k9yvQC2PonjIgJAibsEqOf1WSRlNU47fo355417zJuDLTWlPKO3YS3M4oXz0z+2OITo4r9z+m5fdiS5d1mSq+qjInjyAFswt+rOXG5EIZHlmrzD/Lw9mu766JYBEsWInU54WRgBhgzNalodHcQjdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45LSie8imRkKKWFN/jyK6rB29JrCJZkt6R/NbzmUMr8=;
 b=ZpFKIfQCc4wmZApb03gHGaoTTnt8Q+mD001bjcxJc8pLqNoDmvSQ/YKNvP7qhr034XzEwf1X/79LAQoqFWJXq42bd1SJLO56K5byGuFXxEex34UuYrTlP7DHpRvFL9m61gxk+oLd5cYnBkShkY/XDSIQmM2AbRNcbawUypm0xHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6135.namprd12.prod.outlook.com (2603:10b6:8:ac::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Thu, 21 Apr 2022 08:34:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Thu, 21 Apr 2022
 08:34:26 +0000
Message-ID: <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
Date: Thu, 21 Apr 2022 10:34:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Cai Huoqing <cai.huoqing@linux.dev>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
 <2aeee5a2-b5a5-348e-ccf7-04f49e1119da@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2aeee5a2-b5a5-348e-ccf7-04f49e1119da@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR04CA0031.eurprd04.prod.outlook.com
 (2603:10a6:206:1::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02ddc887-ce5e-4103-5700-08da2371beb4
X-MS-TrafficTypeDiagnostic: DM4PR12MB6135:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB6135F7D135DA0C2E3F46ED7C83F49@DM4PR12MB6135.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W3YH6kb3yfb0+Z7jg3I+s3enVz9pg3XFGoeZRDGz3KP5ll9rdlR1T/fBo8DuzBMTfmZ24qnBqE0/sMexhgLbB6HbMhG10uMFGCTcxR9/EI/g7QuLiqBXdtgK4xQP/StapfTDcCYyiAahmkzq8V+Xu1o3Q0zkKabRq/AS5u0PGwMQpvaaUXDxXjXK/XGqFTpHxqxMWTHTzHMydmlic4FBbYVqGrIiivfavocfbTg8Ae0aU91PYCKVt280qEGZPWqtg2r64mw/e+WoGe/pasvusCWdhb1fFPZ06SoxoRTZhXHSJIXPGeODdCLHPLXUYE178PqOVpZ4/4OkYNiOAgdu6C6eJqZG0UYVRId8VxUOnOcUoxCM+ZihyegCCp3kiRrBkraK7HWID0ZosB5yEIGgNGE1Xyk3VWhm3TMiP2Sp6MkUZjcLa3t6zdnC3l7JSgCHC/bD6FlQq9mVrqAmsUHm03llKsKp8qC5QA9Lim8Jsd8G/ZJtuuUJDxkE82pgtqiXwnHw1D7E/X78zwxKWFcDps9PyG8sjAl41UpwxTnxDPrW+eo2y5f00aJ0L/U7He+FZPoOthYt92fiv+JsN47Qkw7D8zjuadbvQmOay4YFcULkeZwai7C63Pm4D0bn5izIApEC3Al5mP2fgAw+K14kUGNowr6ANHG+NTnn0KVGQJ6j/auUKYqtbLZ6qlj/iH8m0QsDiZF/Du8c2ELhsSutUtT/xKZAhVtgfXmfYxaqnXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(66556008)(66476007)(2616005)(54906003)(66946007)(36756003)(8676002)(31686004)(110136005)(4326008)(186003)(316002)(6506007)(86362001)(6486002)(31696002)(38100700002)(83380400001)(8936002)(5660300002)(6666004)(2906002)(508600001)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXliWWV2WFNNaFVKVUdWUStTWjFLOFFIRnRYTG96MS9UVTQwc2xNRGZBa3Nh?=
 =?utf-8?B?N3ppaDhFRDQ0WGVseGhaVmNPa3k4R0VGYlUraFJyOG5Xdk5qajgrcVhnR3JF?=
 =?utf-8?B?VTd3VkxycUh1TXY5R3pTWFRUcWFIZFJMKzcxNDhVSzV2VVhjYjRZdVc5OHJh?=
 =?utf-8?B?Rmw4eVhjMk1XYzVkWXpDT3JFYllvR1J3d09HNlRaUEkyZWdVQnp1SWgzN2c4?=
 =?utf-8?B?MTJITXhCQkczc3BoclJ5QzZWeTl3TW51RXJNTVZNQTB3K1ZlOFl2Wi9aMWda?=
 =?utf-8?B?ZGlNbklPekZwOG5yajlrY1BwRkFBYUxvY2Q1QmhmQ1VLRlBFb2E0L3ovSHlk?=
 =?utf-8?B?TVdPZERMbmxYRC9LTVp2RXd0K0UvOW9GeVU0eEZ4Wk40SXdEM2JUOU52QzM4?=
 =?utf-8?B?andnQnlQOUNhWXQxc1pVRXV0NnRPbUx5Q1NQQ2dabzZqUUZsVlRXUkppa1dy?=
 =?utf-8?B?dTFqdGt1cHc5OE1lNDQ0OEI4Y01mbjR1YmllNEVGUlk1YVFpT1h2VjlZK0d4?=
 =?utf-8?B?MEVzMXpyQnhPZ0hwbXowSGVHaEwwWTFVb0VUVThyckpvQWNXRE1oaFhoRE01?=
 =?utf-8?B?USt1cXFYbjNZSUlWb2tOb1lUOGplalBMYVJHTEthSTJtODFzYmxCMjhIaFRo?=
 =?utf-8?B?MXFGMXRNalJRZk5maEgwWmRncStGbEg3K2l4Zi83UXlBNDJwdUNmaFhLRGdN?=
 =?utf-8?B?TThUQjI0eHBkM2FVeHNkZEUzZlJvYXc3WmthWjk2ZWQ0dDV2Y1picVBGSXJj?=
 =?utf-8?B?b2JydFpOZTFxSXVxeDZqTVBMNlpOZUoyTXRjMnpJdGYrU21EQTVNV2NoVXZJ?=
 =?utf-8?B?RmNCQ3F5WVo1MHlSbzhmSzNCdjFhR2dGYlVCN1pzc0tHemlEV2tOLzhJaHd4?=
 =?utf-8?B?SExoK2E5RFZnblZyTGE1QlM2UFJ3SEs4SDUvNllDazROUVBUcW43azRVTWgz?=
 =?utf-8?B?a005OTllMk9NUVRNcktkcmNyUzlsMitzQk9zdEFMY0hwdjc0TmZDcm5qdk1Z?=
 =?utf-8?B?TmNEYWJIeVBzOWhqaTdMai9tSGgrTXB1SGx1ay9aN05KczhicEp5TnN3OFVz?=
 =?utf-8?B?b0lsR1NwbUVRT3JxNWVwRTRyQUhKYjM1dXpnejVHSlQ0a2JwZ0lNR09jTjZS?=
 =?utf-8?B?R0FJNDBaTDh1WXhBemZSemNuajFXZklwZkhiakI5SXM4bzE4emptSjh6LzVJ?=
 =?utf-8?B?aTFBc0JRZTRVU1BGMSt1VlRPY043ZEgwcEpyN2ZnUkxzRkZJcWVOeGFCM3cw?=
 =?utf-8?B?cjRZdzJwLy96T3kvNGZZYkpNN09EU2M0K2lSNGpjdWtTNDZpQ1dFRGZOSEFL?=
 =?utf-8?B?UjNUMW1pMkRrdDl5cVBzQW5nVFVMNWxMQ2p4QXliNVZNS1RWTUd0V3Z1OEw2?=
 =?utf-8?B?TXJIWFc4bDM3L2hlMHFoWFlrNTVwTkJCRUJGMVV2NjJVNzJFV3JLY1E3U3Qy?=
 =?utf-8?B?LzJIUmRpUC9CMm91OFp5Y3RTUUJ0K3FGUDZ0cE5yZFVXc0ZOeTl1Nk1EbG0v?=
 =?utf-8?B?Y2NoQmFvenYyQUkwbVVldFhrLzFHOGJVRXJ5YlRzbU1YSzA0em41RnprQkxN?=
 =?utf-8?B?STJIamFZcGJyUzc1aG9Ia1ZyaXpGZndxTWlSazdjRzR6STFMUTVCTUd5RERG?=
 =?utf-8?B?OVZWVWhqTkNkTTVTV2c5SXh2NlRUbnVFeFVpUVVjSUh1VmhKUU9WZ05XVkdW?=
 =?utf-8?B?ZWZQb21WblFpWGJvRW5QVVFiZlpIY0V3TThlNno4VGpKTHBhZFpTenRiWGtK?=
 =?utf-8?B?M3VPcUl6OW1tb2ptM3NYUEtnTktyTVdIbG9SN2Rpc3d4S3pScTMwT2t5WWU2?=
 =?utf-8?B?Ym5pQ3lJRWpld1EzdkRsL2ZBN1o3c0JXblhzc3hoSGFQWFdmOGdKbFNsVjFa?=
 =?utf-8?B?MUIzQStVOVJyamxrdW1EMmIyWjdFL3dhS1ZSSW9YSTRuUExjcStWMGpYTG51?=
 =?utf-8?B?ZVUvNElZc2RNMnE0SVhac1pLdDB4SExsZzl2MldnRWJLempEdXVqNHFKNExR?=
 =?utf-8?B?SkJJTFQwVGYvSVgyNDZxaS9zNzJpUUtQQXl6NFpDRWprTWI3YUVzaGl6SWNx?=
 =?utf-8?B?UnNHeFRNNjU0Vkl2NmhveDJRRS8ybEdrZWpIVVZEV3pMaUkrSkd1aFZjRjdI?=
 =?utf-8?B?dlJKVG5HWkJxazNIanZCbmNHbUJZTkJnTm5ZNWtMU2Y2akJLcElFK2VQMWN2?=
 =?utf-8?B?VHorbFdxUnlCTVNKNkkrZ1p4QlgxSFc5U2RWZnBPVEhhRGtDaWducitzY2Q2?=
 =?utf-8?B?WFp6K0oyczU0SnFJNFdhd3c1YkhDWjJpM2tFWVVheEI0ZUpGYXhGNjFld0ZF?=
 =?utf-8?B?RlJJNCtleEY1MStiaTF6eVUrdUFQV2YrN0lPUFRvNWVVSzdKNENwUTk2cjdL?=
 =?utf-8?Q?nQ2d9QdWOMIokpgo6Y9tAWRBa0pvo8XZP3gjiExF/7oIR?=
X-MS-Exchange-AntiSpam-MessageData-1: rQR51j23UW932Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ddc887-ce5e-4103-5700-08da2371beb4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 08:34:26.5831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OQncNVYniHhQlvyMN1LOjCDptY/Z8Lnew8hhOkk0N5xDzx2WV7r8fuhQyf3RBuS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6135
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.04.22 um 10:30 schrieb Thomas Zimmermann:
> (Resending, as some MLs didn't like the size of the origninal mail.)
>
> Hi,
>
> thanks for your submission. Some general comments:
>
>   * some functions are prefixed with dla_, others use nvdla_. It seems 
> arbitrary to me. Please use nvdla_ consistently throughout the source 
> code.
>
>   * For reporting errors, please use drm_err(), drm_warn(), etc. I 
> suggest to rearrange the error messages to not be located in the 
> innermost functions.

If you plan to have multiple instances of the driver loaded at the same 
time, using drm_dev_err(), drm_dev_warn() etc.. would be even better.

BTW: I'm still absolutely not keen to enforcing drm_* log functions. So 
if you prefer to stick with pr_err() and dev_err() we could discuss that 
once more.

Regards,
Christian.

>
>   * Could you please split this patch into smaller pieces? It 
> currently hits size limits of some mailing lists. Maybe add the 
> register constants separately.
>
> Please find more review comments below. It's not a full review, but at 
> least something to start with.
>
> Best regards
> Thomas

