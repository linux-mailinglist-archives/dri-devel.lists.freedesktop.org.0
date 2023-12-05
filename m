Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A54804A8B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 07:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2349310E168;
	Tue,  5 Dec 2023 06:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7610E168
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 06:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mb3l6AnmB4YIyBVd98rltKkbwi9EIBMukXpGjL5ZirehXr+D/x780w/M4llIZTzsPM27RUVcHRObMB0dJXw8aPNDLxp1fNyFbCKVAbik3KukPNGBHaipw5JBVFoJAIt2ocFI2sOwC1XDVUvIqMVWqXe6dvB1Q14xmktSyD1SgE5h9nIc0ZJZ5+SLA6aHO2fu/H/IdlR3TALfVdjA3QqRtadVKp6MlKXi/Udgg8gHjOUyyVaNskGlqgOvhOcchCCjnR8rNN0bK3TCMNcHWavzhyO7g4vYMjKAB8fBUhlyBzDZOAR4wmQws6ff09ypQlPoVHuP3I9uqy8g5H/RGtC6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyTlecyqbjD7w7FpPfn5ywtsnG0mOoeU6wY+B6z9WEs=;
 b=Qwg3R2kgUO9wBlfbZK7ZPkw/WkCgld0bblQvcOO1vvqMkIKkGXTPes2Tg7IUpBlRHJWbMA2P0tqUOZq37ty1Wq1vW1BF7Se89KAWrLvEbD6e3gPHge/AuSHB6qniVAqsGeR+crSDWo5BTiuBNG23Aodq1cf2OG1M0PKEy853ZMHGfGu2hfLR7aAUIZNLrqhWb/AafZchvX4hM6u3/RfhiT9iPbev3Z/BbJr0LlOzE/vkZbeoxBR5HqYXVcoy6dRLBy+4vIZWJ4adofLU5c9gHuHlf+ano7pzPADvWNHy2+W9/p0pLSoW9FPH5tVBkeUc5X+zMRFTosLMiGhChG6Zug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyTlecyqbjD7w7FpPfn5ywtsnG0mOoeU6wY+B6z9WEs=;
 b=f0Eun7p9QkbloewRfZlB/0dW+rq+pA7vrO4ZDiZ4huWU4mfvVaMltuvAJK6NiyQBn8yKjG/rF1Buup801bNEfly9jSe/xvVBPCJNblMF7mmKuxZMizYtaa7056ao9+FnWZqCP8OY8+XCyws/krluARIoGmK/pQqJUU1e3llvps0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB8861.namprd12.prod.outlook.com (2603:10b6:208:487::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 06:46:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 06:46:15 +0000
Message-ID: <69d66b9e-5810-4844-a53f-08b7fd8eeccf@amd.com>
Date: Tue, 5 Dec 2023 07:46:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/scheduler: Unwrap job dependencies
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230322224403.35742-1-robdclark@gmail.com>
 <b9fb81f1-ac9e-cf3f-5cf4-f2d972d3ed3d@amd.com>
 <CAF6AEGvMwZCLntfYeH3Vg_Z7kYynqdVrinp+pmcbREksK1WGMA@mail.gmail.com>
 <e2fa296b-9b71-a41b-d37d-33f0fac2cd4e@amd.com>
 <CAF6AEGvdVca_mnZVo9He9oKVfYp84e_kOPWaxX+K5aV4Es9kcQ@mail.gmail.com>
 <CAF6AEGt2D6Ei6OkUK5osz+jWzmkX8tmB1KGi305HaNd=bnQSoA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGt2D6Ei6OkUK5osz+jWzmkX8tmB1KGi305HaNd=bnQSoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: bee50c23-c474-4ca7-8f11-08dbf55ddfce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEJyZDPrXf1rwNoGc5BaNjPNkZTX0cHmJrveD4VMWR8QvUKCb8MM6LhsvX23gtIyTMcE/JGoX00D5R7FodSTxpVf3GLJy5rYhNBYKKa5OHY/WCqfMSnG9p1wwuXWRkSbzmp0LSxKWRuqHCz+ZxAE5PAvwsg60ri2VRu4JUGBwlc0EFHOsyyZLFz5OYxbRAV7LJj9VLYZbGaAHk+LFxxsi+ZHn2yGGKvURwr3QEjBOt8DLFIGJpeTBKUj+qD9jOml7UP7+fdVbbHoi0varoLZs1rJKazSLKkKefyr2BKnnvpBx5NJLKzTV/7TvX/o/DAUoCB/rR6hnr98byZH4xIW6RG39plh+gvyudAHsDuJMW16Ki/wqbAqbpKXhVSeBN/cCslSIXDRSrb+uuaoNiJEY0ZYRA7IR9TKCvpJBCJaopb5Tkrt2Q7GNE9ux6C0Dgcy3Io5AUM9VEWpdYCdVccmF/plyudLSehhgZoCwhcyT3HxhD43pK3GgYR+OsgXFuXP99UaEtzdunzwsFuzAbtLctvBxR7fyP5ZtiR7TYQRLOQ9F92uwUzh8xIke5aaMO5CSnZEG6DQiEwelNKz4eV/4VoBBFMen67QcglLXIHbGMXS2wCeUKDxCABjBiVnx5hHWQldigMfBtrQL9fZ0tPrgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6486002)(83380400001)(478600001)(6512007)(2616005)(53546011)(6506007)(26005)(6666004)(316002)(66476007)(54906003)(6916009)(66556008)(66946007)(86362001)(41300700001)(36756003)(8676002)(4326008)(8936002)(2906002)(31696002)(5660300002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHFlS2lwUGE5b3hyMHBqK2RFUXEzWFVlZHFmdFZ6NlArRXhvdnB1VS9iT3Ns?=
 =?utf-8?B?WkVycjhROGM2ZXdRRnppa1pRRjdzRlF5S2NQMXB2VmpRRU1HRE5GTUpmNkth?=
 =?utf-8?B?YWs5b1BINVNlOGdIWTNrVHRsck5Jc3R0Z3p1V2d1b0p2dEQwd1NyNGVESkpK?=
 =?utf-8?B?d25VSzBtZzZZYThUNFJBQUpIbGhlQmN3MXdkdzZCcnBySURodmpYM1ZQNUp6?=
 =?utf-8?B?NUVqK0dMdWFhMC9POUtvTHNBMmU5VjlXTWZKZWU2Z2RVQ1d0bThLRGRKMUpY?=
 =?utf-8?B?UmtuOXVVTUFvL3pYR01VUUwrMlIzVzFEc0dVU2k0SDlGM3dwcEg0NEdQaVRr?=
 =?utf-8?B?N0U3R242OTM5L2E3LzdWelZramdYMHlZS3Rybk1nVU4xSjJDQU5vaUdDeitU?=
 =?utf-8?B?dXl2cE9UK2hsZlNvQ3B1MTh3YWNJdkl1SVdmUWRMTkYvdU0xMUVQMGNEaWxH?=
 =?utf-8?B?VjNRU1VKMVpvNG9DWWpub1V0bk5VNDh6QWRDSnQ1RDRXTGFHMXUwRnRiVHZE?=
 =?utf-8?B?bmJIQmJidmJYdUhJN0pubU9qSE1sVUJwdHU2SlM5TWl0THN1UFJrTmJvcHZO?=
 =?utf-8?B?TTAyNWR3aFBMWWJibG81VzdEd2lNYTRmUUNPY1ZDc2lYNXRRYkFzd3EvN1lV?=
 =?utf-8?B?QzBET3M4Nmc2czMyT3NGbEh6N2Z6WlR3QmxuVnRwNVg3UHRBaGZJazFBemJ4?=
 =?utf-8?B?b0NzekRjdVVFcW9tV1dld21oTitqTjcxSjRCSTZuL0ozTlpob0p1RE9uQjlZ?=
 =?utf-8?B?em1qaTJrQVNnenpLN0E5WjVzMjArNzUvVjVCYS8xSjh2YXVwaUNCQ1ZWUytp?=
 =?utf-8?B?T1pGK0dRMkFrQW1rRW81Y1U5NWFKaVp0OURldWs3OFlmc2VKdVF2ZmpUZ0tZ?=
 =?utf-8?B?Z3dqRjNTSzF0WDRSRVNXekl1U1BmVVk4ZExwOW0xbVh3citZNHlpdDBCdXRE?=
 =?utf-8?B?S0VjVVhVN1lsVXBQQ2E4aEdheW5YdkxjTGFsOE8rd3JwUWRJc2d6Z1NhbVRl?=
 =?utf-8?B?UjYrZTFhN3FMSWZGLzlNMk1YeVcwN1dmaHhmeDU0RERweHljSTEzMC9ZUTNY?=
 =?utf-8?B?ejZQaEdaVWdGTlFDTmVnTHlnc2kwM1R3ZzRwajBsb0xSc0hEOUk1dmRwcVdH?=
 =?utf-8?B?UUtLZ2JXOFJ3eGQ2bTN6em04a25HRVBmSmtvSUhWamVuQkJYNnVEaDFUVFp6?=
 =?utf-8?B?c1FUNVFIZ2U4L1NQRDRLVW05MmZBUUZ1OWpCTVZqTmRDVTJ6SHVmRWY4U2dR?=
 =?utf-8?B?d0NlTFFubkRacGlJcytKVEF1OFVrb3NQSHdHMTZGZU5lenI3cmxNU0hySkFn?=
 =?utf-8?B?MllHcjVnRE10cVlmbzVNRldWbDhob0o0VGxzOVRhMitPNUZ4MnE0Q3g2M2xn?=
 =?utf-8?B?dkFBWW5sVFhLUnFxZkQ4MzB6RTJYTG83bDhXZitOUVcyWUltdlZnWVYrdU01?=
 =?utf-8?B?RmtYSzJZOXIzb2hTRjBNK3VlSWlJeEUyL1VQN0FOMG1ESWRLTGc0T09LL29y?=
 =?utf-8?B?UzV3L2ZnMHhtMzdHVVd0bk5LQjlRaFdHSmZTc1QxNHArcjBWVUh5aDN4Tm9z?=
 =?utf-8?B?c2ZEbms4dlcrQTRySy9URnpTa3F2ZjVDZ0VhSGl3M0plR1JFQjNtZ3dsOWFQ?=
 =?utf-8?B?dll6b0UwVHY3WENyUDRLTnpQSXBhRitCTk9Bd3hCWkd5YmFROEI4Z0YvWCt4?=
 =?utf-8?B?TEF1OXo4OHYvSlY4MzhxQmwyc043Y280S2dPMElUZDBmVFNzbitmbm9EeTQ3?=
 =?utf-8?B?N25md3BXN041cXczd1BxMlR2dzU0UVlYaDUwVUtONWxIb0tqL0lRNFhuWXpQ?=
 =?utf-8?B?TjV4TVFoSnY0RmRTclFWZTlMTkpsbmdOSytCNzRQSDRmU0hZT0lCOUw1NW40?=
 =?utf-8?B?RlVDWUZpVGVtZHJCRVVZMWhkSEpwL2Q1bTBLVzlSMXlQaHBrQkZFOUxnNFlY?=
 =?utf-8?B?dDZDNHRhdkFxTlhwdnF4VmZGdGpDUmVoaHdXZXlIOE1HYXJnRjl1aktPclpi?=
 =?utf-8?B?cS85Ui9hVTZDNGRrRGJ4eXd3YndtdEpvUXk3eVljTk84NTVQVmlycVlaL2hw?=
 =?utf-8?B?am13Y2FaR20yR0tNUXl2MGZpdlFvbGF4SW9BWWt1VGlhUHowNGZ6Vm52dEVI?=
 =?utf-8?Q?9TP8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee50c23-c474-4ca7-8f11-08dbf55ddfce
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 06:46:14.0926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwoZ1t2r81CFWgmGWiCiw9AmYr6SkkvsYWuiebulh3WZd6vNo4wAQLnw5gRX2vh1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8861
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.12.23 um 22:54 schrieb Rob Clark:
> On Thu, Mar 23, 2023 at 2:30 PM Rob Clark <robdclark@gmail.com> wrote:
>> [SNIP]
> So, this patch turns out to blow up spectacularly with dma_fence
> refcnt underflows when I enable DRIVER_SYNCOBJ_TIMELINE .. I think,
> because it starts unwrapping fence chains, possibly in parallel with
> fence signaling on the retire path.  Is it supposed to be permissible
> to unwrap a fence chain concurrently?

The DMA-fence chain object and helper functions were designed so that 
concurrent accesses to all elements are always possible.

See dma_fence_chain_walk() and dma_fence_chain_get_prev() for example. 
dma_fence_chain_walk() starts with a reference to the current fence (the 
anchor of the walk) and tries to grab an up to date reference on the 
previous fence in the chain. Only after that reference is successfully 
acquired we drop the reference to the anchor where we started.

Same for dma_fence_array_first(), dma_fence_array_next(). Here we hold a 
reference to the array which in turn holds references to each fence 
inside the array until it is destroyed itself.

When this blows up we have somehow mixed up the references somewhere.

Regards,
Christian.

>
> BR,
> -R
