Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A26B38713D
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 07:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D026E7E2;
	Tue, 18 May 2021 05:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EC76E7E2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 05:28:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kw81e4bZZuiHUvw606r2h8clxHqrvv2ljEDyWR2o6dicmtJZce0Yk2CEFwQlXtCKtirklB7bGjT14K5ahe2LPZtfu5RatjDSuVqRqUo3lYahDJVvTSVZxOsLZjbvyWMYZjsomIZKdUKJHp/RjCZtftCe4RDP8NLI2tYFwTbIHSma3ZM+3CTpExdeMMtuaVc1NvMM8dec5Wn2ruXfGs/mbogiSB9f3HdoHkeTBx7qXcrpLw4Genwa9wKSa5tZAz5uk0NqUT1K4UX+A1iZYY5VmlKZHPA+/xg3ven7xxIIRRhR0h46/uLetl0OIkpDAa1TYEqLwv/xP/RMFI+YFKU5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiamO+UqoFiWq7diUNIDP56tmB9+/AAcFRoHE8rQpS0=;
 b=JDZsfnS7rMIyWEdWOl2Q9E4iHMy/9NMOPDyCEyJNUNXcCtv7d5yB9YeEDlAFNWxDLLp4mNdr3ZjZt1nBtyxzm/sOoZZ+XE39RuILyJLjsSYuQSYeVws9T2fXszz0TamcewuUHJSc7yHUDYGXYoV2/J2dVcsulrChtq6beCszLJ4Wmen4cgcTuHBiH9zUHgV8rZwiNTftcP8moOmQZFq+mYpJD/ypON67AZ9Bmojhyuha3lrMFsfLIH4nmTCZqRzx7iMwdPnuGt6CQVTHtPeujNfTx9kbYTIFdEWsAcxDHE/R5umYMAet/yUQL2NDQWbciyWQdMwsCGFAgdUkOy7aeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiamO+UqoFiWq7diUNIDP56tmB9+/AAcFRoHE8rQpS0=;
 b=nocqi7fvVCDQrezOoGl+0rWb6nxos1c53+402q9MBlq8USYGCAkjw3j/MA8HKJylYBSHnm7UlCuDagRdMaiiKr+rkRbjjdqrH1Z8lDL+bo6FqZKEuoN6NC8PxhA44Um45NgVJdkC1otklRRlpuDAGx7p77szn5LpvsLqJmjzyqo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR11MB1941.namprd11.prod.outlook.com (2603:10b6:903:120::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 05:28:45 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::cccf:6e19:b547:da8b]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::cccf:6e19:b547:da8b%6]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 05:28:45 +0000
Subject: Re: [PATCH 2/2] drm: xlnx: consolidate the functions which
 programming AUDIO_VIDEO_SELECT register
To: Paul Cercueil <paul@crapouillou.net>
References: <20210513114540.1241122-1-quanyang.wang@windriver.com>
 <20210513114540.1241122-3-quanyang.wang@windriver.com>
 <QZG9TQ.LU7WK53ECH511@crapouillou.net>
From: "quanyang.wang" <quanyang.wang@windriver.com>
Message-ID: <9ea60fe6-79de-b823-2e08-5f298e9c7d50@windriver.com>
Date: Tue, 18 May 2021 13:22:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <QZG9TQ.LU7WK53ECH511@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0016.apcprd03.prod.outlook.com
 (2603:1096:203:c8::21) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.199] (60.247.85.82) by
 HKAPR03CA0016.apcprd03.prod.outlook.com (2603:1096:203:c8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Tue, 18 May 2021 05:28:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3580c78-765c-4e0d-3aac-08d919bdce6b
X-MS-TrafficTypeDiagnostic: CY4PR11MB1941:
X-Microsoft-Antispam-PRVS: <CY4PR11MB1941F01F0AC1B587DBDE7A78F02C9@CY4PR11MB1941.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJrEOlqno0V1+jKdnXH+Tphixx8uWlBGhxwMLKnu5k2vCp4yN8itAzJXVF/7M+zPff1Au51mtc6xLa9NAqxAiNlvm8z4WKq0Rf3WeCjjGXRKskKuk4lQgJpFjNVKx5N/bwq4b82V1DutdGcnNhk5QbuGmGd5e/pBPAPbcv+ie+kD3nf8n9z9y5j4UADNkOE+N3bJEZEoiNRMVq/s6HtCR2C3kmuIl7biLJSyh8fyRzpKXxrWmbsQxMHl5Wl8YFht9vUiOiYFhJoQata7HH5cV2hgb32NU+r/yJ9irnQPUQQAykUtxMIKIBChZe6vdzMEyeFB4lzmKjOBUootKpxbHPD5/7rAPtugVIm527P98QlnazobrgMmf0LzD4fOtJGQ5QHAjLl3dpTnK7Y+dManVS5xYDAyc3r0euQagMyyTCjuBcTiger8yT24h7HLmqHk/ShWUeQSkL6uqOsPWpJrkrrfy6QT2+moNmRq29c8PedQjfzU08cC+wrgsZsGcWcQxWiB6zu+61Zj819cxqpLqegQTt7pNyLd+KVXIBmhnjbX+wpTAuIrr2lLRYoG15zi0AkDV/P1AzJkyvVyEIEINnp/NBVOtuWrZiia6t4Ea52okZ7Pz63NE1DgMUrffbEG+H2x1wARc4UMJMpyxQ1T/TaGCq0DJFl0jPiaOvyy6MmLm10qyqgm1Ji3YzTQdUKCVIbFBkXiT2HTPH7bUIPuHZssINU9xEH+CGReXeH1+ijC4WO+mhdTHLxh1chqbjz5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(366004)(956004)(30864003)(16576012)(38350700002)(54906003)(316002)(38100700002)(66556008)(66946007)(53546011)(4326008)(5660300002)(8676002)(52116002)(8936002)(31696002)(478600001)(86362001)(16526019)(186003)(6706004)(26005)(31686004)(6666004)(2906002)(36756003)(2616005)(66476007)(6916009)(83380400001)(6486002)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZkM1VjZUeDlUOHRjU2VFWFBoM0dyQk5tcWdoanJjelA0WC9jVzNlUTFFZDFH?=
 =?utf-8?B?YkFxVnpCZHVaUTR0OTVOUG5qN1U1R3VsM0F5b09PVXJMQm92dmJhSlVCZXJC?=
 =?utf-8?B?b1hRcEVETS9WVldVK2cxMG52WnpubkFSOWlZK09NUlh1VUNORWhaTDA0QlVq?=
 =?utf-8?B?ZEUzQWhEMkFaVXhmV1l2NnFCbVNhUHRVSXFVSWs3YWV1STJSbUZITG9YdTNx?=
 =?utf-8?B?NmtLWFF0WEluVEJmS2ZBWnd1MkpIelNNV21aL3F2MlhuaktzU2dDSWlKek5G?=
 =?utf-8?B?V1h0QnJ5WUFnMGcwS1pBNVdsWmp2d1BmUWFMditObEIycFN1bnNQa3ZjUDRa?=
 =?utf-8?B?K2tJUldobUxQNHNIRGhMU1JyQTBydStkbFBvczViaFE1Uk45UzIya1kvU0dY?=
 =?utf-8?B?MjBzVU84SHRLS24vNGZWUHdSa2pneG83RFRXdWlwbjF0VFAwVlVWVG84YkNw?=
 =?utf-8?B?YncrQU5XeHZtYURReEgvZXVEeDRhRCtlNVEvbU5DRWJMWmJtTUhDVFlGWHlu?=
 =?utf-8?B?MHpFaCtlekJrUW54ZThDVGVCNHNOMnRRTUk2eWp1anorcnA0WDlzYnluS3pI?=
 =?utf-8?B?Q1AvSnoxaUdxUmdmSVpBdnV6NHJyR1NIekZqQnJoa1hIR2lKcmxqQjMxZE1N?=
 =?utf-8?B?VmRXVytLSXZ6Kzd0Rm8rOS94SzhXNzRWcEx2cEJ3YWwyRzRvVEpVL2NUUWw5?=
 =?utf-8?B?aytLM24zOFp2cHlFM3N0dXBWZFgxYWRhTjNKODA5NzRWSjFwQlJNNnRMWHMy?=
 =?utf-8?B?cE5PL0VzOFh0RkJjL2RBYTlYbVVXVmZoU08xRW93UGFRbmt1NFlSQkYrTGt0?=
 =?utf-8?B?WEY0Wk9UVzRyMzJ2L1RUbGFHWVFDY0NCa2EvcXlhajFrUkUvZmRmUmhZUVl5?=
 =?utf-8?B?cW9WNDBkdDZyeFlIYm5xQ3hFU2dwWkpRVDdwSkZzRU9oZ2l0NHliditNbTBR?=
 =?utf-8?B?WDRXSm9sK3V3aG5OTDJxRlJLN3Rpdzc3Tk5vNVNTYm91M1owSnhDL2xLdHk0?=
 =?utf-8?B?YVM0MEVnKytyUXp5SHFsN3BOdXBWNFJuUXVBSFFFeXQ3SHdzaUR3QVZVVFhP?=
 =?utf-8?B?NmVvZ2EvdVJ0eG94L0pyeE5ERFJJU0Y4N1dJZjBSWlRNZHcyL09qVHlGK3Rx?=
 =?utf-8?B?ZUF5MXIzekpkM1R6NE0weFo0ZnJLS2t3TnJKRDFuZ3JpNXJkUEhTYStwYTE3?=
 =?utf-8?B?QUJyT21LRTNTK05yK2lGU2dOTzVkUzlwa3ZHTVZRYS8zM1BjNWhxU1J3b1p6?=
 =?utf-8?B?YjJmY1R6czlueHlBNlhxWE82WU40OHA0aWdzUVIxUG5SbXc2VHFEeEVDUXJN?=
 =?utf-8?B?VXN3eElTWlNjTUJtOWlseHh5TjliRXJpSDhGdVNPVkh1OFpsLzV6VjY3TW1p?=
 =?utf-8?B?eHFURS9oMDlYeTdDSlRJanJwdzd4SEFBbFNDQXovcG9QOVFhOUNqQ0tkTVEv?=
 =?utf-8?B?VDZyK2Q1VnBqQm0yOUdGaWxMaStPYkhLZGlRVUc2ekNweXJTMzFHQWxtYUZG?=
 =?utf-8?B?SFR5TTY2Tkc4R1dDWHpVelhET01wTWJPaWdxcllGY0JwVGxkQ0ZOSkw4cU9u?=
 =?utf-8?B?QmhiVXFmdEo2eDFlZGMvN2trYWtmVzRJakhlajBaaEVMTTlvWG1XM2c5Wm1l?=
 =?utf-8?B?T241WVlQUWVpWjZaRnNjbGZ2LzdkS25JWCt6d0JwdWFoVzhGMUZmTk93aGFE?=
 =?utf-8?B?aXhPY0ttMWd4Z2xrZ3Q5aGZEWmFpV3VQWm1RM3Y4TFloOWhRTzZETmNwK0oz?=
 =?utf-8?Q?HjbNVoOm266TSmUfSJmKaOwyrt4/pJRRHZzgODa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3580c78-765c-4e0d-3aac-08d919bdce6b
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:28:45.4611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZaxUQk+rV+ibHxyM0gL7doVPEj+kRjoEgriTqZcCLzNYdng1vMEPfQ9hgCCZ3qRdVdlKiJ8MQ73hF4kDUG80voHbWybgAHFpQ3DZNjw0dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1941
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,
Thank you for your review.
I will update all of this in V2.
Thanks,
Quanyang

On 5/18/21 1:09 AM, Paul Cercueil wrote:
> Hi,
> 
> Le jeu., mai 13 2021 at 19:45:40 +0800, quanyang.wang@windriver.com a 
> écrit :
>> From: Quanyang Wang <quanyang.wang@windriver.com>
>>
>> For now, the functions zynqmp_disp_avbuf_enable/disable_audio and
>> zynqmp_disp_avbuf_enable/disable_video are all programming the register
>> AV_BUF_OUTPUT_AUDIO_VIDEO_SELECT to select the output for audio or video.
>> And in the future, many drm properties (like video_tpg, audio_tpg,
>> audio_pl, etc) also need to access it. So let's introduce some variables
>> of enum type and consolidate the code to unify handling this.
>>
>> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
>> ---
>>  drivers/gpu/drm/xlnx/zynqmp_disp.c      | 166 ++++++++++++++----------
>>  drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |  15 +--
>>  2 files changed, 101 insertions(+), 80 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c 
>> b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index c55e24412f8c..a82bc88a98aa 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -102,12 +102,39 @@ enum zynqmp_disp_layer_id {
>>
>>  /**
>>   * enum zynqmp_disp_layer_mode - Layer mode
>> - * @ZYNQMP_DISP_LAYER_NONLIVE: non-live (memory) mode
>> + * @ZYNQMP_DISP_LAYER_MEM: memory mode
>>   * @ZYNQMP_DISP_LAYER_LIVE: live (stream) mode
>> + * @ZYNQMP_DISP_LAYER_TPG: tpg mode (only for video layer)
>> + * @ZYNQMP_DISP_LAYER_DISABLE: disable mode
>>   */
>>  enum zynqmp_disp_layer_mode {
>> -    ZYNQMP_DISP_LAYER_NONLIVE,
>> -    ZYNQMP_DISP_LAYER_LIVE
>> +    ZYNQMP_DISP_LAYER_MEM,
>> +    ZYNQMP_DISP_LAYER_LIVE,
>> +    ZYNQMP_DISP_LAYER_TPG,
>> +    ZYNQMP_DISP_LAYER_DISABLE
>> +};
>> +
>> +enum avbuf_vid_mode {
>> +    VID_MODE_LIVE,
>> +    VID_MODE_MEM,
>> +    VID_MODE_TPG,
>> +    VID_MODE_NONE
>> +};
>> +
>> +enum avbuf_gfx_mode {
>> +    GFX_MODE_DISABLE,
>> +    GFX_MODE_MEM,
>> +    GFX_MODE_LIVE,
>> +    GFX_MODE_NONE
>> +};
>> +
>> +enum avbuf_aud_mode {
>> +    AUD1_MODE_LIVE,
>> +    AUD1_MODE_MEM,
>> +    AUD1_MODE_TPG,
>> +    AUD1_MODE_DISABLE,
>> +    AUD2_MODE_DISABLE,
>> +    AUD2_MODE_ENABLE
>>  };
>>
>>  /**
>> @@ -542,92 +569,98 @@ static void 
>> zynqmp_disp_avbuf_disable_channels(struct zynqmp_disp_avbuf *avbuf)
>>  }
>>
>>  /**
>> - * zynqmp_disp_avbuf_enable_audio - Enable audio
>> + * zynqmp_disp_avbuf_output_select - Select the buffer manager outputs
>>   * @avbuf: Audio/video buffer manager
>> + * @layer: The layer
>> + * @mode: The mode for this layer
>>   *
>> - * Enable all audio buffers with a non-live (memory) source.
>> + * Select the buffer manager outputs for @layer.
>>   */
>> -static void zynqmp_disp_avbuf_enable_audio(struct zynqmp_disp_avbuf 
>> *avbuf)
>> +static void zynqmp_disp_avbuf_output_select(struct zynqmp_disp_avbuf 
>> *avbuf,
>> +                       struct zynqmp_disp_layer *layer, u32 mode)
> 
> You can put 'mode' on a new line to avoid getting over 80 characters.
> 
>>  {
>> -    u32 val;
>> -
>> -    val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -    val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
>> -    val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM;
>> -    val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
>> -    zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
>> +    u32 reg;
>> +
>> +    reg = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> 
> Empty line here (spacing before comment)
> 
>> +    /* Select audio mode when the layer is NULL */
>> +    if (layer == NULL) {
>> +        if (mode >= AUD2_MODE_DISABLE) {
>> +            reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK;
>> +            reg |= (mode - AUD2_MODE_DISABLE)
>> +                << ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_SHIFT;
> 
> Please consider using the FIELD_PREP() macro from <linux/bitfield.h>. 
> Then you can get rid of your *_SHIFT macros.
> 
>> +        } else {
>> +            reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
>> +            reg |= mode << ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_SHIFT;
>> +        }
>> +    } else if (is_layer_vid(layer)) {
>> +        reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>> +        reg |= mode << ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_SHIFT;
>> +    } else {
>> +        reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
>> +        reg |= mode << ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_SHIFT;
>> +    }
> 
> Empty line here (spacing after block)
> 
>> +    zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, reg);
>>  }
>>
>>  /**
>> - * zynqmp_disp_avbuf_disable_audio - Disable audio
>> + * zynqmp_disp_avbuf_enable_audio - Enable audio
>>   * @avbuf: Audio/video buffer manager
>>   *
>> - * Disable all audio buffers.
>> + * Enable all audio buffers.
>>   */
>> -static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf 
>> *avbuf)
>> +static void zynqmp_disp_avbuf_enable_audio(struct zynqmp_disp_avbuf 
>> *avbuf)
>>  {
>> -    u32 val;
>> -
>> -    val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -    val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
>> -    val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE;
> 
> Same as above with FIELD_PREP().
> 
>> -    val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
>> -    zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
>> +    zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD1_MODE_MEM);
>> +    zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD2_MODE_ENABLE);
>>  }
>>
>>  /**
>> - * zynqmp_disp_avbuf_enable_video - Enable a video layer
>> + * zynqmp_disp_avbuf_disable_audio - Disable audio
>>   * @avbuf: Audio/video buffer manager
>> - * @layer: The layer
>> - * @mode: Operating mode of layer
>>   *
>> - * Enable the video/graphics buffer for @layer.
>> + * Disable all audio buffers.
>>   */
>> -static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf 
>> *avbuf,
>> -                       struct zynqmp_disp_layer *layer,
>> -                       enum zynqmp_disp_layer_mode mode)
>> +static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf 
>> *avbuf)
>>  {
>> -    u32 val;
>> -
>> -    val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -    if (is_layer_vid(layer)) {
>> -        val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>> -        if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
>> -            val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
>> -        else
>> -            val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE;
>> -    } else {
>> -        val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
>> -        val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
>> -        if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
>> -            val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
>> -        else
>> -            val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE;
>> -    }
>> -    zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
>> +    zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD1_MODE_DISABLE);
>> +    zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD2_MODE_DISABLE);
>>  }
>>
>>  /**
>> - * zynqmp_disp_avbuf_disable_video - Disable a video layer
>> - * @avbuf: Audio/video buffer manager
>> + * zynqmp_disp_avbuf_set_layer_output -Set layer output
> 
> You're missing a space after the dash character.
> 
>>   * @layer: The layer
>> + * @mode: The layer mode
>>   *
>> - * Disable the video/graphics buffer for @layer.
>> + * Set output for @layer
>>   */
>> -static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf 
>> *avbuf,
>> -                        struct zynqmp_disp_layer *layer)
>> +static void zynqmp_disp_avbuf_set_layer_output(struct 
>> zynqmp_disp_layer *layer,
>> +                       enum zynqmp_disp_layer_mode mode)
>>  {
>> -    u32 val;
>> -
>> -    val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -    if (is_layer_vid(layer)) {
>> -        val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>> -        val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
>> -    } else {
>> -        val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
>> -        val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE;
>> +    int val;
>> +    struct zynqmp_disp *disp = layer->disp;
> 
> I'd swap these two lines above - variables are usually defined in 
> "reverse christmas tree" order, the longest line first, the smallest 
> line last. No big deal though.
> 
>> +
>> +    switch (mode) {
>> +    case ZYNQMP_DISP_LAYER_LIVE:
>> +        val = is_layer_vid(layer) ? VID_MODE_LIVE : GFX_MODE_LIVE;
>> +        break;
>> +    case ZYNQMP_DISP_LAYER_MEM:
>> +        val = is_layer_vid(layer) ? VID_MODE_MEM : GFX_MODE_MEM;
>> +        break;
>> +    case ZYNQMP_DISP_LAYER_TPG:
>> +        if (!is_layer_vid(layer)) {
>> +            dev_err(disp->dev, "gfx layer has no tpg mode\n");
>> +            return;
>> +        }
>> +        val = VID_MODE_TPG;
>> +        break;
>> +    case ZYNQMP_DISP_LAYER_DISABLE:
>> +        val = is_layer_vid(layer) ? VID_MODE_NONE : GFX_MODE_DISABLE;
>> +        break;
>> +    default:
>> +        dev_err(disp->dev, "invalid layer mode\n");
>> +        return;
>>      }
>> -    zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
> 
> While you're at it, you can add an empty line here (spacing after block)
> 
>> +    zynqmp_disp_avbuf_output_select(&disp->avbuf, layer, val);
>>  }
>>
>>  /**
>> @@ -1030,11 +1063,10 @@ zynqmp_disp_layer_find_format(struct 
>> zynqmp_disp_layer *layer,
>>   */
>>  static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
>>  {
>> -    zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
>> -                       ZYNQMP_DISP_LAYER_NONLIVE);
>> +    zynqmp_disp_avbuf_set_layer_output(layer, ZYNQMP_DISP_LAYER_MEM);
>>      zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
>>
>> -    layer->mode = ZYNQMP_DISP_LAYER_NONLIVE;
>> +    layer->mode = ZYNQMP_DISP_LAYER_MEM;
>>  }
>>
>>  /**
>> @@ -1051,7 +1083,7 @@ static void zynqmp_disp_layer_disable(struct 
>> zynqmp_disp_layer *layer)
>>      for (i = 0; i < layer->drm_fmt->num_planes; i++)
>>          dmaengine_terminate_sync(layer->dmas[i].chan);
>>
>> -    zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
>> +    zynqmp_disp_avbuf_set_layer_output(layer, 
>> ZYNQMP_DISP_LAYER_DISABLE);
>>      zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
>>  }
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h 
>> b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
>> index f92a006d5070..dad3e356d9ab 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
>> @@ -120,23 +120,12 @@
>>  #define ZYNQMP_DISP_AV_BUF_OUTPUT            0x70
>>  #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_SHIFT        0
>>  #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK        (0x3 << 0)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE        (0 << 0)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM        (1 << 0)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_PATTERN        (2 << 0)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE        (3 << 0)
>>  #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_SHIFT        2
>>  #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK        (0x3 << 2)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE        (0 << 2)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM        (1 << 2)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE        (2 << 2)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_NONE        (3 << 2)
>>  #define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_SHIFT        4
>>  #define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK        (0x3 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PL        (0 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM        (1 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PATTERN        (2 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE        (3 << 4)
>> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN        BIT(6)
>> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK        (0x1 << 6)
>> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_SHIFT        6
> 
> Please use BIT() or GENMASK(). You don't need the _SHIFT macros if you 
> use FIELD_PREP() / FIELD_GET().
> 
> Cheers,
> -Paul
> 
>>  #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT0        0x74
>>  #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT1        0x78
>>  #define ZYNQMP_DISP_AV_BUF_PATTERN_GEN_SELECT        0x100
> 
> 
