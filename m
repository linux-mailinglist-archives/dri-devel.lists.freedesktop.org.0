Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8043D578DC1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 00:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8E1112AF5;
	Mon, 18 Jul 2022 22:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5628 seconds by postgrey-1.36 at gabe;
 Mon, 18 Jul 2022 22:54:48 UTC
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE580112874
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 22:54:47 +0000 (UTC)
Date: Mon, 18 Jul 2022 22:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1658184885; x=1658444085;
 bh=R+gGEgzBfA26wb5LKyfpT3CyRfV04B+UXLwpeJX+x8o=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=S1/XXb5rwzH1XTAKmZ1RzVd2me0eOCi4KtmjpqQeF3yykbr3XpduH7+UxETcS7lrF
 ujarFkg8SJdqB2DTCOx5GZ58K1uK4Y21KocF+kuecUMQ+itwrPPNSBvJPfDpYilJD7
 nV3IlFcnPk/TvmcEISCYCajzS8iiH2sRdyaOjqwM=
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Kalle Valo <kvalo@kernel.org>
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: add sdm845-google-blueline (Pixel 3)
Message-ID: <41a8cd51-f808-4fa2-b9b1-5c04c2aec7c0@connolly.tech>
In-Reply-To: <d8f24aca-2cdf-413f-2b30-ad41b81be1a5@linaro.org>
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-3-caleb@connolly.tech>
 <d8f24aca-2cdf-413f-2b30-ad41b81be1a5@linaro.org>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: Amit Pundir <amit.pundir@linaro.org>, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18/07/2022 23:13, Dmitry Baryshkov wrote:
> On 19/07/2022 00:30, Caleb Connolly wrote:
>> From: Amit Pundir <amit.pundir@linaro.org>
>>
>> This adds an initial dts for the Blueline (Pixel 3). Supported
>> functionality includes display, Debug UART, UFS, USB-C (peripheral), WiF=
i,
>> Bluetooth and modem.
>>
>> Bootloader compatible board and msm IDs are needed for the kernel to boo=
t
>> with Pixel3 bootloader, so those are added.
>>
>> GPIOs 0 through 3 and 81 through 84 are configured to not be accessible
>> from the application CPUs, so we mark them as reserved to allow the Pixe=
l 3
>> to boot.
>>
>> The reserved-memory locations where obtained from downstream using
>> kernel logs:
>> https://gist.github.com/calebccff/090d10bfac3cb9e9bd98dda30b054c96
>>
>> The rmtfs region is allocated with UIO, making it technically "dynamic".
>> It's address and size can be read from sysfs:
>>
>> blueline:/ # cat /sys/class/uio/uio0/name
>> rmtfs
>> at /sys/class/uio/uio0/maps/map0/addr
>> 0x00000000f2701000
>> blueline:/ # cat /sys/class/uio/uio0/maps/map0/size
>> 0x0000000000200000
>>
>> Like the OnePlus 6, it needs 1kB reserved on either side of the rmtfs
>> memory to workaround some XPU bug which would otherwise cause erroneous
>> XPU violations when accessing the rmtfs_mem region.
>>
>> For wifi, the pixel 3 reports a board-id of 0xFF, and downstream
>> only includes a single bdwlan file. The qcom,ath10k-calibration-variant
>> property is set to ensure that the correct calibration data is used.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> [AmitP: Cherry-picked and refactored from Bjorn's db845c dts
>>           ("arm64: dts: qcom: Add Dragonboard 845c") https://lkml.org/lk=
ml/2019/6/6/7]
>> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>> [sumits: merged commits to add board and msm ids, gpio range reservation=
,
>>     ufs device-reset gpio and adaptation to v5.5+ changes]
>> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>> [vinod: Add display nodes]
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> [caleb: remove db845c bits, cleanup, add reserved-memory for modem/wifi]
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>
> Thanks for your patch, few minor items to improve.
>
>> ---
>>    arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>    .../boot/dts/qcom/sdm845-google-blueline.dts  | 652 +++++++++++++++++=
+
>>    2 files changed, 653 insertions(+)
>>    create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dt=
s
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qco=
m/Makefile
>> index 2f8aec2cc6db..c151e17e6eb7 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -100,6 +100,7 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-cheza-r1.dtb
>>    dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-cheza-r2.dtb
>>    dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-cheza-r3.dtb
>>    dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-db845c.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-google-blueline.dtb
>>    dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-mtp.dtb
>>    dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-oneplus-enchilada.dtb
>>    dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-oneplus-fajita.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/=
arm64/boot/dts/qcom/sdm845-google-blueline.dts
>> new file mode 100644
>> index 000000000000..dec979ad9209
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
>> @@ -0,0 +1,652 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/dma/qcom-gpi.h>
>> +#include <dt-bindings/input/linux-event-codes.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +#include "sdm845.dtsi"
>> +#include "pm8998.dtsi"
>> +#include "pmi8998.dtsi"
>> +
>> +/delete-node/ &mpss_region;
>> +/delete-node/ &venus_mem;
>> +/delete-node/ &cdsp_mem;
>> +/delete-node/ &mba_region;
>> +/delete-node/ &slpi_mem;
>> +/delete-node/ &spss_mem;
>> +/delete-node/ &rmtfs_mem;
>> +
>> +/ {
>> +=09model =3D "Google Pixel 3";
>> +=09compatible =3D "google,blueline", "qcom,sdm845";
>> +=09qcom,board-id =3D <0x00021505 0>;
>> +=09qcom,msm-id =3D <321 0x20001>;
>> +
>> +=09aliases {
>> +=09=09serial0 =3D &uart9;
>> +=09=09serial1 =3D &uart6;
>> +=09};
>> +
>> +=09chosen {
>> +=09=09stdout-path =3D "serial0:115200n8";
>> +=09};
>> +
>> +=09volume-keys {
>> +=09=09compatible =3D "gpio-keys";
>> +=09=09label =3D "Volume keys";
>> +=09=09autorepeat;
>> +
>> +=09=09pinctrl-names =3D "default";
>> +=09=09pinctrl-0 =3D <&volume_up_gpio>;
>> +
>> +=09=09vol-up {
>> +=09=09=09label =3D "Volume Up";
>> +=09=09=09linux,code =3D <KEY_VOLUMEUP>;
>> +=09=09=09gpios =3D <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
>> +=09=09=09debounce-interval =3D <15>;
>> +=09=09};
>> +=09};
>> +
>> +=09reserved-memory {
>> +=09=09#address-cells =3D <2>;
>> +=09=09#size-cells =3D <2>;
>> +=09=09ranges;
>
> These properties are already part of the sdm845.dtsi, so no need to have
> them here.
>
>> +
>> +=09=09mpss_region: memory@8e000000 {
>> +=09=09=09reg =3D <0 0x8e000000 0 0x9800000>;
>> +=09=09=09no-map;
>> +=09=09};
>> +
>> +=09=09venus_mem: venus@97800000 {
>> +=09=09=09reg =3D <0 0x97800000 0 0x500000>;
>> +=09=09=09no-map;
>> +=09=09};
>> +
>> +=09=09cdsp_mem: cdsp-mem@97D00000 {
>> +=09=09=09reg =3D <0 0x97D00000 0 0x800000>;
>> +=09=09=09no-map;
>> +=09=09};
>> +
>> +=09=09mba_region: mba@98500000 {
>> +=09=09=09reg =3D <0 0x98500000 0 0x200000>;
>> +=09=09=09no-map;
>> +=09=09};
>> +
>> +=09=09slpi_mem: slpi@98700000 {
>> +=09=09=09reg =3D <0 0x98700000 0 0x1400000>;
>> +=09=09=09no-map;
>> +=09=09};
>> +
>> +=09=09spss_mem: spss@99B00000 {
>> +=09=09=09reg =3D <0 0x99B00000 0 0x100000>;
>> +=09=09=09no-map;
>> +=09=09};
>> +
>> +=09=09/* rmtfs lower guard */
>> +=09=09memory@f2700000 {
>> +=09=09=09reg =3D <0 0xf2700000 0 0x1000>;
>> +=09=09=09no-map;
>> +=09=09};
>> +
>> +=09=09rmtfs_mem: memory@f2701000 {
>> +=09=09=09compatible =3D "qcom,rmtfs-mem";
>> +=09=09=09reg =3D <0 0xf2701000 0 0x200000>;
>> +=09=09=09no-map;
>> +
>> +=09=09=09qcom,client-id =3D <1>;
>> +=09=09=09qcom,vmid =3D <15>;
>> +=09=09};
>> +
>> +=09=09/* rmtfs upper guard */
>> +=09=09memory@f2901000 {
>> +=09=09=09reg =3D <0 0xf2901000 0 0x1000>;
>> +=09=09=09no-map;
>> +=09=09};
>> +=09};
>> +
>> +=09vph_pwr: vph-pwr-regulator {
>> +=09=09compatible =3D "regulator-fixed";
>> +=09=09regulator-name =3D "vph_pwr";
>> +=09=09regulator-min-microvolt =3D <3700000>;
>> +=09=09regulator-max-microvolt =3D <3700000>;
>> +=09};
>> +
>> +=09vreg_s4a_1p8: vreg-s4a-1p8 {
>> +=09=09compatible =3D "regulator-fixed";
>> +=09=09regulator-name =3D "vreg_s4a_1p8";
>> +
>> +=09=09regulator-min-microvolt =3D <1800000>;
>> +=09=09regulator-max-microvolt =3D <1800000>;
>> +=09=09regulator-always-on;
>> +=09=09regulator-boot-on;
>> +
>> +=09=09vin-supply =3D <&vph_pwr>;
>> +=09};
>> +};
>> +
>> +&adsp_pas {
>> +=09status =3D "okay";
>> +
>> +=09firmware-name =3D "qcom/sdm845/pixel3/adsp.mbn";
>
> What about using "qcom/sdm845/blueline/adsp.mbn" instead?
>
> Bjorn, Amit?
I haven't verified it, but I'd assume that the firmware for bits like
the remoteprocs are the same between the pixel 3 and 3 XL, hence using a
common name (same as the approach taken on the OnePlus 6/6T)
>
>> +};
>> +
>> +&apps_rsc {
>> +=09pm8998-rpmh-regulators {
>> +=09=09compatible =3D "qcom,pm8998-rpmh-regulators";
>> +=09=09qcom,pmic-id =3D "a";
>> +=09=09vdd-s1-supply =3D <&vph_pwr>;
>> +=09=09vdd-s2-supply =3D <&vph_pwr>;
>> +=09=09vdd-s3-supply =3D <&vph_pwr>;
>> +=09=09vdd-s4-supply =3D <&vph_pwr>;
>> +=09=09vdd-s5-supply =3D <&vph_pwr>;
>> +=09=09vdd-s6-supply =3D <&vph_pwr>;
>> +=09=09vdd-s7-supply =3D <&vph_pwr>;
>> +=09=09vdd-s8-supply =3D <&vph_pwr>;
>> +=09=09vdd-s9-supply =3D <&vph_pwr>;
>> +=09=09vdd-s10-supply =3D <&vph_pwr>;
>> +=09=09vdd-s11-supply =3D <&vph_pwr>;
>> +=09=09vdd-s12-supply =3D <&vph_pwr>;
>> +=09=09vdd-s13-supply =3D <&vph_pwr>;
>> +=09=09vdd-l1-l27-supply =3D <&vreg_s7a_1p025>;
>> +=09=09vdd-l2-l8-l17-supply =3D <&vreg_s3a_1p35>;
>> +=09=09vdd-l3-l11-supply =3D <&vreg_s7a_1p025>;
>> +=09=09vdd-l4-l5-supply =3D <&vreg_s7a_1p025>;
>> +=09=09vdd-l6-supply =3D <&vph_pwr>;
>> +=09=09vdd-l7-l12-l14-l15-supply =3D <&vreg_s5a_2p04>;
>> +=09=09vdd-l9-supply =3D <&vreg_bob>;
>> +=09=09vdd-l10-l23-l25-supply =3D <&vreg_bob>;
>> +=09=09vdd-l13-l19-l21-supply =3D <&vreg_bob>;
>> +=09=09vdd-l16-l28-supply =3D <&vreg_bob>;
>> +=09=09vdd-l18-l22-supply =3D <&vreg_bob>;
>> +=09=09vdd-l20-l24-supply =3D <&vreg_bob>;
>> +=09=09vdd-l26-supply =3D <&vreg_s3a_1p35>;
>> +=09=09vin-lvs-1-2-supply =3D <&vreg_s4a_1p8>;
>> +
>> +=09=09vreg_s3a_1p35: smps3 {
>> +=09=09=09regulator-min-microvolt =3D <1352000>;
>> +=09=09=09regulator-max-microvolt =3D <1352000>;
>> +=09=09};
>> +
>> +=09=09vreg_s5a_2p04: smps5 {
>> +=09=09=09regulator-min-microvolt =3D <1904000>;
>> +=09=09=09regulator-max-microvolt =3D <2040000>;
>> +=09=09};
>> +
>> +=09=09vreg_s7a_1p025: smps7 {
>> +=09=09=09regulator-min-microvolt =3D <900000>;
>> +=09=09=09regulator-max-microvolt =3D <1028000>;
>> +=09=09};
>> +
>> +=09=09vdda_mipi_dsi0_pll:
>
> Do we need this alias?
No, will drop it.
>
>> +=09=09vreg_l1a_0p875: ldo1 {
>> +=09=09=09regulator-min-microvolt =3D <880000>;
>> +=09=09=09regulator-max-microvolt =3D <880000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09=09regulator-boot-on;
>> +=09=09};
>> +
>> +=09=09vreg_l5a_0p8: ldo5 {
>> +=09=09=09regulator-min-microvolt =3D <800000>;
>> +=09=09=09regulator-max-microvolt =3D <800000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vreg_l12a_1p8: ldo12 {
>> +=09=09=09regulator-min-microvolt =3D <1800000>;
>> +=09=09=09regulator-max-microvolt =3D <1800000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vreg_l7a_1p8: ldo7 {
>> +=09=09=09regulator-min-microvolt =3D <1800000>;
>> +=09=09=09regulator-max-microvolt =3D <1800000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vreg_l13a_2p95: ldo13 {
>> +=09=09=09regulator-min-microvolt =3D <1800000>;
>> +=09=09=09regulator-max-microvolt =3D <2960000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vreg_l14a_1p88: ldo14 {
>> +=09=09=09regulator-min-microvolt =3D <1800000>;
>> +=09=09=09regulator-max-microvolt =3D <1800000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09=09regulator-boot-on;
>> +=09=09=09/*
>> +=09=09=09 * We can't properly bring the panel back if it gets turned of=
f
>> +=09=09=09 * so keep it's regulators always on for now.
>> +=09=09=09 */
>
> Any idea, what is the issue here? Do you have the datasheet for the panel=
?
As Marijn just mentioned on IRC, the driver right now only calls
drm_dsc_pps_payload_pack() but doesn't actually send it. I haven't
investigated this myself but I'll look into it.

Unfortunately no datasheet afaik, they tend to be pretty elusive. The
things I would do for a phone panel datasheet...
>
>> +=09=09=09regulator-always-on;
>> +=09=09};
>> +
>> +=09=09vreg_l17a_1p3: ldo17 {
>> +=09=09=09regulator-min-microvolt =3D <1304000>;
>> +=09=09=09regulator-max-microvolt =3D <1304000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vreg_l19a_3p3: ldo19 {
>> +=09=09=09regulator-min-microvolt =3D <3300000>;
>> +=09=09=09regulator-max-microvolt =3D <3312000>;
>> +=09=09=09qcom,init-voltage =3D <3300000>;
>> +=09=09=09qcom,initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09=09/*
>> +=09=09=09 * The touchscreen needs this to be 3.3v, which is apparently
>> +=09=09=09 * quite close to the hardware limit for this LDO (3.312v)
>> +=09=09=09 * It must be kept in high power mode to prevent TS brownouts
>> +=09=09=09 */
>> +=09=09=09regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vreg_l20a_2p95: ldo20 {
>> +=09=09=09regulator-min-microvolt =3D <2960000>;
>> +=09=09=09regulator-max-microvolt =3D <2968000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vreg_l21a_2p95: ldo21 {
>> +=09=09=09regulator-min-microvolt =3D <2960000>;
>> +=09=09=09regulator-max-microvolt =3D <2968000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vreg_l24a_3p075: ldo24 {
>> +=09=09=09regulator-min-microvolt =3D <3088000>;
>> +=09=09=09regulator-max-microvolt =3D <3088000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vreg_l25a_3p3: ldo25 {
>> +=09=09=09regulator-min-microvolt =3D <3300000>;
>> +=09=09=09regulator-max-microvolt =3D <3312000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09};
>> +
>> +=09=09vdda_mipi_dsi0_1p2:
>
> Do we need this alias?
Ack
>
>> +=09=09vreg_l26a_1p2: ldo26 {
>> +=09=09=09regulator-min-microvolt =3D <1200000>;
>> +=09=09=09regulator-max-microvolt =3D <1200000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09=09regulator-boot-on;
>> +=09=09};
>> +
>> +=09=09vreg_l28a_3p0: ldo28 {
>> +=09=09=09regulator-min-microvolt =3D <2856000>;
>> +=09=09=09regulator-max-microvolt =3D <3008000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +=09=09=09regulator-boot-on;
>> +=09=09=09/*
>> +=09=09=09 * We can't properly bring the panel back if it gets turned of=
f
>> +=09=09=09 * so keep it's regulators always on for now.
>> +=09=09=09 */
>> +=09=09=09regulator-always-on;
>> +=09=09};
>> +=09};
>> +
>> +=09pmi8998-rpmh-regulators {
>> +=09=09compatible =3D "qcom,pmi8998-rpmh-regulators";
>> +=09=09qcom,pmic-id =3D "b";
>> +
>> +=09=09vdd-bob-supply =3D <&vph_pwr>;
>> +
>> +=09=09vreg_bob: bob {
>> +=09=09=09regulator-min-microvolt =3D <3312000>;
>> +=09=09=09regulator-max-microvolt =3D <3600000>;
>> +=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_AUTO>;
>> +=09=09=09regulator-allow-bypass;
>> +=09=09};
>> +=09};
>> +
>> +=09pm8005-rpmh-regulators {
>> +=09=09compatible =3D "qcom,pm8005-rpmh-regulators";
>> +=09=09qcom,pmic-id =3D "c";
>> +
>> +=09=09vdd-s1-supply =3D <&vph_pwr>;
>> +=09=09vdd-s2-supply =3D <&vph_pwr>;
>> +=09=09vdd-s3-supply =3D <&vph_pwr>;
>> +=09=09vdd-s4-supply =3D <&vph_pwr>;
>> +
>> +=09=09vreg_s3c_0p6: smps3 {
>> +=09=09=09regulator-min-microvolt =3D <600000>;
>> +=09=09=09regulator-max-microvolt =3D <600000>;
>> +=09=09};
>> +=09};
>> +};
>> +
>> +&cdsp_pas {
>> +=09status =3D "okay";
>> +=09firmware-name =3D "qcom/sdm845/pixel3/cdsp.mbn";
>> +};
>> +
>> +&dsi0 {
>> +=09status =3D "okay";
>> +=09vdda-supply =3D <&vdda_mipi_dsi0_1p2>;
>> +
>> +=09ports {
>> +=09=09port@1 {
>> +=09=09=09endpoint {
>> +=09=09=09=09remote-endpoint =3D <&lg_sw43408_in_0>;
>> +=09=09=09=09data-lanes =3D <0 1 2 3>;
>> +=09=09=09};
>> +=09=09};
>> +=09};
>> +
>> +=09panel@0 {
>> +=09=09compatible =3D "lg,sw43408";
>> +=09=09reg =3D <0>;
>> +
>> +=09=09vddi-supply =3D <&vreg_l14a_1p88>;
>> +=09=09vpnl-supply =3D <&vreg_l28a_3p0>;
>> +
>> +=09=09reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_LOW>;
>> +
>> +=09=09pinctrl-names =3D "default";
>> +=09=09pinctrl-0 =3D <&panel_reset_pins &panel_te_pin &panel_pmgpio_pins=
>;
>> +
>> +=09=09ports {
>> +=09=09=09#address-cells =3D <1>;
>> +=09=09=09#size-cells =3D <0>;
>> +
>> +=09=09=09port@0 {
>> +=09=09=09=09reg =3D <0>;
>> +=09=09=09=09lg_sw43408_in_0: endpoint {
>> +=09=09=09=09=09remote-endpoint =3D <&dsi0_out>;
>> +=09=09=09=09};
>> +=09=09=09};
>> +=09=09};
>> +=09};
>> +};
>> +
>> +&dsi0_out {
>> +=09remote-endpoint =3D <&lg_sw43408_in_0>;
>> +=09data-lanes =3D <0 1 2 3>;
>> +};
>> +
>> +&dsi0_phy {
>> +=09status =3D "okay";
>> +=09vdds-supply =3D <&vdda_mipi_dsi0_pll>;
>> +};
>> +
>> +&gcc {
>> +=09protected-clocks =3D <GCC_QSPI_CORE_CLK>,
>> +=09=09=09   <GCC_QSPI_CORE_CLK_SRC>,
>> +=09=09=09   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
>> +};
>> +
>> +&gmu {
>> +=09status =3D "okay";
>> +};
>> +
>> +&gpi_dma0 {
>> +=09status =3D "okay";
>> +};
>> +
>> +&gpu {
>> +=09status =3D "okay";
>> +
>> +=09zap-shader {
>> +=09=09memory-region =3D <&gpu_mem>;
>> +=09=09firmware-name =3D "qcom/sdm845/pixel3/a630_zap.mbn";
>> +=09};
>> +};
>> +
>> +&ipa {
>> +=09status =3D "okay";
>> +
>> +=09firmware-name =3D "qcom/sdm845/pixel3/ipa_fws.mbn";
>> +};
>> +
>> +&mss_pil {
>> +=09status =3D "okay";
>> +=09firmware-name =3D "qcom/sdm845/pixel3/mba.mbn", "qcom/sdm845/pixel3/=
modem.mbn";
>> +};
>> +
>> +&mdss {
>> +=09status =3D "okay";
>> +};
>> +
>> +&mdss_mdp {
>> +=09status =3D "okay";
>> +};
>
> Not necessary, it is a default state since the commit 4a5622c1d975
> ("arm64: dts: qcom: sdm845: Don't disable MDP explicitly")
thanks, will drop
>
>> +
>> +&pm8998_gpio {
>> +=09volume_up_gpio: vol-up-active {
>> +=09=09pins =3D "gpio6";
>> +=09=09function =3D "normal";
>> +=09=09input-enable;
>> +=09=09bias-pull-up;
>> +=09=09qcom,drive-strength =3D <0>;
>> +=09};
>> +
>> +=09panel_pmgpio_pins: panel-pmgpio-active {
>> +=09=09pins =3D "gpio2", "gpio5";
>> +=09=09function =3D "normal";
>> +=09=09input-enable;
>> +=09=09bias-disable;
>> +=09=09power-source =3D <0>;
>> +=09};
>> +};
>> +
>> +&pm8998_pon {
>> +=09resin {
>> +=09=09compatible =3D "qcom,pm8941-resin";
>> +=09=09interrupts =3D <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
>> +=09=09debounce =3D <15625>;
>> +=09=09bias-pull-up;
>> +=09=09linux,code =3D <KEY_VOLUMEDOWN>;
>> +=09};
>
> Please move the (disabled, labelled) resin device to pm8998.dtsi and
> just add status =3D "okay" here.
OK, will do.
>
>> +};
>> +
>> +&qupv3_id_0 {
>> +=09status =3D "okay";
>> +};
>> +
>> +&qupv3_id_1 {
>> +=09status =3D "okay";
>> +};
>> +
>> +&qup_uart6_default {
>> +=09pinmux {
>> +=09=09pins =3D "gpio45", "gpio46", "gpio47", "gpio48";
>> +=09=09function =3D "qup6";
>> +=09};
>> +
>> +=09cts {
>> +=09=09pins =3D "gpio45";
>> +=09=09bias-disable;
>> +=09};
>> +
>> +=09rts-tx {
>> +=09=09pins =3D "gpio46", "gpio47";
>> +=09=09drive-strength =3D <2>;
>> +=09=09bias-disable;
>> +=09};
>> +
>> +=09rx {
>> +=09=09pins =3D "gpio48";
>> +=09=09bias-pull-up;
>> +=09};
>> +};
>> +
>> +&qup_uart9_default {
>> +=09pinconf-tx {
>> +=09=09pins =3D "gpio4";
>> +=09=09drive-strength =3D <2>;
>> +=09=09bias-disable;
>> +=09};
>> +
>> +=09pinconf-rx {
>> +=09=09pins =3D "gpio5";
>> +=09=09drive-strength =3D <2>;
>> +=09=09bias-pull-up;
>> +=09};
>> +};
>> +
>> +&tlmm {
>> +=09gpio-reserved-ranges =3D <0 4>, <81 4>;
>> +
>> +=09panel_te_pin: panel-te {
>> +=09=09mux {
>> +=09=09=09pins =3D "gpio12";
>> +=09=09=09function =3D "mdp_vsync";
>> +=09=09=09drive-strength =3D <2>;
>> +=09=09=09bias-disable;
>> +=09=09=09input-enable;
>> +=09=09};
>> +=09};
>> +
>> +=09panel_reset_pins: panel-active {
>> +=09=09mux {
>> +=09=09=09pins =3D "gpio6", "gpio52";
>> +=09=09=09function =3D "gpio";
>> +=09=09=09drive-strength =3D <8>;
>> +=09=09=09bias-disable =3D <0>;
>> +=09=09};
>> +=09};
>> +
>> +=09panel_suspend: panel-suspend {
>> +=09=09mux {
>> +=09=09=09pins =3D "gpio6", "gpio52";
>> +=09=09=09function =3D "gpio";
>> +=09=09=09drive-strength =3D <2>;
>> +=09=09=09bias-pull-down;
>> +=09=09};
>> +=09};
>> +
>> +=09touchscreen_reset: ts-reset {
>> +=09=09mux {
>> +=09=09=09pins =3D "gpio99";
>> +=09=09=09function =3D "gpio";
>> +=09=09=09drive-strength =3D <8>;
>> +=09=09=09bias-pull-up;
>> +=09=09=09//output-high;
>
> debug, can be removed?
>
>> +=09=09};
>> +=09};
>> +
>> +=09touchscreen_pins: ts-pins {
>> +=09=09mux {
>> +=09=09=09pins =3D "gpio125";
>> +=09=09=09function =3D "gpio";
>> +=09=09=09drive-strength =3D <2>;
>> +=09=09=09bias-disable;
>> +=09=09};
>> +=09};
>> +
>> +=09touchscreen_i2c_pins: qup-i2c2-gpio {
>> +=09=09pins =3D "gpio27", "gpio28";
>> +=09=09function =3D "gpio";
>> +
>> +=09=09drive-strength =3D <2>;
>> +=09=09bias-disable;
>> +=09};
>> +};
>> +
>> +&uart6 {
>> +=09status =3D "okay";
>> +
>> +=09bluetooth {
>> +=09=09compatible =3D "qcom,wcn3990-bt";
>> +
>> +=09=09vddio-supply =3D <&vreg_s4a_1p8>;
>> +=09=09vddxo-supply =3D <&vreg_l7a_1p8>;
>> +=09=09vddrf-supply =3D <&vreg_l17a_1p3>;
>> +=09=09vddch0-supply =3D <&vreg_l25a_3p3>;
>> +=09=09max-speed =3D <3200000>;
>> +=09};
>> +};
>> +
>> +&uart9 {
>> +=09status =3D "okay";
>> +};
>> +
>> +&usb_1 {
>> +=09status =3D "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +=09dr_mode =3D "peripheral";
>> +};
>> +
>> +&usb_1_hsphy {
>> +=09status =3D "okay";
>> +
>> +=09vdd-supply =3D <&vreg_l1a_0p875>;
>> +=09vdda-pll-supply =3D <&vreg_l12a_1p8>;
>> +=09vdda-phy-dpdm-supply =3D <&vreg_l24a_3p075>;
>> +
>> +=09qcom,imp-res-offset-value =3D <8>;
>> +=09qcom,hstx-trim-value =3D <QUSB2_V2_HSTX_TRIM_21_6_MA>;
>> +=09qcom,preemphasis-level =3D <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
>> +=09qcom,preemphasis-width =3D <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
>> +};
>> +
>> +&usb_1_qmpphy {
>> +=09status =3D "okay";
>> +
>> +=09vdda-phy-supply =3D <&vreg_l26a_1p2>;
>> +=09vdda-pll-supply =3D <&vreg_l1a_0p875>;
>> +};
>> +
>> +&usb_2 {
>> +=09status =3D "okay";
>> +};
>> +
>> +&usb_2_dwc3 {
>> +=09dr_mode =3D "host";
>> +};
>> +
>> +&usb_2_hsphy {
>> +=09status =3D "okay";
>> +
>> +=09vdd-supply =3D <&vreg_l1a_0p875>;
>> +=09vdda-pll-supply =3D <&vreg_l12a_1p8>;
>> +=09vdda-phy-dpdm-supply =3D <&vreg_l24a_3p075>;
>> +
>> +=09qcom,imp-res-offset-value =3D <8>;
>> +=09qcom,hstx-trim-value =3D <QUSB2_V2_HSTX_TRIM_22_8_MA>;
>> +};
>> +
>> +&usb_2_qmpphy {
>> +=09status =3D "okay";
>> +
>> +=09vdda-phy-supply =3D <&vreg_l26a_1p2>;
>> +=09vdda-pll-supply =3D <&vreg_l1a_0p875>;
>> +};
>> +
>> +&ufs_mem_hc {
>> +=09status =3D "okay";
>> +
>> +=09reset-gpios =3D <&tlmm 150 GPIO_ACTIVE_LOW>;
>> +
>> +=09vcc-supply =3D <&vreg_l20a_2p95>;
>> +=09vcc-max-microamp =3D <800000>;
>> +};
>> +
>> +&ufs_mem_phy {
>> +=09status =3D "okay";
>> +
>> +=09vdda-phy-supply =3D <&vreg_l1a_0p875>;
>> +=09vdda-pll-supply =3D <&vreg_l26a_1p2>;
>> +};
>> +
>> +&venus {
>> +=09status =3D "okay";
>> +=09firmware-name =3D "qcom/sdm845/oneplus6/venus.mbn";
>
> Why are you using the oneplus6 here?
Oops! Will fix that.
>
>> +};
>> +
>> +&wifi {
>> +=09status =3D "okay";
>> +
>> +=09vdd-0.8-cx-mx-supply =3D <&vreg_l5a_0p8>;
>> +=09vdd-1.8-xo-supply =3D <&vreg_l7a_1p8>;
>> +=09vdd-1.3-rfa-supply =3D <&vreg_l17a_1p3>;
>> +=09vdd-3.3-ch0-supply =3D <&vreg_l25a_3p3>;
>> +
>> +=09qcom,snoc-host-cap-8bit-quirk;
>> +=09qcom,ath10k-calibration-variant =3D "google_blueline";
>
> Ideally Kalle Valo should bless this string, added him to the Cc list.
> Could you please submit the board file to the ath10k (see [1] for the
> description and [2] for an example).
Sure will do.
>
>
> [1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles
> [2]
> https://lore.kernel.org/ath10k/CAA8EJpphUrxr5gtW0=3D-tZh-DrKXmHkfFxWMvYRp=
TUGuCesGCbw@mail.gmail.com/T/#u
>
>> +};
>
Thanks a lot for the review!

Kind Regards,
Caleb
>
> --
> With best wishes
> Dmitry

