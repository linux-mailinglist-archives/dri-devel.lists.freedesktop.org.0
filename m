Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6509E387129
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 07:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DEA6E5D4;
	Tue, 18 May 2021 05:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2B66E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 05:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSlUl8vxRm1HcwJVoBhSiMUOU25yiGwErokzwlJKfZerxOSI3c5OfVJ2huUQy38tPnF3uf3PvCAtK4eLGrHYmjd8eSEjqaRLeUxDfbM2+NL1DHYdyLVGgsS1yyWb7e38nDNRdTAwS9W1lrvLXZgK6/MJvAxJ7zV/Q2FJsWpoE+J1nZbPyA8ZrAouotLGU35le7RZR/2pfuP3T120aHd9hqLK8wwBNUgbn4U+dc0h0eKrsObEcAgdzblc0V3xhj6GRPW2G71Kfgz3rL1IrFLkTEyOOFBX0PwV+7yaQLJmM/wTffhzqMZBQcU7vPA/zAAWCI79CgPhEJmFR2I4ja075Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvqdCcGWqn7tO/z/kms/KbCKXEPJeeq9N09DnCtRRz8=;
 b=mmn5yCYTPbJSl4efE01eoAJJMGfYDrLckTB9BSMVsBTQU29/D7LUUg1tAjdliwy2GX35DB9SjG/rHI3KOllLL+nBTgQyxEHKWaHKftsOJHESzo9L6Dzu/uAtrgRz31uIBCoPXCo02orIiHwBg2GhIzCIMQhrrNtYIAS1c+9w3RFuJl2Jw7Eu0ry3/OqBrn3MgLoDVKbUlxKC8lydMoII9NRp8FeYEKYF8wUcXM4suCZMRdbtOzFSyLx58WShvENs8y0xWJCI1lOEtl6HM/TvfN6q9ZQ2ETN2NPm63nh7akOzi0hrAmALk67t8ekAn8Ri/W9Q8KB7bcW3pgdDk3BJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvqdCcGWqn7tO/z/kms/KbCKXEPJeeq9N09DnCtRRz8=;
 b=Nrc7om/WYEnFKM3mCsEkTaRWtkUinnsEIJTvE+4uUvK9UuoLoa95mgPrg+TFAdJxpWffeQWDsbcyIKusZU7Cj/9KIl6oWJFL+KyB+884MAv/XnGdEVuliyAUY3uxXwfWB37MsPEk91LH/UyEypdCGLOd0C07+0AllQfqTSdrgc0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR1101MB2101.namprd11.prod.outlook.com (2603:10b6:910:24::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 05:20:39 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::cccf:6e19:b547:da8b]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::cccf:6e19:b547:da8b%6]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 05:20:39 +0000
Subject: Re: [PATCH 1/2] drm: xlnx: add is_layer_vid() to simplify the code
To: Paul Cercueil <paul@crapouillou.net>
References: <20210513114540.1241122-1-quanyang.wang@windriver.com>
 <20210513114540.1241122-2-quanyang.wang@windriver.com>
 <90G9TQ.H0YO8VGDCBTU@crapouillou.net>
From: "quanyang.wang" <quanyang.wang@windriver.com>
Message-ID: <dd237275-dd6f-88ab-9443-7dda4930f810@windriver.com>
Date: Tue, 18 May 2021 13:14:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <90G9TQ.H0YO8VGDCBTU@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::23) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.199] (60.247.85.82) by
 HK2P15301CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.2 via Frontend Transport; Tue, 18 May 2021 05:20:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e93e88c1-647c-4f2d-1294-08d919bcaca7
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2101:
X-Microsoft-Antispam-PRVS: <CY4PR1101MB21014E811FDC73BB29FB533CF02C9@CY4PR1101MB2101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Ea55u9QsTsE/WqyoqH/6MPNimkjGZ+ZBs4FyoNG3zBowRJK5NX872E6hA3SicFrlOAQ9VdqtGEwABQ9u4YKaVObAAiOsWCXUecF9E9EZOmmciG0cjx10koM5m+ZVwGYWbBeuGAK7mE301eu/GaL4u2yHxVua3xDGaAL69n894ofr8nQFtskrxBI8m7yKWKMpJVGxf8XTdjLd5nwb3x4CAIjI0ieHca1GtV5xUS4A28azy2v7kaVqjCuFYewJ979v2/ptmdb0lt0DQn6TW4MoyeqmBcQtj9N/StTLLBvjs/DFEyG0TO5A2JxitjBN9nYvOflRjMF67twW1C3uRVH9Sga7YfdWNA7uhqhXuV5sj2sXeiM6Zry9jHLdj4OHsMUxOhnvJjsUV8teAYIhxqS3BfNEACA1e5KszNaDZT9V0P+J2UtoEvjGRIFuUMVRFvOATn2tNWwgsTec+Z9FoE1wR+5QIhtXi4SC2x4cnW5yWmEOM+l805PsiHrgBKwDoAcn6jqdcm/lgh7lTY8o8mlQDmwj8Vy75szEN3tevVXS7Vn8IzJEXwhaeWp/ukKpiglGKpo9UYd5waqiPfksDgjosyHvzZ51IqS/W5EW/AiHPlp6sHeZgQmHr7pdCmfvbouGql/I80wDZqc6HRNARnL9CEhAY7Gk3viaOCBzUx8lgC4LjBRKuppiqXit6PY/0KJfDy/0VXhd9l4m2FpS/2GXtPiECfiyo5xE4qi7PW8rKw9Q5lIIcicoY76CwyJ1gbb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(956004)(2616005)(31686004)(66476007)(8936002)(16526019)(66556008)(36756003)(8676002)(186003)(6916009)(478600001)(31696002)(38350700002)(54906003)(6666004)(6706004)(38100700002)(2906002)(83380400001)(6486002)(86362001)(66946007)(26005)(53546011)(5660300002)(52116002)(316002)(4326008)(16576012)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3VWRXdmUEdWZmo0VDNBU3ZDeDl6N0FEQnpoSVNnRVhEWEhRRDlqSHdITGh0?=
 =?utf-8?B?Vkcxeit5UUEwTTZEN2c0cUJQSXVBSzM3S0tST2NVcTh0NFViYW1HQk5RM2sy?=
 =?utf-8?B?UGZqRXRpekN6akZTdjJVbyszd21SdXVNRExJWXNtQ2UycUdQWXZyQ1ZxZ0lN?=
 =?utf-8?B?WVNNL0pMajF3R0FmZHFoR1pQTkpPcFlNZlVEMGVKSlB5aTRlSjV3QVgvNDRG?=
 =?utf-8?B?Y0hseWpwK3JJZ3B4emhGejM2SUpCYmp3TDRNZU9ZZUtuTnRsQWtkV083Vk1M?=
 =?utf-8?B?RERSV0ljaGdtNUg0Z2ZsVzZRcy91UWlrTVEvK2Z4QktML3NxQUVSemtaaytD?=
 =?utf-8?B?c0trSHVBRDUvdHJGWVQybExNMkFaR2ExUW8weUIzby9XMlNRbnozck5hSXdn?=
 =?utf-8?B?V1RaNC9QaXl1b01MRVNGYUVZaktlbHYxS2pNeXB0djV6UG5ycTkyS0lzSkh1?=
 =?utf-8?B?YmdOcWZpOGVNQjJPam1JWGQvaVIxSlprZkJkejFoKzV1QjZMWUNmTTRmdWRF?=
 =?utf-8?B?bitGbWVWMUFjeW5MZm9DVTdzRXdHemRpdFJua1lORFFFWElCRUhOR2xyM3c4?=
 =?utf-8?B?K2hFWlJpMkZ6RFlvNU91S1NsL09NbmtvVWtvUmhWdWgrRlp0NVZYeENkYUxO?=
 =?utf-8?B?ODhJN2drL0laRDJPOXFGRUExbldDRWYvaVU0N1pWaThENmUyQndlRENScnJ2?=
 =?utf-8?B?dDA2MW5tMWFraUNXYWZWajdaNHNMN2VoMGVsczhtQWdWc0JVbXJ4alNSMWt4?=
 =?utf-8?B?WUJTTmd0WDl2M0ZteVBDRmlNZkd1dmlXb21COTRYMHhvOGhUM2F1QWwxdSs5?=
 =?utf-8?B?aHB0UGUyVk40c3NldjFmVEgyZnYvdUduL0lQOWU4THZGNEFjQTVGZnRIdUQr?=
 =?utf-8?B?U2NWdEZQdmlmdzVwZG5JU1N6VUR6eUl2TzBqNWVsUCtReHZmRUdBaXc3U2NY?=
 =?utf-8?B?K2MwUlhabFEzZHYwVUZVa25kUmZiWUlRL3dOeCtPRUx0ZUlFcWtYNzM2MkNY?=
 =?utf-8?B?NUhRelNFTGJsSHZZWDBMdTRHVG0zeFdJV3QwMnh2cEpWRTVlN3U2WHdwRmxQ?=
 =?utf-8?B?Rk1ueGdWL0JHMitMWFJ3ZGppdXdSOHEwd1FnMmVmT3hQcnNMQWlUNW5qUGEx?=
 =?utf-8?B?ZUdobHErSHZUN0x4Q3FPZVlHU2Q3S2xPaW1tQTdZSnlnZFUza0NwZ0hlTjJW?=
 =?utf-8?B?clFPNFk3RjZMN0JZM1c3RE5sb3FJZVV3elVZM2dBU081ZG1La2ZpRnZ1VGhB?=
 =?utf-8?B?ZkZhMjBvY24yTVg1SlV4R1NQVDBGWStFV3Z4TmljMVUzY0FEQTlnazZKa2p5?=
 =?utf-8?B?LzNUN3BjbGttUU02NWxYUU9mS01EQVk1dGltZnIvNXZKQmVjdUxOdVBFSkVo?=
 =?utf-8?B?NEZkalJtVmNsbDlTZ3JzNXdGVFR6NDQ5RExMU0hJazZXanZtOFFBc3ptUE9W?=
 =?utf-8?B?aEYzVWdCZEhNcFpCWFMzTWZlNEo4L285MTFxaUhrcFZFTHlaUEpTVENVcmc2?=
 =?utf-8?B?WWEwSE1WNERaMXhyczA5aXNWTkcyVWxQcnZ0NTJvZzFPSHVtQ21PQVBaR3dp?=
 =?utf-8?B?eDhJQVhaUWJGdXNtdXgwb0FjZFBlWmd1bXQvck1yeFRNQTZadXNiRWFqeHZ1?=
 =?utf-8?B?bkl3Z2hmWDZpU01CZEJsSG5sWldnSXREbWpRYlJBb1N4T29iSk01NnNSVHht?=
 =?utf-8?B?L0czM3IwTjk1SkoraWM5WDVvQkduV3hneEtuc3hqN2lucEpjZ2haOXRMdzZz?=
 =?utf-8?Q?DSPgztIwk/fymMDTQfoP00sNH0J969vfxI1Eu2H?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93e88c1-647c-4f2d-1294-08d919bcaca7
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:20:39.4120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnSqoOG05TAXTf6qeZlFjAVvxptF7ufYmpsldeV0Q+Np46htZJvzh3Yl6nJ7zuchaWxC4A8BQMBoUaCFvYgWhnm/m4wAz4PvbGLisXimAwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2101
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
Thank  you for your review.
I will update these in V2 patch.
Thanks,
Quanyang

On 5/18/21 12:48 AM, Paul Cercueil wrote:
> Hi Quanyang,
> 
> Le jeu., mai 13 2021 at 19:45:39 +0800, quanyang.wang@windriver.com a 
> écrit :
>> From: Quanyang Wang <quanyang.wang@windriver.com>
>>
>> Add a new function is_layer_vid() to simplify the code that
>> judges if a layer is the video layer.
>>
>> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
>> ---
>>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 39 +++++++++++++++++-------------
>>  1 file changed, 22 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c 
>> b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index 109d627968ac..c55e24412f8c 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -434,30 +434,35 @@ static void zynqmp_disp_avbuf_write(struct 
>> zynqmp_disp_avbuf *avbuf,
>>      writel(val, avbuf->base + reg);
>>  }
>>
>> +static bool is_layer_vid(struct zynqmp_disp_layer *layer)
> 
> 'layer' should be const.
> 
>> +{
>> +    return (layer->id == ZYNQMP_DISP_LAYER_VID) ? true : false;
> 
> return layer->id == ZYNQMP_DISP_LAYER_VID;
> 
> The rest looks good.
> 
> With these fixed:
> Acked-by: Paul Cercueil <paul@crapouillou.net>
> 
> Cheers,
> -Paul
> 
>> +}
>> +
>>  /**
>>   * zynqmp_disp_avbuf_set_format - Set the input format for a layer
>>   * @avbuf: Audio/video buffer manager
>> - * @layer: The layer ID
>> + * @layer: The layer
>>   * @fmt: The format information
>>   *
>>   * Set the video buffer manager format for @layer to @fmt.
>>   */
>>  static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp_avbuf 
>> *avbuf,
>> -                     enum zynqmp_disp_layer_id layer,
>> +                     struct zynqmp_disp_layer *layer,
>>                       const struct zynqmp_disp_format *fmt)
>>  {
>>      unsigned int i;
>>      u32 val;
>>
>>      val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_FMT);
>> -    val &= layer == ZYNQMP_DISP_LAYER_VID
>> +    val &= is_layer_vid(layer)
>>          ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
>>          : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
>>      val |= fmt->buf_fmt;
>>      zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_FMT, val);
>>
>>      for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
>> -        unsigned int reg = layer == ZYNQMP_DISP_LAYER_VID
>> +        unsigned int reg = is_layer_vid(layer)
>>                   ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
>>                   : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
>>
>> @@ -573,19 +578,19 @@ static void 
>> zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
>>  /**
>>   * zynqmp_disp_avbuf_enable_video - Enable a video layer
>>   * @avbuf: Audio/video buffer manager
>> - * @layer: The layer ID
>> + * @layer: The layer
>>   * @mode: Operating mode of layer
>>   *
>>   * Enable the video/graphics buffer for @layer.
>>   */
>>  static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf 
>> *avbuf,
>> -                       enum zynqmp_disp_layer_id layer,
>> +                       struct zynqmp_disp_layer *layer,
>>                         enum zynqmp_disp_layer_mode mode)
>>  {
>>      u32 val;
>>
>>      val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -    if (layer == ZYNQMP_DISP_LAYER_VID) {
>> +    if (is_layer_vid(layer)) {
>>          val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>>          if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
>>              val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
>> @@ -605,17 +610,17 @@ static void 
>> zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
>>  /**
>>   * zynqmp_disp_avbuf_disable_video - Disable a video layer
>>   * @avbuf: Audio/video buffer manager
>> - * @layer: The layer ID
>> + * @layer: The layer
>>   *
>>   * Disable the video/graphics buffer for @layer.
>>   */
>>  static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf 
>> *avbuf,
>> -                        enum zynqmp_disp_layer_id layer)
>> +                        struct zynqmp_disp_layer *layer)
>>  {
>>      u32 val;
>>
>>      val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -    if (layer == ZYNQMP_DISP_LAYER_VID) {
>> +    if (is_layer_vid(layer)) {
>>          val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>>          val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
>>      } else {
>> @@ -807,7 +812,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct 
>> zynqmp_disp_blend *blend,
>>          }
>>      }
>>
>> -    if (layer->id == ZYNQMP_DISP_LAYER_VID)
>> +    if (is_layer_vid(layer))
>>          reg = ZYNQMP_DISP_V_BLEND_IN1CSC_COEFF(0);
>>      else
>>          reg = ZYNQMP_DISP_V_BLEND_IN2CSC_COEFF(0);
>> @@ -818,7 +823,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct 
>> zynqmp_disp_blend *blend,
>>          zynqmp_disp_blend_write(blend, reg + 8, coeffs[i + swap[2]]);
>>      }
>>
>> -    if (layer->id == ZYNQMP_DISP_LAYER_VID)
>> +    if (is_layer_vid(layer))
>>          reg = ZYNQMP_DISP_V_BLEND_IN1CSC_OFFSET(0);
>>      else
>>          reg = ZYNQMP_DISP_V_BLEND_IN2CSC_OFFSET(0);
>> @@ -1025,7 +1030,7 @@ zynqmp_disp_layer_find_format(struct 
>> zynqmp_disp_layer *layer,
>>   */
>>  static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
>>  {
>> -    zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer->id,
>> +    zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
>>                         ZYNQMP_DISP_LAYER_NONLIVE);
>>      zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
>>
>> @@ -1046,7 +1051,7 @@ static void zynqmp_disp_layer_disable(struct 
>> zynqmp_disp_layer *layer)
>>      for (i = 0; i < layer->drm_fmt->num_planes; i++)
>>          dmaengine_terminate_sync(layer->dmas[i].chan);
>>
>> -    zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer->id);
>> +    zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
>>      zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
>>  }
>>
>> @@ -1067,7 +1072,7 @@ static void zynqmp_disp_layer_set_format(struct 
>> zynqmp_disp_layer *layer,
>>      layer->disp_fmt = zynqmp_disp_layer_find_format(layer, 
>> info->format);
>>      layer->drm_fmt = info;
>>
>> -    zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer->id,
>> +    zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer,
>>                       layer->disp_fmt);
>>
>>      /*
>> @@ -1244,8 +1249,8 @@ static int zynqmp_disp_create_planes(struct 
>> zynqmp_disp *disp)
>>              drm_formats[j] = layer->info->formats[j].drm_fmt;
>>
>>          /* Graphics layer is primary, and video layer is overlay. */
>> -        type = i == ZYNQMP_DISP_LAYER_GFX
>> -             ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
>> +        type = is_layer_vid(layer)
>> +             ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
>>          ret = drm_universal_plane_init(disp->drm, &layer->plane, 0,
>>                             &zynqmp_disp_plane_funcs,
>>                             drm_formats,
> 
> 
