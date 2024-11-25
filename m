Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882B49D8B7D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 18:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE91610E6D2;
	Mon, 25 Nov 2024 17:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="LlO1db+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn2043.outbound.protection.outlook.com [40.92.90.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A15710E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 17:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIGlbs694EyDB/S9XYwLWbDSyQ6lI+Sp3jyI/A5w6UvSDNCoKLON9sfPcWrtKbymAuwRVbdB9rvzknSBPMMots0guUTa4d34OLNREWRKUMInG96QQPDYOMiVQnxUKvX8A1qEEATX8HFipJp4S/J1dRzZVbf/2fwM9yfmVeRjbN9x1/FVolPR2EXMgGuxLR00GpAsEeY5wwOLkMhF4Z1fLzKv3d80p3nOCi0D2NqxNAjLhkt+03YDjDenKuV5KrqdKbinNlcI5WazC9I5Co02zvudFK6TUogL+CCsCFDYzvGwVxU8boqeC5k59iXIfOrH47JA4gkg0/fMwzkz7feMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+tn3iAUt15RN7TXuN0IEUR+AtUt6jFmM9jeIwj87X8=;
 b=BjRLkfD4hAafRaNSGoj6dLq1mhRxcflN3k4lNFmGJHVHRHl5BWxCbf1tdAFWe1iV+NTLSFXPnNXDN3xsWTdz1Kchc09RmIU2v+dVjaTOOs0n+aOhhG9LxGeYBzPb0FtZAOKDv2ESFRBibhx6720brWe5RnMqrNUov+vxBcGsRKhHdhxvzLiELDpd7eHJExPWuUitXCOlTdsKEk+ZRHB2sqK5nPL9cvvkr1TerHIpk7yewLONMa5Hj5G3ZtqR+4n9VN3h+rrCDgZ2UfVhtyMtZ0/K9Kga34S9RqgEdjGqCAFtORfDgb+/ng2S70CXx2dBadO6PJQA+dCKCfC2cLJDAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+tn3iAUt15RN7TXuN0IEUR+AtUt6jFmM9jeIwj87X8=;
 b=LlO1db+X33V0Skmzj3cTQuL3hbaLOvlLv+tUDL7XqwHvbmNxtSNAoE4Dx+przMauLDH4DxGgR176ipRv8gjDwz+tlNJx0/zOe5GxT3i11cGZhHz+gTPI/uVCpY8kpbvWDXkKZcau8vA8liPVk5P07Od4dteLj5+bcksjr/x6gNzraIb9O8YHCKRF0Lf6J3S2xfeysIB9DtmZAD3y7uwjZ6FWKF4fuPkurz5cMMGVvvOC54t+diCpoqE8z41szc0u2fU8eEj6UUbKg3iZDrfWhYEKvX2UEfgzW2foKH9sWnNx1wh/4hLuNxXLMu5fNn8EN2G57jD1f+8zUCGWYgILIw==
Received: from VE1P189MB1024.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:149::13)
 by DU4P189MB2682.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:563::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 25 Nov
 2024 17:43:34 +0000
Received: from VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
 ([fe80::4c0a:a901:4d3c:e0bb]) by VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
 ([fe80::4c0a:a901:4d3c:e0bb%4]) with mapi id 15.20.8158.024; Mon, 25 Nov 2024
 17:43:34 +0000
Message-ID: <VE1P189MB10249A3A525D8282E35D18F2E32E2@VE1P189MB1024.EURP189.PROD.OUTLOOK.COM>
Date: Mon, 25 Nov 2024 18:43:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
 <20241124-asus_qcom_display-v3-2-002b723b1920@hotmail.com>
 <af6f4b48-7e9b-4561-818d-150fe954d821@oss.qualcomm.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <af6f4b48-7e9b-4561-818d-150fe954d821@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::18) To VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:149::13)
X-Microsoft-Original-Message-ID: <b2b59027-0ef3-415d-b542-d778a19dddc0@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P189MB1024:EE_|DU4P189MB2682:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de3620e-0f1e-4041-c961-08dd0d78aecb
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|461199028|8060799006|15080799006|6090799003|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUlBWFhuVDFDNS8rdFhVSkVPMEVndWNINnFxUjJ4NmNMNmhIeEwrZGh6WUhS?=
 =?utf-8?B?VmtNZm9UWmdqQW5VZi9KKzNYYVpBc2JxeGdkUjBWWE8rZmN5TkM3cmUyakM5?=
 =?utf-8?B?cFhwY0F0QjYwS3ZoODlVR1AxQVdiYUN5b3Y0ZFk4NWxSL095L1Vid2JCRDJj?=
 =?utf-8?B?N050N3pxamZ3bExHZG1lV0F3Nms0Yzg0QytGbDVwT01YM2JLUUNQNG12Qk5s?=
 =?utf-8?B?TUthckJxVUoxU1lKL2E3N2lTYU5GTlRYU3I0dzRQSHo5UzRxOUZhOHRHNzl6?=
 =?utf-8?B?MC9VS0cwdm4rOEwvcUkyUlo0WHExTkFKTVJxZnluRElOL2FhWlE2c2VmRWtm?=
 =?utf-8?B?MTVTeUYyNm41R0tlWS8zdm00THQ3TmJxQWZkdXNkb2FSNXBNbFFFOEROTzZr?=
 =?utf-8?B?QzQrQ2o5YjREYmMrUnhEQjI4VkFWZ2JHSnA4a0hYMFVOU1kvaXlmMjdyMmor?=
 =?utf-8?B?Ykd6aXVGcGZha3JrYXdkaGdyVzVuNHE1eDl2Q214WFV6dVpvMGZkL1FBS3hU?=
 =?utf-8?B?ekRWdEVCMFJPcEpEYmRVVzRMV21RMUo3d0VMd0JYR3dLazlDS2dqa2hpYW4z?=
 =?utf-8?B?aE5WNHVDbThpTTMzSG5OVDIycnh6c1JEdVluYy9KY3lPU2t2UXFLR3RLdmdU?=
 =?utf-8?B?NzVhelRIa1lFOHpmMVUrN2ZJbmpadGI3VTFvRG9vQ21CRGFwTmRheTh3K3RP?=
 =?utf-8?B?bFpkR29vM2kvT0ZCUERtaERWVTBSNTg5T0hCMlpITFZmY05yRzFHampWbG95?=
 =?utf-8?B?ZlE4TUZ2ZzJ4aXBUWk85UFd1bEpBSWJmVUt6eDFWaXYzZ2lQMVg4QmdORkxt?=
 =?utf-8?B?anhLdVZiOUVLaldWa1QzSzM1Z2ZCd0Y5WHVKaEhTNnRDdmxVTHd5anBJMlJa?=
 =?utf-8?B?Vyt6RElseSt3WmJ0U2Y1b09idVFpaXBkekE5bGVJU2p1c25xOWF1STdFcThR?=
 =?utf-8?B?RHgzQ3ZDdDZNdzVpdWZ6Q2hTR3hFejE3OW9JWmg5UDNGUnBHVWJBNUt2NUth?=
 =?utf-8?B?QlRaTEQrVTBaRVRDbWZZTGwwcldmeHB4YU5SQzFnOUVGY24wVi9ub2x4cXdn?=
 =?utf-8?B?WnVBUlhoOXQ4V3BUQkZNMUVhcmVXK1l6bzY5cXZVRk5HbGN0ZDk4RFZQSFhl?=
 =?utf-8?B?YXFSNEFialIrNWtML3RYQUU4bStUaFBrSmxJZHAvdUlVd1h3SEtLSWd0NlNT?=
 =?utf-8?B?UDZlR1BZcUY5Y2xRUWtOTXhvbHF3RXN0VEQ4WFR3bFR5UUhSd2Jzdk9EcVJ2?=
 =?utf-8?B?aHlQazVydkVneTVQZUpoWVpGNlZiUXhYVE9rdThaeEgvYUVSVUZxTWZETXZZ?=
 =?utf-8?B?MGVBMjZQVjVCYXFqSTZZWTR6cDIyVjNwQWhKOFIwWi9BM0xMSDVQQi9LeStZ?=
 =?utf-8?Q?w4OnO7+EsstOgoL5d+bsm8m/6cllQ67c=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3A1TWJrZ290SFpBUENjUHZoWXlkR2tpS1hreFdtNTBhd1hucVJWUFNlVXpp?=
 =?utf-8?B?bjBEZC9ydmxDc1ZRem1oeDNYM3dQQVY2aDVTaWthd2tmZjFJVU1TVDRvR2pJ?=
 =?utf-8?B?L1JUdXFaR1dWTERhWXkyWmxpZnBORVBDS1Q5TlI5bUptVlBzRmZwMStCb1Fn?=
 =?utf-8?B?anlQZTVOM2xtenNWbXozTW5iVTFRU2RhdjM1SnZpMThtanVDcjRTN0k1czBS?=
 =?utf-8?B?cmR6NWcrdnpzcWZIREdTaHAxU2dMaEhZZzZ4WWxlcVNEWDlPZTJKN0RFNEJu?=
 =?utf-8?B?SnYycmV2Zll5ZElZQWtoT2ZKMXA2RHUrREoyMVJab2ljeHh6UVlZZnFtanQx?=
 =?utf-8?B?OER5SzVMUW5ObjNNV2tQSGx1bDQ3MDExTHhhR21BenRkSU0yK0lrQllBTTZj?=
 =?utf-8?B?MGxLa0VnRGRESHJmcU1kVGZrQ3luaFBzYThYNVkyODRQcDF3aXIvZFU2TDBX?=
 =?utf-8?B?RGo1WElkamR0RGNUODhkR1BiTnBBUVpNbFg1RWtiNTE1L0xHK0lYak1naHpm?=
 =?utf-8?B?bXpTSU03d29FNWcwYmJKY2VtTE85VjNwS3lOaEM3M3RxcnIwck4vTmJEbTcz?=
 =?utf-8?B?UnU1UUFia1pTK1ZTb2NPUmVGL2djampLT1RkOUYvN0puQzFmWVp2dmg4MnpG?=
 =?utf-8?B?bHU3SkVjR1ZPTXBlRzdtOTkyUm9qWjFHbVh5UFFXUVdkQkxvL0tqK0xFaERi?=
 =?utf-8?B?dFhVT3lHK0N4QmJsRTJNbDhMMnpndWVKS2QxYlZoeWlmUHJDRDRwVWEvcHNQ?=
 =?utf-8?B?NlQ1di84OGFpckxnWklheDBqcGhVai80U0xhcS9GRVR3aElueGdQeHMyMzNB?=
 =?utf-8?B?M3dWQnhsNElBWTVMdGlCSktIRmVtYzRPZDVQbEFUTk5sTU4rR1JnRDJPYU5P?=
 =?utf-8?B?QXI5S1p4Q2dxdUU2NzVPdkJYc0pVRUFLbGFyaUV1U0NGZklaM2FBUmg3RHBQ?=
 =?utf-8?B?NmlHVVkxeWJEaWM3bldVSzNBTHRwSWsxUDM1aTY0NVkyU0RuVmdKZytlOFRn?=
 =?utf-8?B?UVdTbDh0alp6OEw5dXRKOTJnSm9CMG0zK1BFV0xiUkZMNlFibkZjMDNSSTZE?=
 =?utf-8?B?aTJYNDN4TXNITlRNQ1RoWUtqcFF0U0tiL1NhWlIrQ01scG5heFRxOUNqUFMy?=
 =?utf-8?B?TTBxMTJ0aEVxMkd4QTRCWnJuVjVzdFVpUkg0WjFGRjZKeSsxdkdkSCs5R3Br?=
 =?utf-8?B?YkxzQ0V0Yjd6cjVpQUFIOUVZbEJTWlA5eFRIN0JVNi9yTENUaUVPdlhSc3lY?=
 =?utf-8?B?cmlhNVQ5S2JSeG9xZndqT0lOdEVBRG1YcC9aSGtTZUd0ZG5BSEpZaG4xQ0pT?=
 =?utf-8?B?NitnU3JDdE9ONVdFcHZnRjBFalVGc3Brc1piUWl3azNzNjNVTXMwaENwaU52?=
 =?utf-8?B?RWEzRzI5RTNTdzZMZFRzZVN0Tml3RUxmTmd5aGxyaUN1MzNQSEdqOStQS28z?=
 =?utf-8?B?UHBPdlV5QzZmaG5lOVlqQS9IZkZ2R09PSm1KbERtN2RmamNvNzJRZTdFSnc4?=
 =?utf-8?B?NnNENUtNRFNKMjVVMWdHMXIzdXZaYnRCblFuRDk2OWJMT1NFdmx3QWtkL1da?=
 =?utf-8?B?bHErNjRXT054R3FSRnVvNWN1eTZPcU44MUNiTUxNMGpsOEtzdTlFZHJnVUti?=
 =?utf-8?B?alZYY3MxejVsS2h4TzVMSjdKOEdINE82dzdQbmd5bFNVQWNaREhuM3VCaCtv?=
 =?utf-8?B?ZmdQS0VqLzdJMjY5TDZubTA0ZXgrUURNbkdrOENjTTJqQVNmRWM5K1hpaWFl?=
 =?utf-8?Q?zzbuNf5H2yJY42ulRCIhTPk3tnUrS3F+eEnnFoO?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de3620e-0f1e-4041-c961-08dd0d78aecb
X-MS-Exchange-CrossTenant-AuthSource: VE1P189MB1024.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:43:34.1007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2682
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/25/24 1:21 PM, Konrad Dybcio wrote:
> On 24.11.2024 11:00 AM, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maud_spierings@hotmail.com>
>>
>> The Asus vivobook s15 uses the ATNA56AC03 panel.
>> This panel is controlled by the atna33xc20 driver instead of the generic
>> edp-panel driver
>>
>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> index f25991b887de3fca0092c5f81c881c5d8bd71aac..dbc85aff50a95bfc2ac11528d1901979ec7b1501 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> @@ -407,9 +407,13 @@ &mdss_dp3 {
>>   
>>   	aux-bus {
>>   		panel {
>> -			compatible = "edp-panel";
>> +			compatible = "samsung,atna56ac03", "samsung,atna33xc20";
>> +			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>>   			power-supply = <&vreg_edp_3p3>;
>>   
>> +			pinctrl-0 = <&edp_bl_en>;
>> +			pinctrl-names = "default";
>> +
>>   			port {
>>   				edp_panel_in: endpoint {
>>   					remote-endpoint = <&mdss_dp3_out>;
>> @@ -475,6 +479,16 @@ &pcie6a_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pmc8380_3_gpios {
>> +	edp_bl_en: edp-bl-en-state {
>> +		pins = "gpio4";
>> +		function = "normal";
>> +		power-source = <0>;
> This is <1> on other boards.. I'm guessing you verified this against
> at-boot values?
>
> Konrad
I checked all the other gpios in these patches but it seems I did not do 
the same for this one. It is indeed supposed to be <1>, I wonder if the 
lenovo slim 7 dts is wrong too then.

Anyways, I will fix this, with a couple of other parameters that have to 
be added as well.

Terribly sorry for the lack of checking and thank you for spotting this.

Kind regards, Maud

