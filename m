Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05676553080
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 13:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B22610E1E2;
	Tue, 21 Jun 2022 11:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E169910E192;
 Tue, 21 Jun 2022 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1655810065; x=1656414865;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mxgCmDSNo4wq7wKf0hRWn6gnTfY/7UAUbFURJLi3wrM=;
 b=vfc7pAz9vuVw7n11Plvv4OzMqfN0a1URrewInZo6VouwyGVZwKs2Fe+T
 mlURuZ4ualNwUYnNVAXx/zXRSOrHGNbGpEWn0ZhprWSB+fyQW3y2k0tvh
 +PX23EKFUnEC44655m9aZox7TcLe5qiCK/CWz9jdeO5PkOc9COCi1+ooy 8=;
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 11:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgWfzoO5vFggMoh7zZHH73reJY9AeS+1caPdEds8PFw5PK4izQ50Fag75DUoOaz8SBdm03OghodRMQMh69Tnqr7WjynHBFkOF1xHzylbRkYFrN7AMjotWT6fPvQULcHGA3YhNI20wWpYE262fCePKUL2bMNPhsbGyFlDt4DlINfvxJOdaUSo0fD2Dy2FEaisjX8dQ5e7bkBtPVe4o+VEI7rbsIoeOCm7j04Z9UGAVHUgwfuTNaVdSrLA3qO4gJ+F2ofrv0RVPJnHNqg1MpVb6B4LRbzRcfYpiwgvpFe7T7YEUA8xn9ATmo4W8NSLaAws/NbgT+bVa+DC0SPue05JJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxgCmDSNo4wq7wKf0hRWn6gnTfY/7UAUbFURJLi3wrM=;
 b=WvRF79GYyIjUKks7VKwldctokzbDlKIXut2+dXVRGmH0vKUYa6Mbxh0U//JxzSKFEOqrxYMHthZgvBjnpbKwQ6YcdvCTqs7w/8dqk4oua/0YcnSBzZ9YDrV+pYzPRphf+ifRRj2xB7dGgZZ9krfpYS+eCA6RtA8bNL5iX+RiQj59YY/n1VrXWk6F0/yuGjJVwlWJ2QJWxdbWYKch0b5vhVHZ+/KQRpmWfS0k93KBB1PcBFwTdxDYuHrWICGkCHag8F4GruHt6z8/nS4TaFcHL0dVLoQoNz7V0ct9I7KaA9VXj62hai4QeQKWPQRLPegKYljan7VgckFcEHy7s/30aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by CH0PR02MB8149.namprd02.prod.outlook.com (2603:10b6:610:10a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 11:14:21 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::452f:6183:8e9d:4eca]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::452f:6183:8e9d:4eca%5]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 11:14:21 +0000
From: Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
To: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "Vinod Polimera
 (QUIC)" <quic_vpolimer@quicinc.com>
Subject: RE: [PATCH v2 1/4] drm/msm/dp: Add basic PSR support for eDP
Thread-Topic: [PATCH v2 1/4] drm/msm/dp: Add basic PSR support for eDP
Thread-Index: AQHYJzKijVvXKnfRb0ynMVy9TqIydKygE3CAgLpcL8A=
Date: Tue, 21 Jun 2022 11:14:21 +0000
Message-ID: <MW4PR02MB7186B9CE8603F44F31BF8239E1B39@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com>
 <YhVRxW81xRUoOcLj@ripper>
In-Reply-To: <YhVRxW81xRUoOcLj@ripper>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fb4e1a6-a166-462e-1713-08da537730f3
x-ms-traffictypediagnostic: CH0PR02MB8149:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR02MB81496CA7B260FD102D72F784E1B39@CH0PR02MB8149.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fP8/70d0hwhwopC/0quCJRbqVuWtxHHCGaRtiTwEqS8sarYDo2CBjbqwYkFB1nIajibysGio0hyiMx7YKAsdPqCX6cU1lc1gV/+I9KJIZUEgPnjJ91rACtGzCQdpPfs/0Gqa6WWcs7LCuYnFefNbXryR3XiCvBS2HHmruS+Pfi3FCLUGrQNXiOnsouNfiMOapKkLQaB2L/nJfrtRc+e8TKUYgf7zCUFxRC8slDOAvHkSJyu273hx4JHyM/fy2WZy7teoAz8BtIEpgvpZiXqZrNQM4WI2Ah6b3jbo6ajT2KgkzFhnrkAZSBgZ3uViu90MDcQEPIsIC6TjoE0SkzGbSIWrPz/zqILdFJk0mVvRlU7F7imzX7uqexTaRfXrYqS6x5D7Ey+KBZymJ0HdFu7RaCqDQ7hUpl92rEOvfNhPyYR1u7tkD74O4L/MuJ2rE2n6FyHjhLKGJCF8s5jxjy7L/97f0svm/RFkH6kISDc7X8rmy4Sc2fCMsdb/ksqunhYArJjYv+e2OAaWHGbN+dpdF+oc/Es3/JTN2UbTV2WYb1bDZ7WsHp2RlBFLS3auurdW25VZ8a6gB5tTBkuLiIEeCSjrbBUtDV+kgbHYr6leDb5OcJF8ZZ7FTle0sYlxPS6McGzfbEODbObOCFYplSJL51v/UgrFAc2c53clz3/b9FKpwl4EnvfaB5lCv+k7EbcWse82e1SoErTG21gRUjzuRUADfnvjmjBNAy0yE/Xi31Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(38100700002)(55016003)(8676002)(66476007)(41300700001)(110136005)(66946007)(316002)(107886003)(66556008)(64756008)(186003)(38070700005)(4326008)(66446008)(83380400001)(76116006)(54906003)(122000001)(86362001)(52536014)(8936002)(9686003)(71200400001)(7696005)(478600001)(26005)(6506007)(7416002)(30864003)(5660300002)(33656002)(2906002)(559001)(579004)(309714004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OMofhSToFmkcLO9AfS31gSe50LAkmFGz+3FHhra5Y/wTKcXrhgRUEWJ6DSWu?=
 =?us-ascii?Q?uhOxZwSSa5JsL+xlGiH4DzARbUah0oPNidECMLDLqcNgo56gkHmRoL4VLlNO?=
 =?us-ascii?Q?ERLwTVEPvMJFzWgM9N+QB5m7TXxsqLgdlexyKMLZQyNs5GglrPjBrqIaXWv5?=
 =?us-ascii?Q?c62TELV2pxY1Snzj+WAR1BdKt1iH9BbL4aTZA1TSzYrbnCTPnbkDIoSoqOaw?=
 =?us-ascii?Q?pQzxGNtiXJrrJqVqtfq8ihiVKWiVVaLomAJmhLM5yUDjZQWqvYZ9oW8NQbFz?=
 =?us-ascii?Q?eii72a5G0mmcgif5n3KZqFP6PqnDeDRlFV1BcKYHesB9ygHh9aVwDZCqdEgy?=
 =?us-ascii?Q?5tnPgezmhLIhCEWS9Q49FdNR7Bpmm6ir/YcVeRr1HYEbfeHKGI84CP+YUHSV?=
 =?us-ascii?Q?AR/t5YefYXVodiPgsok67Oxnf4wl6LdWpIsXSh/ThTkLFiia3JQvY78iauKH?=
 =?us-ascii?Q?zum7sin1hDkZ/NZdJhPpShatVNBsnv/x4RiraZJJ1EFWs/4vcrlJItfrdTEw?=
 =?us-ascii?Q?aMNJlHY45v9iaFDKJQB5pwbOaSpsgr7L1uVOFLFUC3BWVE+UzcjJ4tHb1vLW?=
 =?us-ascii?Q?gYcqWpl8GqqGpMkUJSWAv58XxeMvVER9Z+ZDjtpSyXn+EstQsgXAP+y1c6JN?=
 =?us-ascii?Q?DG44KOowI2bGcb1E8yzqdwdIPX86aUesoY4L7BN6m9MqTMN05IdbW2ZO/+L1?=
 =?us-ascii?Q?aporEBqt/vtyrOm0/jdZlQKMTV7rervH1s2pknx63CheR00uyPpH44hs0n8R?=
 =?us-ascii?Q?eZDDoFHUunC6cqM1V94iMkElryv4tIJdO/i0pPIcqQGb1lvqeBzMcF2jt60c?=
 =?us-ascii?Q?+XDA+i3B6OM6JrEVYWfQtD8JeVft2ZKGje6NaS9SkdHexDvdtftNb/iAMjW+?=
 =?us-ascii?Q?Wc0MfzAbgwpsDtsYUothOURggL803Uj40Q/Vde+oRKi7QEsRyHmxWz77SDn6?=
 =?us-ascii?Q?NFmBNTwWqiqCZGEAuBISZ9Bn+/5cQOydmfX+f3O6fqSE2gdmZVP0x6YcNJt1?=
 =?us-ascii?Q?6LIPeeE+/LeInvwVqMGiKdHVPaXrMi7pEkwuYsnE6Pm+w0hr2HAMGoK6Qagc?=
 =?us-ascii?Q?kGCBhzqqJsR9LhiPS4Z0HIs3cGuErpy+skkDrnYtE95liGcDlVIm4dyvXVQk?=
 =?us-ascii?Q?UeBffLIQCDC3eZCab7nwRgEQLvTiDETxg1lbZnB3btZ3cGqag0EcO0evZano?=
 =?us-ascii?Q?XdKOXuGsQj3Tq5uBUvx7GGh9CtaBOhTGiwwdPYf2Q15CEAk7ZdxaxcK38aqD?=
 =?us-ascii?Q?dkqu2LdCCxGwBlnnkwCCXVfb2hH7F1EWJSCaq9OlieZTa1HjYnZCeq9FsWPg?=
 =?us-ascii?Q?nIqzN3/3+KzOnVeMs9Vbw/e4wHkyP56VZD+nVttPuAf51l0xmR7zmz9wbXWt?=
 =?us-ascii?Q?nMy9i4IMrIFN5z2PO5JOP/1Ag63sks0dbp0Hq7aM1vrPRk/ssOIRDGKdYkK/?=
 =?us-ascii?Q?cEUOrDEoShwFXBZ3jIY6uQlnkQxQ5RT4W+bKeoeOQuRXqIKajd7jct2Fblgw?=
 =?us-ascii?Q?sTJ9hjfCQt+Pif2OBj9N61ai0UqQfvfktLwIcavgEstx57GOoaPpvHLEjCfv?=
 =?us-ascii?Q?hxnzk7nruHOB2b26v6IDMwhdCQDQbqyu0SSmV8hacYzdTAYynQt67bonbZWv?=
 =?us-ascii?Q?yIsCgEqsIwI+XfrxHab2QO/N3yzzIQsO03wuo1UIVDv6BFejiV6+OCp+CIEq?=
 =?us-ascii?Q?mfsRMpklFfzTVlMVC6OFsvFdCa8eWnNHztMXbEWyVgLlUDGvLvtwJZy20eWf?=
 =?us-ascii?Q?CF2Rjv9urcLGNsgPn4v9ILY1A3IIFtc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb4e1a6-a166-462e-1713-08da537730f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 11:14:21.3640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tmAS2wVdimrfqvJCwrZEMeoVsKExkqvxxDhnprY8nwftKF/jXCE3mG5YDKg3GtxdM6b7C1I8eSZY8Mx5/PG7h/R9uNL5Y+p4zqiS4fiyYbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8149
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "agross@kernel.org" <agross@kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn,

>> Add support for basic panel self refresh (PSR) feature for eDP.
>> Add a new interface to set PSR state in the sink from DPU.
>> Program the eDP controller to issue PSR enter and exit SDP to the
>> sink.
>>
>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>>
>> Changes in v2:
>>   - Use dp bridge to set psr entry/exit instead of dpu_enocder
>>   - Don't modify whitespaces
>>   - set self refresh aware from atomic_check
>>   - set self refresh aware only if psr is supported
>>   - provide a stub for msm_dp_display_set_psr
>> ---
>>  drivers/gpu/drm/msm/dp/dp_catalog.c |  81 +++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  63 +++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +
>>  drivers/gpu/drm/msm/dp/dp_display.c |  14 +++
>>  drivers/gpu/drm/msm/dp/dp_display.h |   1 +
>>  drivers/gpu/drm/msm/dp/dp_drm.c     | 177
>++++++++++++++++++++++++++++++++++--
>>  drivers/gpu/drm/msm/dp/dp_link.c    |  22 +++++
>>  drivers/gpu/drm/msm/dp/dp_panel.c   |  21 +++++
>>  drivers/gpu/drm/msm/dp/dp_panel.h   |   6 ++
>>  drivers/gpu/drm/msm/dp/dp_reg.h     |  19 ++++
>>  drivers/gpu/drm/msm/msm_drv.h       |   6 ++
>>  12 files changed, 411 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index 8a6d3ea..3cd223d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -45,6 +45,14 @@
>>  #define DP_INTERRUPT_STATUS2_MASK \
>>       (DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
>>
>> +#define DP_INTERRUPT_STATUS4 \
>
>Is this group of interrupt bits really called "status4", what is 4?
>Seems more like the "PSR interrupt status bits" to me.
>

The name of the interrupt itself is DP_INTERRUPT_STATUS4
It has PSR status bits. I defined them in dp_reg.h

>> +     (PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
>> +     PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
>> +
>> +#define DP_INTERRUPT_MASK4 \
>> +     (PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
>> +     PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
>> +
>>  struct dp_catalog_private {
>>       struct device *dev;
>>       struct dp_io *io;
>> @@ -343,6 +351,20 @@ void dp_catalog_ctrl_lane_mapping(struct
>dp_catalog *dp_catalog)
>>                       ln_mapping);
>>  }
>>
>> +void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog,
>> +                                             bool enable) {
>> +     u32 mainlink_ctrl;
>> +     struct dp_catalog_private *catalog =3D container_of(dp_catalog,
>> +                             struct dp_catalog_private, dp_catalog);
>> +
>> +     mainlink_ctrl =3D dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
>> +     mainlink_ctrl &=3D ~DP_MAINLINK_CTRL_ENABLE;
>> +     mainlink_ctrl |=3D (enable & DP_MAINLINK_CTRL_ENABLE);
>
>Masking a boolean with constant is different...Please don't do that.
>
>if (enable)
>        mainlink_ctrl |=3D DP_MAINLINK_CTRL_ENABLE; else
>        mainlink_ctrl &=3D ~DP_MAINLINK_CTRL_ENABLE;
>
>Is way less magical.
>
>
>Not also, that you don't have to name your "only" local variable
>"mainline_ctrl", there's no risk for collisions with anything else.
>
>Name it "val" or "ctrl".
>


Okay. Changed it.

>> +
>> +     dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl); }
>> +
>>  void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
>>                                               bool enable)  { @@
>> -581,6 +603,51 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog
>*dp_catalog)
>>       dp_write_aux(catalog, REG_DP_DP_HPD_CTRL,
>> DP_DP_HPD_CTRL_HPD_EN);  }
>>
>> +static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
>> +{
>> +     /* trigger sdp */
>> +     dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x1);
>> +     dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x0);
>
>Can 1 and 0 be defined here?
>

Okay

>> +}
>> +
>> +void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog) {
>> +     struct dp_catalog_private *catalog =3D container_of(dp_catalog,
>> +                             struct dp_catalog_private, dp_catalog);
>> +     u32 psr_config;
>
>Again, a single local variable. Name it "config".
>

Done

>> +
>> +     /* enable PSR1 function */
>> +     psr_config =3D dp_read_link(catalog, REG_PSR_CONFIG);
>> +     psr_config |=3D BIT(0);
>
>Add a define for BIT(0) in this register and the code will be self-explana=
tory,
>no need for a separate comment to help future readers to guess that BIT(0)
>enables something...
>

Okay

>> +     dp_write_link(catalog, REG_PSR_CONFIG, psr_config);
>> +
>> +     dp_write_ahb(catalog, REG_DP_INTR_MASK4,
>DP_INTERRUPT_MASK4);
>> +     dp_catalog_enable_sdp(catalog);
>> +}
>> +
>> +void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool
>> +enter) {
>> +     struct dp_catalog_private *catalog =3D container_of(dp_catalog,
>> +                     struct dp_catalog_private, dp_catalog);
>> +     u32 psr_cmd;
>
>"cmd" is sufficient.
>

Okay

>> +
>> +     psr_cmd =3D dp_read_link(catalog, REG_PSR_CMD);
>> +
>> +     /*
>> +      * BIT(0) - send psr entry SDP
>> +      * BIT(1) - sned psr exit SDP
>> +      */
>> +     psr_cmd &=3D ~(BIT(0) | BIT(1));
>> +
>> +     if (enter)
>> +             psr_cmd |=3D BIT(0);
>> +     else
>> +             psr_cmd |=3D BIT(1);
>
>As above, defines for BIT(0) and BIT(1), and drop the comment, please.
>

Okay. Will do it

>> +
>> +     dp_catalog_enable_sdp(catalog);
>> +     dp_write_link(catalog, REG_PSR_CMD, psr_cmd); }
>> +
>>  u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)  {
>>       struct dp_catalog_private *catalog =3D container_of(dp_catalog, @@
>> -608,6 +675,20 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog
>*dp_catalog)
>>       return isr;
>>  }
>>
>> +int dp_catalog_ctrl_get_psr_interrupt(struct dp_catalog *dp_catalog)
>
>"Getting an interrupt" is something we do with e.g. platform_get_irq().
>
>dp_catalog_ctrl_read_psr_interrupt_status() would better represent the
>purpose of this function.
>

Will change it

>> +{
>> +     struct dp_catalog_private *catalog =3D container_of(dp_catalog,
>> +                             struct dp_catalog_private, dp_catalog);
>> +     u32 intr, intr_ack;
>> +
>> +     intr =3D dp_read_ahb(catalog, REG_DP_INTR_STATUS4);
>> +     intr_ack =3D (intr & DP_INTERRUPT_STATUS4)
>> +                     << DP_INTERRUPT_STATUS_ACK_SHIFT;
>> +     dp_write_ahb(catalog, REG_DP_INTR_STATUS4, intr_ack);
>> +
>> +     return intr;
>> +}
>> +
>>  int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)  {
>>       struct dp_catalog_private *catalog =3D container_of(dp_catalog,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> index 6965afa..9b1b199 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> @@ -91,6 +91,7 @@ void dp_catalog_ctrl_state_ctrl(struct dp_catalog
>> *dp_catalog, u32 state);  void dp_catalog_ctrl_config_ctrl(struct
>> dp_catalog *dp_catalog, u32 config);  void
>> dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);  void
>> dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool
>> enable);
>> +void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog
>> +*dp_catalog, bool enable);
>>  void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32
>> cc, u32 tb);  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_cata=
log,
>u32 rate,
>>                               u32 stream_rate_khz, bool fixed_nvid);
>> @@ -101,12 +102,15 @@ void dp_catalog_ctrl_enable_irq(struct
>> dp_catalog *dp_catalog, bool enable);  void
>dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>>                       u32 intr_mask, bool en);  void
>> dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
>> +void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog); void
>> +dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
>>  u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
>>  u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
>> void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);  int
>> dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
>>                               u8 p_level);  int
>> dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
>> +int dp_catalog_ctrl_get_psr_interrupt(struct dp_catalog *dp_catalog);
>>  void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog=
,
>>                               u32 dp_tu, u32 valid_boundary,
>>                               u32 valid_boundary2); diff --git
>> a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 88ca6c3..ba828ea 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -21,6 +21,7 @@
>>
>>  #define DP_KHZ_TO_HZ 1000
>>  #define IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES      (30 * HZ / 1000)
>/* 30 ms */
>> +#define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES       (300 * HZ /
>1000) /* 300 ms */
>>  #define WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES (HZ / 2)
>>
>>  #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
>> @@ -78,6 +79,7 @@ struct dp_ctrl_private {
>>       struct dp_catalog *catalog;
>>
>>       struct completion idle_comp;
>> +     struct completion psr_op_comp;
>>       struct completion video_comp;
>>  };
>>
>> @@ -151,6 +153,9 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_priva=
te
>*ctrl)
>>       config |=3D DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
>>       config |=3D DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
>>
>> +     if (ctrl->panel->psr_cap.version)
>> +             config |=3D DP_CONFIGURATION_CTRL_SEND_VSC;
>> +
>>       dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);  }
>>
>> @@ -1365,6 +1370,52 @@ static int dp_ctrl_enable_stream_clocks(struct
>dp_ctrl_private *ctrl)
>>       return ret;
>>  }
>>
>> +void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl) {
>> +     struct dp_ctrl_private *ctrl;
>> +     u8 psr_config;
>
>"config" - or "cfg' per the register name.
>

Okay

>> +
>> +     ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>
>Join this with the declaration of ctrl.
>

Okay

>> +
>> +     if (!ctrl->panel->psr_cap.version)
>> +             return;
>> +
>> +     dp_catalog_ctrl_config_psr(ctrl->catalog);
>> +
>> +     psr_config =3D DP_PSR_ENABLE;
>> +     drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &psr_config, 1); }
>> +
>> +void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter) {
>> +     struct dp_ctrl_private *ctrl;
>> +
>> +     ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>
>As above, please join this with the previous line.
>

Done

>> +
>> +     if (!ctrl->panel->psr_cap.version)
>> +             return;
>> +
>> +     if (enter) {
>> +             reinit_completion(&ctrl->psr_op_comp);
>> +             dp_catalog_ctrl_set_psr(ctrl->catalog, true);
>> +
>> +             if (!wait_for_completion_timeout(&ctrl->psr_op_comp,
>> +                     PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES)) {
>> +                     DRM_ERROR("PSR_ENTRY timedout\n");
>> +                     dp_catalog_ctrl_set_psr(ctrl->catalog, false);
>> +                     return;
>> +             }
>> +
>> +             dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>> +
>> +             dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog,
>> + false);
>
>So to enter psr we disable psr_mainline...
>
>> +     } else {
>> +             dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog,
>> + true);
>
>and to exit psr we enable psr_mainline?
>
>I certainly would not mind having a comment above this section describing
>how this is supposed to work.
>

Added the comments in the new version

>> +
>> +             dp_catalog_ctrl_set_psr(ctrl->catalog, false);
>> +     }
>> +}
>> +
>>  int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
>> {
>>       struct dp_ctrl_private *ctrl;
>> @@ -1964,6 +2015,17 @@ void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
>>
>>       ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>>
>> +     if (ctrl->panel->psr_cap.version) {
>> +             isr =3D dp_catalog_ctrl_get_psr_interrupt(ctrl->catalog);
>> +
>> +             if (isr =3D=3D 0x1)
>> +                     DRM_DEBUG_DP("PSR frame update done\n");
>> +             else if (isr =3D=3D 0x10)
>
>Again, the error messages gives a good indication what these bits might be=
,
>but please provide defines to make it clearer.
>

Okay

>> +                     DRM_DEBUG_DP("PSR exit done\n");
>> +
>> +             complete(&ctrl->psr_op_comp);
>> +     }
>> +
>>       isr =3D dp_catalog_ctrl_get_interrupt(ctrl->catalog);
>>
>>       if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) { @@ -2010,6 +2072,7 @@
>> struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>>               dev_err(dev, "failed to add DP OPP table\n");
>>
>>       init_completion(&ctrl->idle_comp);
>> +     init_completion(&ctrl->psr_op_comp);
>>       init_completion(&ctrl->video_comp);
>>
>>       /* in parameters */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 2363a2d..f623035 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -34,4 +34,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct
>dp_link *link,
>>                       struct dp_power *power, struct dp_catalog *catalog=
,
>>                       struct dp_parser *parser);
>>
>> +void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable); void
>> +dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
>> +
>>  #endif /* _DP_CTRL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 5d314e6..c8d02fb 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -347,6 +347,8 @@ static int dp_display_process_hpd_high(struct
>> dp_display_private *dp)
>>
>>       edid =3D dp->panel->edid;
>>
>> +     dp->dp_display.psr_supported =3D !!dp->panel->psr_cap.version;
>> +
>>       dp->audio_supported =3D drm_detect_monitor_audio(edid);
>>       dp_panel_handle_sink_request(dp->panel);
>>
>> @@ -871,6 +873,10 @@ static int dp_display_post_enable(struct msm_dp
>> *dp_display)
>>
>>       /* signal the connect event late to synchronize video and display =
*/
>>       dp_display_handle_plugged_change(dp_display, true);
>> +
>> +     if (dp_display->psr_supported)
>> +             dp_ctrl_config_psr(dp->ctrl);
>> +
>>       return 0;
>>  }
>>
>> @@ -1037,6 +1043,14 @@ static void dp_display_config_hpd(struct
>dp_display_private *dp)
>>       enable_irq(dp->irq);
>>  }
>>
>> +void msm_dp_display_set_psr(struct msm_dp *dp_display, bool enter) {
>> +     struct dp_display_private *dp;
>> +
>> +     dp =3D container_of(dp_display, struct dp_display_private, dp_disp=
lay);
>> +     dp_ctrl_set_psr(dp->ctrl, enter); }
>> +
>>  static int hpd_event_thread(void *data)  {
>>       struct dp_display_private *dp_priv; diff --git
>> a/drivers/gpu/drm/msm/dp/dp_display.h
>> b/drivers/gpu/drm/msm/dp/dp_display.h
>> index e3adcd5..6f512f3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -28,6 +28,7 @@ struct msm_dp {
>>
>>       u32 max_dp_lanes;
>>       struct dp_audio *dp_audio;
>> +     bool psr_supported;
>>  };
>>
>>  int dp_display_set_plugged_cb(struct msm_dp *dp_display, diff --git
>> a/drivers/gpu/drm/msm/dp/dp_drm.c
>b/drivers/gpu/drm/msm/dp/dp_drm.c
>> index 2436329..d26ca6a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> @@ -142,6 +142,35 @@ static enum drm_mode_status
>edp_connector_mode_valid(
>>       return MODE_OK;
>>  }
>>
>> +
>> +
>> +static int edp_connector_atomic_check(struct drm_connector *connector,
>> +                                 struct drm_atomic_state *state) {
>> +     struct msm_dp *dp;
>> +     struct drm_connector_state *conn_state;
>> +     struct drm_crtc_state *crtc_state;
>> +
>> +     dp =3D to_dp_connector(connector)->dp_display;
>> +     conn_state =3D drm_atomic_get_new_connector_state(state,
>connector);
>> +     if (WARN_ON(!conn_state))
>> +             return -ENODEV;
>> +
>> +     conn_state->self_refresh_aware =3D true;
>> +
>> +     if (!conn_state->crtc)
>> +             return 0;
>> +
>> +     crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->cr=
tc);
>> +     if (!crtc_state)
>> +             return 0;
>> +
>> +     if (crtc_state->self_refresh_active && !dp->psr_supported)
>> +             return -EINVAL;
>> +
>> +     return 0;
>> +}
>> +
>>  static const struct drm_connector_funcs dp_connector_funcs =3D {
>>       .detect =3D dp_connector_detect,
>>       .fill_modes =3D drm_helper_probe_single_connector_modes,
>> @@ -151,6 +180,11 @@ static const struct drm_connector_funcs
>dp_connector_funcs =3D {
>>       .atomic_destroy_state =3D
>> drm_atomic_helper_connector_destroy_state,
>>  };
>>
>> +static const struct drm_connector_helper_funcs
>dp_connector_helper_funcs =3D {
>> +     .get_modes =3D dp_connector_get_modes,
>> +     .mode_valid =3D dp_connector_mode_valid, };
>> +
>>  static const struct drm_connector_funcs edp_connector_funcs =3D {
>>       .fill_modes =3D drm_helper_probe_single_connector_modes,
>>       .destroy =3D drm_connector_cleanup, @@ -159,12 +193,8 @@ static
>> const struct drm_connector_funcs edp_connector_funcs =3D {
>>       .atomic_destroy_state =3D
>> drm_atomic_helper_connector_destroy_state,
>>  };
>>
>> -static const struct drm_connector_helper_funcs
>dp_connector_helper_funcs =3D {
>> -     .get_modes =3D dp_connector_get_modes,
>> -     .mode_valid =3D dp_connector_mode_valid,
>> -};
>> -
>>  static const struct drm_connector_helper_funcs
>> edp_connector_helper_funcs =3D {
>> +     .atomic_check =3D edp_connector_atomic_check,
>>       .get_modes =3D edp_connector_get_modes,
>>       .mode_valid =3D edp_connector_mode_valid,  }; @@ -258,6 +288,130
>> @@ static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
>>       msm_dp_display_disable(dp_display, drm_bridge->encoder);  }
>>
>> +static struct drm_crtc *dp_bridge_get_old_connector_crtc(struct msm_dp
>*dp,
>> +                                       struct drm_atomic_state
>> +*state) {
>> +     struct drm_encoder *encoder =3D dp->encoder;
>> +     struct drm_connector *connector;
>> +     struct drm_connector_state *conn_state;
>> +
>> +     connector =3D drm_atomic_get_old_connector_for_encoder(state,
>encoder);
>> +     if (!connector)
>> +             return NULL;
>> +
>> +     conn_state =3D drm_atomic_get_old_connector_state(state, connector=
);
>> +     if (!conn_state)
>> +             return NULL;
>> +
>> +     return conn_state->crtc;
>> +}
>> +
>> +static struct drm_crtc *dp_bridge_get_new_connector_crtc(struct
>msm_dp *dp,
>> +                                       struct drm_atomic_state
>> +*state) {
>> +     struct drm_encoder *encoder =3D dp->encoder;
>> +     struct drm_connector *connector;
>> +     struct drm_connector_state *conn_state;
>> +
>> +     connector =3D drm_atomic_get_new_connector_for_encoder(state,
>encoder);
>> +     if (!connector)
>> +             return NULL;
>> +
>> +     conn_state =3D drm_atomic_get_new_connector_state(state,
>connector);
>> +     if (!conn_state)
>> +             return NULL;
>> +
>> +     return conn_state->crtc;
>> +}
>> +
>> +static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>> +                             struct drm_bridge_state
>> +*old_bridge_state) {
>> +     struct drm_atomic_state *old_state =3D old_bridge_state->base.stat=
e;
>> +     struct drm_crtc *crtc;
>> +     struct drm_crtc_state *old_crtc_state;
>> +     struct msm_dp_bridge *dp_bridge =3D to_dp_display(drm_bridge);
>> +     struct msm_dp *dp_display =3D dp_bridge->dp_display;
>> +
>> +     crtc =3D dp_bridge_get_new_connector_crtc(dp_display, old_state);
>> +     if (!crtc)
>> +             return;
>> +
>> +     old_crtc_state =3D drm_atomic_get_old_crtc_state(old_state, crtc);
>> +
>> +     /* Exit from self refresh mode */
>> +     if (old_crtc_state && old_crtc_state->self_refresh_active) {
>> +             msm_dp_display_set_psr(dp_display, false);
>> +             return;
>> +     }
>> +
>> +     msm_dp_display_enable(dp_display, drm_bridge->encoder); }
>> +
>> +static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>> +                             struct drm_bridge_state
>> +*old_bridge_state) {
>> +     struct drm_atomic_state *old_state =3D old_bridge_state->base.stat=
e;
>> +     struct drm_crtc *crtc;
>> +     struct drm_crtc_state *new_crtc_state =3D NULL, *old_crtc_state =
=3D NULL;
>> +     struct msm_dp_bridge *dp_bridge =3D to_dp_display(drm_bridge);
>> +     struct msm_dp *dp_display =3D dp_bridge->dp_display;
>> +
>> +     crtc =3D dp_bridge_get_old_connector_crtc(dp_display, old_state);
>> +     if (!crtc)
>> +             goto out;
>> +
>> +     new_crtc_state =3D drm_atomic_get_new_crtc_state(old_state, crtc);
>> +     if (!new_crtc_state)
>> +             goto out;
>> +
>> +     old_crtc_state =3D drm_atomic_get_old_crtc_state(old_state, crtc);
>> +     if (!old_crtc_state)
>> +             goto out;
>> +
>> +     /*
>> +      * Set self refresh mode if current crtc state is active.
>> +      * If old crtc state is active, exit psr before disabling
>> +      * the controller. Observed sink stuck in self refresh
>> +      * if psr exit is skipped when screen off occurs with
>> +      * sink in psr mode.
>> +      */
>> +     if (new_crtc_state->self_refresh_active) {
>> +             msm_dp_display_set_psr(dp_display, true);
>> +             return;
>> +     } else if (old_crtc_state->self_refresh_active) {
>> +             msm_dp_display_set_psr(dp_display, false);
>> +             return;
>> +     }
>> +
>> +out:
>> +     msm_dp_display_pre_disable(dp_display, drm_bridge->encoder); }
>> +
>> +static void edp_bridge_atomic_post_disable(struct drm_bridge
>*drm_bridge,
>> +                             struct drm_bridge_state
>> +*old_bridge_state) {
>> +     struct drm_atomic_state *old_state =3D old_bridge_state->base.stat=
e;
>> +     struct drm_crtc *crtc;
>> +     struct drm_crtc_state *new_crtc_state =3D NULL;
>> +     struct msm_dp_bridge *dp_bridge =3D to_dp_display(drm_bridge);
>> +     struct msm_dp *dp_display =3D dp_bridge->dp_display;
>> +
>> +     crtc =3D dp_bridge_get_old_connector_crtc(dp_display, old_state);
>> +     if (!crtc)
>> +             return;
>> +
>> +     new_crtc_state =3D drm_atomic_get_new_crtc_state(old_state, crtc);
>> +     if (!new_crtc_state)
>> +             return;
>> +
>> +     /* Self refresh mode is set in dp_bridge_disable. Skip disable */
>> +     if (new_crtc_state->self_refresh_active)
>> +             return;
>> +
>> +     msm_dp_display_disable(dp_display, drm_bridge->encoder); }
>> +
>>  static const struct drm_bridge_funcs dp_bridge_ops =3D {
>>       .enable       =3D dp_bridge_enable,
>>       .disable      =3D dp_bridge_disable,
>> @@ -265,6 +419,16 @@ static const struct drm_bridge_funcs
>dp_bridge_ops =3D {
>>       .mode_set     =3D dp_bridge_mode_set,
>>  };
>>
>> +static const struct drm_bridge_funcs edp_bridge_ops =3D {
>> +     .atomic_enable       =3D edp_bridge_atomic_enable,
>> +     .atomic_disable      =3D edp_bridge_atomic_disable,
>> +     .atomic_post_disable =3D edp_bridge_atomic_post_disable,
>> +     .mode_set     =3D dp_bridge_mode_set,
>> +     .atomic_reset =3D drm_atomic_helper_bridge_reset,
>> +     .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_sta=
te,
>> +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>> +};
>> +
>>  struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display,
>struct drm_device *dev,
>>                       struct drm_encoder *encoder)  { @@ -279,7 +443,8
>> @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display,
>struct drm_devi
>>       dp_bridge->dp_display =3D dp_display;
>>
>>       bridge =3D &dp_bridge->bridge;
>> -     bridge->funcs =3D &dp_bridge_ops;
>> +     bridge->funcs =3D (dp_display->connector_type =3D=3D
>DRM_MODE_CONNECTOR_eDP) ?
>> +                             &edp_bridge_ops : &dp_bridge_ops;
>>       bridge->encoder =3D encoder;
>>
>>       rc =3D drm_bridge_attach(encoder, bridge, NULL,
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR); diff --git
>> a/drivers/gpu/drm/msm/dp/dp_link.c
>b/drivers/gpu/drm/msm/dp/dp_link.c
>> index d4d31e5..5503c29 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -924,6 +924,26 @@ static int
>dp_link_process_phy_test_pattern_request(
>>       return 0;
>>  }
>>
>> +static int dp_link_psr_status(struct dp_link_private *link)
>
>The implementation and caller indicates that this would better return a bo=
ol.
>That said "status" isn't a boolean property, and given that you return tru=
e
>when capabilities changes, perhaps this is
>dp_link_psr_cap_changed() ?
>

Okay. I split the function into two.

>> +{
>> +     u8 status[2];
>> +
>> +     drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
>> +
>> +     if (status[0] & DP_PSR_LINK_CRC_ERROR)
>> +             DRM_ERROR("PSR LINK CRC ERROR\n");
>> +     else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
>> +             DRM_ERROR("PSR RFB STORAGE ERROR\n");
>> +     else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
>> +             DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
>> +     else if (status[1] & DP_PSR_CAPS_CHANGE)
>> +             DRM_INFO("PSR Capability Change\n");
>
>DEBUG instead?
>

Okay

>> +     else
>> +             return 0;
>> +
>> +     return 1;
>> +}
>> +
>>  static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE],
>> int r)  {
>>       return link_status[r - DP_LANE0_1_STATUS]; @@ -1042,6 +1062,8 @@
>> int dp_link_process_request(struct dp_link *dp_link)
>>               dp_link->sink_request |=3D DP_TEST_LINK_TRAINING;
>>       } else if (!dp_link_process_phy_test_pattern_request(link)) {
>>               dp_link->sink_request |=3D DP_TEST_LINK_PHY_TEST_PATTERN;
>> +     } else if (dp_link_psr_status(link)) {
>> +             DRM_INFO("PSR IRQ_HPD received\n");
>>       } else {
>>               ret =3D dp_link_process_link_status_update(link);
>>               if (!ret) {
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 71db10c..e128d73 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -19,6 +19,26 @@ struct dp_panel_private {
>>       bool aux_cfg_update_done;
>>  };
>>
>> +static void dp_panel_read_psr_cap(struct dp_panel_private *panel) {
>> +     ssize_t rlen;
>> +     struct dp_panel *dp_panel;
>> +
>> +     dp_panel =3D &panel->dp_panel;
>> +
>> +     /* edp sink */
>> +     if (dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
>> +             rlen =3D drm_dp_dpcd_read(panel->aux, DP_PSR_SUPPORT,
>> +                             &dp_panel->psr_cap, 2);
>> +             if (rlen =3D=3D 2) {
>
>sizeof(dp_panel->psr_cap) perhaps?
>

Okay

>> +                     DRM_DEBUG_DP("psr version: 0x%x, psr_cap: 0x%x\n",
>> +                             dp_panel->psr_cap.version,
>> +                             dp_panel->psr_cap.capabilities);
>> +             } else
>> +                     DRM_ERROR("failed to read psr info, rlen=3D%zd\n",=
 rlen);
>> +     }
>> +}
>> +
>>  static int dp_panel_read_dpcd(struct dp_panel *dp_panel)  {
>>       int rc =3D 0;
>> @@ -104,6 +124,7 @@ static int dp_panel_read_dpcd(struct dp_panel
>*dp_panel)
>>               }
>>       }
>>
>> +     dp_panel_read_psr_cap(panel);
>>  end:
>>       return rc;
>>  }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h
>> b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index 9023e5b..631657a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -34,6 +34,11 @@ struct dp_panel_in {
>>       struct dp_catalog *catalog;
>>  };
>>
>> +struct dp_panel_psr {
>> +     u8 version;
>> +     u8 capabilities;
>> +};
>> +
>>  struct dp_panel {
>>       /* dpcd raw data */
>>       u8 dpcd[DP_RECEIVER_CAP_SIZE + 1]; @@ -46,6 +51,7 @@ struct
>> dp_panel {
>>       struct edid *edid;
>>       struct drm_connector *connector;
>>       struct dp_display_mode dp_mode;
>> +     struct dp_panel_psr psr_cap;
>>       bool video_test;
>>
>>       u32 vic;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h
>> b/drivers/gpu/drm/msm/dp/dp_reg.h index 2686028..7a0b052 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -22,6 +22,20 @@
>>  #define REG_DP_INTR_STATUS2                  (0x00000024)
>>  #define REG_DP_INTR_STATUS3                  (0x00000028)
>>
>> +#define REG_DP_INTR_STATUS4                  (0x0000002C)
>> +#define PSR_UPDATE_INT                               (0x00000001)
>> +#define PSR_CAPTURE_INT                              (0x00000004)
>> +#define PSR_EXIT_INT                         (0x00000010)
>> +#define PSR_UPDATE_ERROR_INT                 (0x00000040)
>> +#define PSR_WAKE_ERROR_INT                   (0x00000100)
>> +
>> +#define REG_DP_INTR_MASK4                    (0x00000030)
>> +#define PSR_UPDATE_MASK                              (0x00000001)
>> +#define PSR_CAPTURE_MASK                     (0x00000002)
>> +#define PSR_EXIT_MASK                                (0x00000004)
>> +#define PSR_UPDATE_ERROR_MASK                        (0x00000008)
>> +#define PSR_WAKE_ERROR_MASK                  (0x00000010)
>> +
>>  #define REG_DP_DP_HPD_CTRL                   (0x00000000)
>>  #define DP_DP_HPD_CTRL_HPD_EN                        (0x00000001)
>>
>> @@ -164,6 +178,9 @@
>>  #define MMSS_DP_AUDIO_TIMING_RBR_48          (0x00000094)
>>  #define MMSS_DP_AUDIO_TIMING_HBR_48          (0x00000098)
>>
>> +#define REG_PSR_CONFIG                               (0x00000100)
>> +#define REG_PSR_CMD                          (0x00000110)
>> +
>>  #define MMSS_DP_PSR_CRC_RG                   (0x00000154)
>>  #define MMSS_DP_PSR_CRC_B                    (0x00000158)
>>
>> @@ -184,6 +201,8 @@
>>  #define MMSS_DP_AUDIO_STREAM_0                       (0x00000240)
>>  #define MMSS_DP_AUDIO_STREAM_1                       (0x00000244)
>>
>> +#define MMSS_DP_SDP_CFG3                     (0x0000024c)
>> +
>>  #define MMSS_DP_EXTENSION_0                  (0x00000250)
>>  #define MMSS_DP_EXTENSION_1                  (0x00000254)
>>  #define MMSS_DP_EXTENSION_2                  (0x00000258)
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h
>> b/drivers/gpu/drm/msm/msm_drv.h index ae52412..254fd07 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -400,6 +400,8 @@ void msm_dp_snapshot(struct msm_disp_state
>> *disp_state, struct msm_dp *dp_displa
>>
>>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor
>> *minor);
>>
>> +void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
>> +
>>  #else
>>  static inline int __init msm_dp_register(void)  { @@ -449,6 +451,10
>> @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
>> {  }
>>
>> +static inline void msm_dp_display_set_psr(struct msm_dp *dp, bool
>> +enter)
>
>Perhaps I'm missing it, but I don't see that this is called from outside t=
he DP
>driver. So why does it need to be in msm_drv.h and why do you need a stub?
>

Yeah, it was used earlier when DP bridge was not present. It is not needed =
here anymore. I moved it to dp_display.h

>Thanks,
>Bjorn
>
>> +{
>> +}
>> +
>>  #endif
>>
>>  void __init msm_mdp_register(void);
>> --
>> 2.7.4
>>

Thank you,
Sankeerth
