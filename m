Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76F78405A2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 13:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD65410F6CE;
	Mon, 29 Jan 2024 12:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09A010E034
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 12:52:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZhLpGUobQ0iVkbxkCKOyCbM4OnU4Gjo2ybhtJYhL9Yj2B6B4tqSaSXVhsnPWfXXTVHsw6Ct16qp40rcUxz9hUTWpgQibiamIjdfxqo4gB0fb8j3ZmQm6lqYuPGrawc7djQaO62MUgJxqdgngtsIeno9i+ZnuevrzfWdYayWnQ4Aqy8Wv1OcSVv20MVvFy3UJD5m49Ho/B8Go/GBUk9C6Tt0Rh7vhDdjHoUxj+s3j79leuTTNViVbP9U15YBenfWShSUg3rT7CqrSu4EU0Rh2MLl9UUz++rVA1HhteHreSeB1DDGWFERGv5O2xTndmSC+ZV49wkueltBUPQHaAc+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fYIetDL1jttk+LQ8Bsj/fol0+RxPpSbCxCApVQDM4E=;
 b=EvrFNN4dIhmN6GXCIgsuTPrOYHJ/Yc9QJUiGx9aXp40eZHZte6CkUAwgJEv7fnSWNdW+Vrf5laZBirxyJi9ckKSIXn9mbHwhBx0PaPdJGYFzMrA3GfcWmIZG5gQfuJ4SUlc6kGktr4wRs00c0r+zNq3JjrYrGArG9zPRIMA1j4J7MfIChM604GJbcPv7u0dmPCQUP7Xwgy9eQR8UjtgcmlImN95w1cZVSmCy3OkgMva0yMG4vR1RE3YXWJtRCj5xpr+Qvbihp5BJTAFG0tJL/csHNCg9Z+catJNFZa8Sn2o7kl6ypwJV8jEDFysLTTGWcj7Um6ZyZ7IKkXekKt5ilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fYIetDL1jttk+LQ8Bsj/fol0+RxPpSbCxCApVQDM4E=;
 b=TBjnTcLNkMT29BtGmewHc2/DHACs9sXdGlrR/NOxZ+2D0G6u/FeifrJxjuAYKXaB7dtCvdTwQCmYYhFPrGqWCz9FgNkSIyGsWb/0iv9eFRCRmUPsj0sBr5CAHluZ7n/a+To6woyzAr7XqwyvL4inPqKgFEzeqEafL+04dHD9pjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB5515.namprd12.prod.outlook.com (2603:10b6:610:34::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 12:52:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 12:52:41 +0000
Message-ID: <d6bef39c-f940-4097-8ca3-0cf4ef89a743@amd.com>
Date: Mon, 29 Jan 2024 13:52:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>, Paul Cercueil <paul@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-6-paul@crapouillou.net>
 <20231221120624.7bcdc302@jic23-huawei>
 <ee5d7bb2fb3e74e8fc621d745b23d1858e1f0c3c.camel@crapouillou.net>
 <20240127165044.22f1b329@jic23-huawei>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240127165044.22f1b329@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0158.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB5515:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a38a3a-476e-4675-56a4-08dc20c92da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DUF7/wJm0GfrNJ/SnEIkfEpCjhO2a+rf9VOCGJzr9hcHduQaSo4TpKUZIJ1JjbC2ti32zqKnG3A6PbVaa+1rBayHwWGW4RMKTVQcGL6TCWiVmte/tJJg3mPyw2PpK3QpIAz+NsWV5AhTfCo2bulBV0KtfSguHVBLYpp3lUmbU0SjN4CNPxiTDIProlJkVBrxEvNzOQKWyKvpyoyczz8hZTq1CpsXpLWJMxg8GyZCVsCqBdPSUry9EFmzy64Zcb7CAoB8qaEfQYRcAIWNT4RqOkOI9Z4wQ/i5S/iVcCxP5N/GPgh2Y89hzkwFtI1R61f87VsKFhHrP8eRwqmNZaPk6Z0gBoQtTsnBjXqCmhM2FvyeP4cJSFO7ATVUU97M0tubwoxxkZPVnzFkhG/IZ4abPeRCPlrmO6Tgq09Hy07JYcRIGA7KnlA5PlsZ4tay+tYizHoAhOUrCi096iXaUnxgNAp+d/Ge5KbDvaJ90LUjd7k67oEkypU5Hzv7ECVPdtGDkfO69ZesRgyDDetWeQ6U6PBXT35pGzZd9zmpnW14czX5YanDd24WtS9G5Esmaj7fevKbUeTz4q1Uw6IenDKauFaaqAdQldbBOQ1oNmsbf1MJ2koe/LxIEH9eyE3l9hm/ErROwl5GnskqB5t8Ha/Bng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(31696002)(36756003)(54906003)(66946007)(316002)(66556008)(86362001)(6506007)(110136005)(8676002)(8936002)(66476007)(6486002)(478600001)(26005)(4326008)(4744005)(6666004)(2906002)(7416002)(5660300002)(2616005)(6512007)(41300700001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTlXWEpqbGhlTXp5Q3BZQmNNZlVLc0syYVJiemJGRERkY3NuN2tpQmF6b0RY?=
 =?utf-8?B?WnBDdUJKTmRwWnlBZHJSZjJvUEVqSEo1VXdwRHYxVmJtaXl6RGFCeHJMeHNm?=
 =?utf-8?B?aGFIdDRRN29oMCtzNnl6ai9QZStBZmVvdFJrRDI1MG0wUGR4UlkySGFiQUpq?=
 =?utf-8?B?ck5kQUR4cFNxdk9KeEViekpjZzhxV0dTUTJ1VVFRQTUxWXdxMUt0UGhIRFlj?=
 =?utf-8?B?VXQ4b2VwdGJWYnduQXFLYWp0SlBJc040Q2hUbldWWXhVT2taaGJsMjhXc1o3?=
 =?utf-8?B?Qk9RdGx4cktwTTEvcWErOTFIOFZ2cnlJK1czeDZMb2crSWNWcUVJeGM5Y1F6?=
 =?utf-8?B?cmg1bFE0TURNRGN1QlZsbzl3SDFsYi9pVHlqUExISEN1Y2t1dm5hZnd4d3Vv?=
 =?utf-8?B?ZFhsMW43ZVlQWG9iNExnMlhjbldHT09nSmZWN290eW1PTFBBeXdhTUVkbDRy?=
 =?utf-8?B?eUZlL0NtVVRTNUNBYnd6cjVXSWFscWl6eS9CMUdRbWdGRTcrbmpCaFVRY2JT?=
 =?utf-8?B?MjJQRnovSHhMTTl5MXhDb0lKY2tOQUM3Qzh5OFZBck53UnRiQXQzdEJkeU1v?=
 =?utf-8?B?dFQ5SHV1MXREeU50RGJuanpBZmowN1psUW45TWZnMGMxb2JEV0o5WWVtVkhn?=
 =?utf-8?B?SmFSTDFYM3BZaHp4d245ZzNnWkZwMExxRk9IVXRWb3NhZTRYMFZjVVJtQkx5?=
 =?utf-8?B?R3ZUbWUzZ2t4NytZRWovTCtpcGhJQ3gvR3RTcjF4eXlGeVRhcEtrajVidXU2?=
 =?utf-8?B?VUdXZzdsYWpqM2pIU0JEL1B0VUJIQnEvMWswUW12UFR0a0MzWlQyVXZxdnVN?=
 =?utf-8?B?THl5STJmdzQ2TmJrYmYyQlVwcEthVDg4VWRUa3RQL3dMa1lPOEI0UEd0UG5G?=
 =?utf-8?B?S2ZjRERLODFSQWYvaEQ5MGY2YXhrNHJ0S3ErWk5PVk1ZWTdKZmRIbW9jWTda?=
 =?utf-8?B?RUJxRHdXUWZxN2Y5ZXBQL0xLTDkwRWNBSyt2NGNpMUhBQll2QmlsWDhlN0ND?=
 =?utf-8?B?bElOVDZZR0g0L3lOak1YL2NJV3V6eGFBa040MytMVVBEbzdDdDlhNDVaU3dT?=
 =?utf-8?B?dGJydG1YZ1BQMHFIUGpIbFVNenNsOGk2UWlMbEFSVU5QQ3RJUjgxZ25CWnZ2?=
 =?utf-8?B?djdpTllSQ2pORWRoRmlCVmV1K253dVZvZlFvNXNWcG85MUdMWGtlKzRkZDZY?=
 =?utf-8?B?Tm5ycFc2dDk3WXczSlJBTW5reDZyN0I3dlRxUlRCSkZkeXd1ZFZiQ09hcHVR?=
 =?utf-8?B?bkM1TmtxMUV6Q0w1STJndTEvYlBkOTIyMGdTSjJKQ013SE54VklwbzZhN2dT?=
 =?utf-8?B?WEFyRisrRWl0WExWbE5Ua1h3bEpmZHIwQ2NvYXZIdTNUdVAzUVpqQ2JWNVlm?=
 =?utf-8?B?MGg1Z2dobWR1NWdHNnh1eC9pNHJjemJNV0NNdk9SZUJXU2hpOEo4MGpqc2dS?=
 =?utf-8?B?c0FPVVcrekZma2ZHOXRRdEMrRVNpdlRqTENLYjZsTTBwOVBtQ3RIclFqZEpr?=
 =?utf-8?B?azVTRk8waUtZdkZnU00zZ1RxOTZhaWM5MWkwajFVZ2hTVU1CeTdhSDJteWU2?=
 =?utf-8?B?NjJYYmV6OUkrRWw5Z2VPcGZ3TUJTM0lvakxHUmtodTJ6aXBMTDRrTFhYdjIz?=
 =?utf-8?B?ZDJLb0dtZEE1YjhOaE5SWWFZemZDT1I2YVpwUEhwamNiS1VGb3p5Z2lSQ2h4?=
 =?utf-8?B?dFlEQlk2allCZ21rMkV4TFNURklxVzlnS0VJNjNqUFhpWmNmNFo3TXBIUWhW?=
 =?utf-8?B?cjFTSzNDWUl5K203aWdhNHZwbVBwQ1daZ3dQQ2dlWjV0RnpKYytnc1lYWjlN?=
 =?utf-8?B?eUZFMzR5MWlsQ3RuRWVZQTdxVTl2L296OWpqV1dkckxwNkl6ZElLTUs2TlBP?=
 =?utf-8?B?U3NYbGZybFUvRWpLNWErSXpHbTlDTjAzVzJGTjMwV0NXblFZc2NMQlV2clh2?=
 =?utf-8?B?Z3Z4b0daRG5aeDBzc0dqUklwTmRVOTE1enFMUG9tNG0rT1JqMWlmT2RINUov?=
 =?utf-8?B?djV1NGVJalh4dC9IMWdwcU9qR0VsRzkzMjJQaEY5N29yVkpDQjZ6T2tlTDho?=
 =?utf-8?B?czhTK294OVlDK2N1cjNaRHgrNm9DbmdGYWV5dEluWHY1NTYyeTFMSzZqYVNN?=
 =?utf-8?Q?ERZmOhw0x03hSZeh+OY9JMgFv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a38a3a-476e-4675-56a4-08dc20c92da9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 12:52:40.9135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZGa8s5yG7LOLlWGwtAGcrvr9+q1im6/XZZPYGmED7fcCr2V2FEY4qUQ+wnnPiTu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5515
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.24 um 17:50 schrieb Jonathan Cameron:
>>>> +	iio_buffer_dmabuf_put(attach);
>>>> +
>>>> +out_dmabuf_put:
>>>> +	dma_buf_put(dmabuf);
>>> As below. Feels like a __free(dma_buf_put) bit of magic would be a
>>> nice to have.
>> I'm working on the patches right now, just one quick question.
>>
>> Having a __free(dma_buf_put) requires that dma_buf_put is first
>> "registered" as a freeing function using DEFINE_FREE() in <linux/dma-
>> buf.h>, which has not been done yet.
>>
>> That would mean carrying a dma-buf specific patch in your tree, are you
>> OK with that?
> Needs an ACK from appropriate maintainer, but otherwise I'm fine doing
> so.  Alternative is to circle back to this later after this code is upstream.

Separate patches for that please, the autocleanup feature is so new that 
I'm not 100% convinced that everything works out smoothly from the start.

Regards,
Christian.

>
>> Cheers,
>> -Paul

