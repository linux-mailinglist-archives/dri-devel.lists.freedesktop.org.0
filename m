Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6351C864
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 20:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6880B10E52C;
	Thu,  5 May 2022 18:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4339810E52C;
 Thu,  5 May 2022 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1651776467; x=1652381267;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qiuH9qnYJh59GDGYGczP60NjXQZtP13SH2dX45KQqp0=;
 b=kQHhrsjZCfrrUFw4x9xKrAP2fvE+TKiBNlcdqOglIMzaWrZDeGZoyfId
 9c4BkWlNyUtSOB4yTwh0+bYkVuwHfqMYIjDtlJr8YZH1Ge1ntX5f2iBbO
 VDWD12vSrmbmyqiyLBp2T9swyCNAMfsOKEWqX42JItb6k/duPTbPoQ0yR Y=;
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 18:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdVCeG8AYDYmtrTG6wSgc3g06EjtSDuIRLuyW9qfVjVvrlUdwPLgowo+dyBe5YBMUD/b6R2xfpeGMsXod3v6+MW+FcCKlhbr1HgYLZpPuQxKmteYNbt4vv9s5IqxZkYvqJgDAuuLN3R0JQcBgaYiWWlE0SsBwmO37Y7ys7OndZFEMgwR4ZamGF0S22Heo29nzO9dDMNORjzFsikvX4mOnLCw2WwbUoodgj9C4a1NAxSh9JO4aA/yfK9/TPFJ+YPHt7gosQGgHNytnVUkrdD7B/dlvcO+onWTEaifgXg7O5sRgeLi5s+cWiX+N8vbhJ+VTfzyXtc2c6J1//VSzirqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiuH9qnYJh59GDGYGczP60NjXQZtP13SH2dX45KQqp0=;
 b=Ee+gF+j6JGF5b53dlZcsHjB3RWoCwqSxbD+RNQoK9oIJjPIPm5IaI90X2LrBj4sClXflnV5bW5i69xFwWeugA/HB39QFuBOse4qVDdK/nXcp0Wwm7RuN9jZs1P37FCBMs9oNRC24HzHgqjJ1C52Fw82EVhQ9bAc9sV4uZZuPVASIL8GJGsgPp/EQ3jM+vbehl5ViJjL5UeBarHWY5ohY8d//d9ofQ3CkQCi93/JwaYzc9rKf2EXX0lbl6cN/wWbPYtARJGShpOhGTmnBwDVYIwBDY61bFK4Npr/6WcDaztOSKDTOQ1YMduf8ldTLTcpxXkT8PqZFUs4o9DYZxvsFfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by DM5PR02MB3704.namprd02.prod.outlook.com (2603:10b6:4:af::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 18:47:43 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 18:47:43 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Douglas Anderson <dianders@chromium.org>, "bjorn.andersson@linaro.org"
 <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@chromium.org>
Subject: RE: [PATCH 2/2] dt-bindings: phy: List supplies for qcom,edp-phy
Thread-Topic: [PATCH 2/2] dt-bindings: phy: List supplies for qcom,edp-phy
Thread-Index: AQHYWOh7BkuFl+/0hUSepVh/V0WkyK0QoxMQ
Date: Thu, 5 May 2022 18:47:43 +0000
Message-ID: <MW4PR02MB7186F7F6D6D174B03FDF32CEE1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.2.Iae013f0ff4599294189f3a6e91376fad137bbabf@changeid>
In-Reply-To: <20220425140619.2.Iae013f0ff4599294189f3a6e91376fad137bbabf@changeid>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 339470f6-4153-45e6-cb10-08da2ec7bd25
x-ms-traffictypediagnostic: DM5PR02MB3704:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR02MB3704BCEBF423AD5AB0CE29149DC29@DM5PR02MB3704.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dEesA5C+zchly+1ldRl2gTWC8YX3MnR0mAvTR7tJ/LdrmS133Uiaa7h83J+bFhjt1xc76UOpStag9QqHNlWuhMUNqlL9BbFMv/0RIsXczL3b7GirYmO2JgSZrfYfLSDn786PR/ry5h6h0bypzDPjkLVjzdZPywOZW+cHztcUOCEtNDMFvJcdywl5EfYXlkzs+PlEd9s/OuJHpadAYAcp33uZ5gAvbIicvcYXjSrzt646MB60w1cf5wQip6YEtiMC6jSfRhe2bKyZnw4ScaoBVeMfLfKx5Vmuf5wiFrVXUxy/m2ZBftOyq7g2URy8UrdCJFnvHLzN4zcZEQPOnyWYJkCCdNrKF35Hp7CNs0p7RLPkVBM1KFfm36TE9XVigKTId+6YLcWB/iUCqRIh5Zpbi04tGi4O8jh79pJ+m2NjYiFBTATzD07dPO9rRfnrnsfW/Eb/HptMFcG4Vwh96pEqZgC0WK+jxHJGsAThmXYoW4SahrBO+joLzPD5xO/xg+YLOITAuGgiRgwmGahYh6vU3NEdurM8UmiMAnqR9I9c1YmaDuggyVzUxKDgcasCCAXOCv2P2FrlZVQAoKdj5B8vR5M5naN+AaR/8m0XMOxWzMIBDHAJB5mxUq5n9Y2kIHCjiqUTkinTd4vz+zYb850qmmSG3PgrnDUqYfN5+XvmxFI1vE5gqxNrShzuj5sh7Od/FTtix9abIGa2i76zMx8wzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6506007)(26005)(33656002)(7696005)(9686003)(122000001)(8936002)(86362001)(38070700005)(38100700002)(55016003)(54906003)(83380400001)(110136005)(52536014)(5660300002)(7416002)(508600001)(316002)(66446008)(66946007)(66476007)(64756008)(71200400001)(8676002)(76116006)(66556008)(2906002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5vyjJzjxo2VeMLJrfxEyKNVxWBPw94SPqjOylnZFLzSZRksMLR/wYXTJv1v9?=
 =?us-ascii?Q?ikShnM9BSa+LApQp/xA45fH9fzGBgE1dw2DPNadb7217a0MclPgfd4L9T5Yg?=
 =?us-ascii?Q?ruNxY+SGr4na1ENJlOtrydrga6H1alSgZZzCLBz+i/TlB/Rewgv2ZNXx5ct1?=
 =?us-ascii?Q?uCF8P+1Z2YiZKJA8ggO/rWiszU0KAmlM+d4lX+5BguaWs9Hb27POiFSofPnm?=
 =?us-ascii?Q?dm/rYrf72CmFAaohK1VHQ2vbbiZxjf5P+UbQLbYyfADdMEsJdS/ynn/47Uc/?=
 =?us-ascii?Q?MamAO/ZmXlSC9XrGmII/Vj04SkPBK+7/o1fz4GuEwutkJVvAUnV8BpWkEYkK?=
 =?us-ascii?Q?zpu0r3ybcRBTnC/u7Dn/YNMu5eseeW6sX1FLcHnPwl1Qs/U4XV6AXN+6vnQx?=
 =?us-ascii?Q?0lmZFaNuKAURf94bz6XpzyP7Eg6kLqGUJkrYzUzKO5IMV9D8CbNYI65rNV3S?=
 =?us-ascii?Q?91e/0u83rUuSL4M+/4K7aYTnXqLvQtzkqMEFkEXKwKntpUYVQWg+WBvCKw8E?=
 =?us-ascii?Q?Kys5qAcpp0ih2NEokFpIByMRej38aqKE2xJcND1VPS4E1BQ4K7yobrrFfsT6?=
 =?us-ascii?Q?n7hdCc/e/W1xoGeDh1xuKJ/lLxvSgqjWgzMhxUFBJf93Ws1WGIyGTkGNKomB?=
 =?us-ascii?Q?IIAT1Ms+dZ8ZWsljtnJw5BwBzLeyofWkz/G1gITOS1tpUPSl3KKtKFHtILBF?=
 =?us-ascii?Q?fJrog1mqgtgNjUog2APrpwQwrZ6i4S1AoPbXDkyvag1sXgJxSTpXyXGFLXNj?=
 =?us-ascii?Q?Yp2n1B4mpQpsw2edFXenXHXGd/sGSm9jdxmz71wKoPqent7rANckoP71Wip7?=
 =?us-ascii?Q?zjp6z3MDbKF3D0YtvT176kbNNTqiYr95b3BhThVYoihpJBkILzBBphvMYk46?=
 =?us-ascii?Q?FaiaSJZ+WzUYNIKhI+N4rfGAw+CY+YUaRwQ6RjI+0tkhZb4SOgJtntKnYNA7?=
 =?us-ascii?Q?McEh38iNmGtaOVcyIMGbSIaV02G6WCPzPIp01GAmN964xzed6uvgxNgMAcar?=
 =?us-ascii?Q?bw6I/EQ1GRYndxdFCk5o8lMATxHGT04tz5vfXCSh6lJzBW2bYjiqv7++X0Od?=
 =?us-ascii?Q?I8fwRxhCgdltn6KcMA3GPrRmTx1KyHdyJc6l4x9iIWMRIKvOL9m9xnioEax+?=
 =?us-ascii?Q?rmjB/7QFM54qixXLzLowWukumwlyIVY5mKBY+GmKocuqZLYW1qRmglc2eQHf?=
 =?us-ascii?Q?Xv7CshLF+Anzz+DeSQxV/HPWxsLnNYWtTMRqNv9XvuI+IfPQajbcSHFM3Snv?=
 =?us-ascii?Q?pgxvJzUenIPrA8EyRXgN3on5x15tvG2Nb5P2hbpETKBdwJhCyppG2BjWNxQq?=
 =?us-ascii?Q?ZN+IQ2OeNJ/gNMsAHnurGwCNcJ8UBrRIwz7Jx0TdYgswGjocYb3S6VDjY8St?=
 =?us-ascii?Q?vwefaw+9vJQcYemfhS0K6Ju/2TnTrnQniYZLFkaOahexFyh7T3tPPPPQdi98?=
 =?us-ascii?Q?ilWCg7alAkzheBslzT539vae1mb2Wd6oOBG6h/FhKttIWIWoj6v6+g7GCHog?=
 =?us-ascii?Q?cPLoN4qKAkafZOsblFqxBZa39sd0mF7jVLB1VcQjX4OXhVID4/6A+c5/ty6X?=
 =?us-ascii?Q?gBs7mcQJf5b4qDU1NyJrrbM2ip0xq2Qtpo+of3CoU+yI4IkC2612NH5yp/Ki?=
 =?us-ascii?Q?6cLxBffbb+2ua5QnXkVcxmLM6jbt0QeVw41YcvBMOHTzlHj6YIr+S4Kokyew?=
 =?us-ascii?Q?m7xDzsHeQxC7xhcIddOAokuJCvlq7jjR9UvYeB0YthbOni0Y7LVi9zCYvf8B?=
 =?us-ascii?Q?GgXhh/KAFA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339470f6-4153-45e6-cb10-08da2ec7bd25
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 18:47:43.2773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OXrx2ZzhgRCW2eE/7jgKV6lbqCVjB3QbddMaxpF3Gk9qR8FPDU7qidiId/nGGe47cYhuxoFm6DlTc5eziv2j1E3uD4pwpioecVIWik0SA30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3704
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
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>We're supposed to list the supplies in the dt bindings but there are none =
in
>the eDP PHY bindings.
>
>Looking at the driver in Linux, I can see that there seem to be two releva=
nt
>supplies: "vdda-phy" and "vdda-pll". Let's add those to the bindings.
>
>NOTE: from looking at the Qualcomm datasheet for sc7280, it's not
>immediately clear how to figure out how to fill in these supplies. The onl=
y two
>eDP related supplies are simply described as "power for eDP 0.9V circuits"=
 and
>"power for eDP 1.2V circuits". From guessing and from comparing how a
>similar PHY is hooked up on other similar Qualcomm boards, I'll make the
>educated guess that the 1.2V supply goes to "vdda-phy" and the 0.9V supply
>goes to "vdda-pll" and I'll use that in the example here.
>
>Signed-off-by: Douglas Anderson <dianders@chromium.org>
>---
>
> Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>index a5850ff529f8..cf9e9b8011cb 100644
>--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>@@ -41,6 +41,9 @@ properties:
>   "#phy-cells":
>     const: 0
>
>+  vdda-phy-supply: true
>+  vdda-pll-supply: true
>+
> required:
>   - compatible
>   - reg
>@@ -65,5 +68,8 @@ examples:
>
>       #clock-cells =3D <1>;
>       #phy-cells =3D <0>;
>+
>+      vdda-phy-supply =3D <&vdd_a_edp_0_1p2>;
>+      vdda-pll-supply =3D <&vdd_a_edp_0_0p9>;
>     };
> ...
>--
>2.36.0.rc2.479.g8af0fa9b8e-goog

Reviewed-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
