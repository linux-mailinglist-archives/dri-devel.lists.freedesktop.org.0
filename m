Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59FC4AEAF4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A8110E38A;
	Wed,  9 Feb 2022 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 09 Feb 2022 07:22:27 UTC
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C105810E38A;
 Wed,  9 Feb 2022 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644391347; x=1644996147;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=39Sb2TxnON5mWWvVSZpa5p12dwGxRjGRlVOCsxXa3+8=;
 b=Cg9tW4S4Y+hmxAPeONGL9HLCdm6B0ZZ7NKU72nW/g5dTC9C2jY79azGz
 gm/x9PH8QaGoDws2kn3XrpiV5JKG2faThA9K4u825z/Sa+zI2cduuA5oa
 6LAqRZRTamszwOxDcOoIXTwjDHA9KLeLoOKawVrni2mFKC4hujuzI2oZ+ o=;
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:15:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cf++3pIm+itXeCKEPCoPDaALZ0nLRGC2J4UvbOcjDnpeEc5WP8EHowucMkeA8xT+FZzSGtFZfymRNYf1ok+uEPMpVsRxK7293zlPZXxVgDqjgn314EXc3/16VMCcbQLZ5NeOg2t8yqtKe8zLOXQPX3UtIGCW+5QznKzxQpqnsyKVaRUFrkDiewo+Sa6vBf7P+/KuAosQ26TCkwNEypFUePjv1hqXgfILnP3zJlbgT0VV5Ozx1gpxg7oTDbjUfePLvSa/aCuZVdYNtwaPgJyBmWuwPv2L+jlFbo4UTpwoN9j2kjouHev4bSlaukz/6Wm/ow5qxwIgrKkb4RxETKtviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39Sb2TxnON5mWWvVSZpa5p12dwGxRjGRlVOCsxXa3+8=;
 b=H/c3JQY7HuDXxJ0ASd0MjPhdABsKVM1pSwXMVvg27lt3O89I+jX3Iimp3FP0G/hPmT6dEyn1iF051hkaxBMTA9Ed1aboB7tAhf0iB1Ut5ZhYUKSUTVHQ++jpTqXJMQu0GQlZWDjlBUhpo40qJTq/btqKcT/L73bTvxxCgEm/9FYZSxbHEMp/jbOpwUjZNHB4PJw2o1WRVYorj4sTDp/zvE8xYfLwgCmyJ6aQJ90WpRR1AcRclYfC8OISzcKHRrnooIbhR0kl6+PqBjN9nUry3i1STE6ZGK1J8B+Dg/dgE6X+ZJcmsVUlSXyd8S5VpC/cM8b67NrAdyCChW40IohKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by DM5PR02MB3147.namprd02.prod.outlook.com (2603:10b6:4:64::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 9 Feb
 2022 07:15:15 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006%3]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 07:15:15 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "Sankeerth
 Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Topic: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Index: AQHYHP9CXGHnyqg4DUy0QOrgphcweKyKVAGAgAB7kDA=
Date: Wed, 9 Feb 2022 07:15:15 +0000
Message-ID: <MW4PR02MB7186BD4BD997059678968DEBE12E9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1644333525-30920-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644333525-30920-3-git-send-email-quic_sbillaka@quicinc.com>
 <YgMCW9GrY6SRteOU@ripper>
In-Reply-To: <YgMCW9GrY6SRteOU@ripper>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a76f0f6d-5821-4767-a32d-08d9eb9bebb8
x-ms-traffictypediagnostic: DM5PR02MB3147:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR02MB3147E0DB9B7471E277CA83C09D2E9@DM5PR02MB3147.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oMMeXQ0CE33Z4/MRKCupJX6TzXlAxFxIoHR/6B2tj3Jb2KAi6FQDGQtGIjhkVJQFWGq2hKPuaPYf72Nb7SuWZtNFOo6PsVZpoHZEilJ4NpXYTrYza7ne/Qy1gqLNYNEYRUwhh23jJZ33dZM5iFvQ5gRsf0wYzsrAGQ9zwdS7HxxuQHacv1deWf//y1K9FHo06h3KO+GfwM9JIi7Ltl7xx1ARramKfSBScKCkg+p4hQRhHT4FWq0KLyrrnygm2ncpp8IoUFksmKZu9PsQ8I3YR3FERDmYB5qcfkNnUajUOfztClnqsvHxk0xflAbXsmirEg8ukYJRtN5j83UeTfDKED9HrvpgTtSPVs2ZTgUioe//h3+QTvRX+FnnjG1emIx9+F0XuV5TuqNwwoJtiRPHivV3FvE5rhvYiCHyEh1xjS02ffRZJIFyHVdCz3h7IUcke7bkJy6hRdQ46yP+WzxAUK3Pd22jELWpUIptl3TuwtbO5cbwWjbS86exPmQesIcB+q0Pqacqii5LJy0V4hw9bR5Ffu8vD7ZJ7PD2yudoLEUi3BCjgWhGZoWL2QxxktDVSLbR+f1mIvuBtEQAG59IO7Hni4FCBc61/hB1ujNsF8kVdPW99SpEBV9tF4him1hzqrfKtgfbFO5woVEg3/HdsiFT3Awz3bv/EUnAdU2DaLKHc0fOihciNbqKClyrgCoHN9sNXiA5gRT6xAE91HKtVaZkaPatGzLHYweMxRFoCrQxKtiNHgGzsJMWQG4gXpx/w4JUQ/oPwDxVwejAJlG4EYacEU7RLZmB5QI1WvuOJBQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(83380400001)(186003)(110136005)(33656002)(26005)(38070700005)(107886003)(55016003)(5660300002)(86362001)(71200400001)(53546011)(9686003)(7696005)(316002)(7416002)(76116006)(66946007)(64756008)(66476007)(66446008)(66556008)(8676002)(8936002)(966005)(6506007)(38100700002)(2906002)(508600001)(122000001)(52536014)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DPQztoyiug20vj6kPUBsSV22TLhTO/jCRE3udBs5HI2jtrtyQ7wSV5E/0tPt?=
 =?us-ascii?Q?slZktXJxW8uRfTTsgGbrYTHpEs/4gUMJYAIMvvDG0bK53ynOpKirZRqoWayl?=
 =?us-ascii?Q?6sC6uMl/9pfUqf1Ksl9GYG5WgDTbgcLDJEjkCPEoKQdEsB+b6Z85cstwkaT0?=
 =?us-ascii?Q?VD8H94HdGHfBYblRYBkqwu1uOFF3hh2fNh/hjJ6oroK61DNp/7DqGMqgJ58p?=
 =?us-ascii?Q?/OAajcw/oA9FU7HDGValn0SZOEOB7LTjm/HEpjr+ISjXJjez03iXOdICfTH9?=
 =?us-ascii?Q?DhYh6xndfwJBPb5cHfTUlk1aWeB57o5CKJ5KewG+JW0M5ny8cvFNa+eHM67D?=
 =?us-ascii?Q?SZxY21eNPXlyhh3ivG0jC0pvNF8jPacdMYT5EUn2mjMI7irmZyQNlwzoCXI8?=
 =?us-ascii?Q?4ZK8NT9Q+kG23T8QkYFrApl2Cb/ec2Vavm8rLq5DoSWN1uNEkUj5Xuq6p/sz?=
 =?us-ascii?Q?TjRsxkl/ysUNktalO9cTjwH7eRtUX4+qNuUQUbB2SKGVnzz+XxPpxYWMfyIP?=
 =?us-ascii?Q?k6zojCsT46Unem5yohpPdkaCHSoGO7nzlYPkY8jaffZG8WeSbcuj/KzCSJCG?=
 =?us-ascii?Q?Dw4fZksKtOcXdLhVjIlI1B01Wf5Fqs3PLQs3UdAKs6Bz1b2YEuUzo0vaMWFx?=
 =?us-ascii?Q?tPcl0khb3rjoYiA1uT0jlLAPWUiYv2xmsUqvvR0mfiMh0kzhB6PKcxIVYzz2?=
 =?us-ascii?Q?e8HGSKhrthBCFMZ6Hw3ED+UiJqbEvPMErDgMAGI1zIuZhxKk1nLxpp941t6s?=
 =?us-ascii?Q?aIVHaQeHwpQP5bpSEpnpfH4k+gFpky3QaF2/VinL82R8eEfwmiLxZUT3MMT1?=
 =?us-ascii?Q?UyXr1AlhNFzitoIFd+M1SCEAkqV3AyesngFkh/VULFJes/16JlvSZiKzE09M?=
 =?us-ascii?Q?Q9tL+kS8dBE3Ebpc+7ZM/rOWOwdrgfIVeHHiUrDQz4aKivgN33S5AtCOUp2f?=
 =?us-ascii?Q?lTEEJYiiFodGk2Hr1AZnD6C/LIaOPUGeGYEhABY5iroifMiH4ylahf9Tp3XD?=
 =?us-ascii?Q?YcXVVAecSYBSGiuDYXNFMeJAAotxx3MQYUEFr3AOxP6KsEvbgJQm8Fg6oZKw?=
 =?us-ascii?Q?J++4BM0W0c9m/+kSWPJ1fnSZ78ktnMRKt+ixDk2JYitNXz7MsvmDt6aANIvF?=
 =?us-ascii?Q?VQyUeCIfwN+0l+wuuGSokpKDM2nvCnz3bTd98/azF/f9zJ0FI0y6dzbQ1q2c?=
 =?us-ascii?Q?OCZAkstc/qNI51PVp1LsJlmk+txpEC8RMnNRr9lME4Y9kV8q8lqp5g6gCvFb?=
 =?us-ascii?Q?SBy2zpeYmw1DZODPol2tpNIxy48EOMjhZGM3zt9R65u69PpbIIQS9iK2bg5G?=
 =?us-ascii?Q?TNyeqJxK7eCTGRj918MP+1ySztGGko9jk6ssLellOmvtbkuEeR5WX820RLS2?=
 =?us-ascii?Q?qDoIDmviwsN01u2c9z2s3kTH/uoi5kjRx0mqz6PkA5/7pqZnx36Ir4os9kXQ?=
 =?us-ascii?Q?ZDwJXByZIQnsrlO80ulhfGOlkBSpIO23nWy3HPrxXknZ43trfGXqYn3iGSvW?=
 =?us-ascii?Q?vTjT4kS8QCQFmjaCe1lU2yqon2ly/d4DYVuP3j+ucjc3ZBceTXxpKnsat2kd?=
 =?us-ascii?Q?g+E+YEIzNQbrAeGibIM7Yxw9xZ0/PpncxAh00lwFy/m/W4nFUQaCZe0j4ijN?=
 =?us-ascii?Q?Kdju8YV+Fj1/EudXyZW9/Aomo82ukl/KQBlNxN0VeJymOGbALi5du2DACJaU?=
 =?us-ascii?Q?iHFzWg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76f0f6d-5821-4767-a32d-08d9eb9bebb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 07:15:15.4809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sAxcEKLbcCQAz1Sh97kgg/VWyyA6dfuKqAFRAKc0ZSaVQRz7p24obFY4w9a/GqJQkYkdo5Ba/g96bv5IIAXOgf9wxNr7mp/0nbg0wYx2FOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3147
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>, "Abhinav Kumar
 \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "agross@kernel.org" <agross@kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 quic_mkrishn <quic_mkrishn@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn,

1. I will change the edp_out label to mdss_edp_out.
2. The "pm8350c_pwm" node is part of the dependent series mentioned in the =
cover letter. Below is the patch for the same:
https://patchwork.kernel.org/project/linux-arm-msm/patch/1637917920-22041-4=
-git-send-email-quic_c_skakit@quicinc.com/
3. I will move the edp_backlight and edp_panel nodes to the root.

Thank you,
Sankeerth

-----Original Message-----
From: Bjorn Andersson <bjorn.andersson@linaro.org>=20
Sent: Wednesday, February 9, 2022 5:23 AM
To: Sankeerth Billakanti (QUIC) <quic_sbillaka@quicinc.com>
Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org; freedre=
no@lists.freedesktop.org; linux-kernel@vger.kernel.org; devicetree@vger.ker=
nel.org; agross@kernel.org; robh+dt@kernel.org; robdclark@gmail.com; seanpa=
ul@chromium.org; swboyd@chromium.org; dianders@chromium.org; krzysztof.kozl=
owski@canonical.com; thierry.reding@gmail.com; sam@ravnborg.org; airlied@li=
nux.ie; daniel@ffwll.ch; quic_kalyant <quic_kalyant@quicinc.com>; Abhinav K=
umar (QUIC) <quic_abhinavk@quicinc.com>; Kuogee Hsieh (QUIC) <quic_khsieh@q=
uicinc.com>; quic_mkrishn <quic_mkrishn@quicinc.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Add support for eDP p=
anel on CRD

On Tue 08 Feb 07:18 PST 2022, Sankeerth Billakanti wrote:

> Enable the eDP display panel support without HPD on sc7280 platform.
>=20
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>=20
> Changes in v2:
>   - sort node references alphabetically
>   - improve readability
>   - move the pwm pinctrl to pwm node
>   - move the regulators to root
>   - define backlight power
>   - remove dummy regulator node
>   - cleanup pinctrl definitions
>=20
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 122 ++++++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    |   2 -
>  2 files changed, 122 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts=20
> b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index e2efbdd..bff2707 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -21,6 +21,34 @@
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	backlight_power: backlight-power {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "backlight_power";
> +
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +
> +		gpio =3D <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&edp_bl_power>;
> +	};
> +
> +	edp_power: edp-power {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "edp_power";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&edp_panel_power>;
> +	};
>  };
> =20
>  &apps_rsc {
> @@ -76,6 +104,42 @@ ap_ts_pen_1v8: &i2c13 {
>  	};
>  };
> =20
> +&edp_out {

Sorry for missing this while merging changes in sc7280.dtsi. But it would b=
e really nice if this was labeled mdss_edp_out instead (or possibly defined=
 within the &mdss_edp node).

Now you will have &edp_out and &dp_out floating around away from the edp an=
d dp nodes...

> +	remote-endpoint =3D <&edp_panel_in>;
> +};
> +
> +&mdss {
> +	status =3D "okay";
> +};
> +
> +&mdss_edp {
> +	status =3D "okay";
> +
> +	vdda-1p2-supply =3D <&vreg_l6b_1p2>;
> +	vdda-0p9-supply =3D <&vreg_l10c_0p8>;
> +};
> +
> +&mdss_edp_phy {
> +	status =3D "okay";
> +
> +	vdda-1p2-supply =3D <&vreg_l6b_1p2>;
> +	vdda-0p9-supply =3D <&vreg_l10c_0p8>;
> +};
> +
> +&mdss_dp {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&dp_hot_plug_det>;
> +	data-lanes =3D <0 1>;
> +	vdda-1p2-supply =3D <&vreg_l6b_1p2>;
> +	vdda-0p9-supply =3D <&vreg_l1b_0p8>;
> +};
> +
> +&mdss_mdp {
> +	status =3D "okay";
> +};
> +
>  &nvme_3v3_regulator {
>  	gpio =3D <&tlmm 51 GPIO_ACTIVE_HIGH>;
>  };
> @@ -84,7 +148,65 @@ ap_ts_pen_1v8: &i2c13 {
>  	pins =3D "gpio51";
>  };
> =20
> +&pm8350c_pwm {

This label doesn't exist, so I won't be able to merge this patch.

> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&edp_bl_pwm>;
> +};
> +
> +&pm8350c_gpios {
> +	edp_bl_power: edp-bl-power {
> +		pins =3D "gpio7";
> +		function =3D "normal";
> +		qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	edp_bl_pwm: edp-bl-pwm {
> +		pins =3D "gpio8";
> +		function =3D "func1";
> +		qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
> +		bias-disable;
> +		output-low;
> +	};
> +};
> +
> +&soc {
> +	edp_backlight: edp-backlight {
> +		compatible =3D "pwm-backlight";

This is not a device on the mmio bus, so it should not love within the &soc=
.

> +
> +		power-supply =3D <&backlight_power>;
> +		pwms =3D <&pm8350c_pwm 3 65535>;
> +	};
> +
> +	edp_panel: edp_panel {

Ditto.

Regards,
Bjorn

> +		compatible =3D "sharp,lq140m1jw46";
> +
> +		power-supply =3D <&edp_power>;
> +		backlight =3D <&edp_backlight>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			port@0 {
> +				reg =3D <0>;
> +				edp_panel_in: endpoint {
> +					remote-endpoint =3D <&edp_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &tlmm {
> +	edp_panel_power: edp-panel-power {
> +		pins =3D "gpio80";
> +		function =3D "gpio";
> +		bias-pull-down;
> +	};
> +
>  	tp_int_odl: tp-int-odl {
>  		pins =3D "gpio7";
>  		function =3D "gpio";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi=20
> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3572399..f8fa716 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3012,8 +3012,6 @@
> =20
>  			mdss_edp: edp@aea0000 {
>  				compatible =3D "qcom,sc7280-edp";
> -				pinctrl-names =3D "default";
> -				pinctrl-0 =3D <&edp_hot_plug_det>;
> =20
>  				reg =3D <0 0xaea0000 0 0x200>,
>  				      <0 0xaea0200 0 0x200>,
> --
> 2.7.4
>=20
