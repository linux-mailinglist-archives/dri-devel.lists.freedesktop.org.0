Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8753D4B0CD6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8682B10E821;
	Thu, 10 Feb 2022 11:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9508110E821;
 Thu, 10 Feb 2022 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644494205; x=1645099005;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/8N497CRB2p6vzWZtoZkYubsC5w+3j2hbr9/XeGepwE=;
 b=jo+5ZjtgRvvQMXL79AQ5OePMrpZ0qga8vrCD+dp0BjFPymuF5KKxaX49
 Wrq1fQo0tD4YHAS74h69MMaG4FpFKaf1C9aFL6qUjO+iRTNu6O5PgOuWa
 lQBgmX/of1l5SgfByexFzSkXgCTaXfj9T8zcmg3E/Mc2MEEdQDnVia+Qc g=;
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 11:56:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPmvxhiC1iwffKmVukLgV6c1RmzPMdMQ3XYLddMhapEIdtIlwIUA61el/Xk2R+H272FDNKdQjKCRpq0qToxcLbj7HAnIQXgTyZGnMzsiCOGI3UILgn/t7kXFahNHdMmi5Qw+jRmDJjLxdAo9dfzfe3sbf1BLnCtwVCW4HP3P94r4LktO/+4bUSYBWTdoaU+BpOamc1NIaG5yxIP6iKqBc5KftEkaddHuN2lv/4AaIUpbGhba2ZArKr+Sn6jwYhwmsmahsUKzSL8yT4Bgzt1mfWCQ9TtdGn8zwuOjDVC+apPAlO/Fr/utIzktso6frB1tZz4sY5x0E+iGMZCRlbXZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8N497CRB2p6vzWZtoZkYubsC5w+3j2hbr9/XeGepwE=;
 b=SPICVlarDcHf1WSvf2XxAbmHiJvLVH7GUwfSUoET1rGzZeR0lDQ4QZGy/oAkeDPnqD06X+Fyi5XYnvCRxgtb+v4VT5Su92iEyUvx4jZRz1aUY/AFVDFq8MEt87nCnV7HuKr1rhsH+DHP/u+7cDebvmW0So4tqXrOX0oAv41hcxXqW4aPdjQni3lr/ZHinvTIyYr6ON0kz+6fGP+JEpEXS+GNa1kmvIKUCB3LhYkMSnHTE0m5mDTVBGRXAq2JDQt+C3T4pO2j28ovTr1Vf4dINGnqZXaRblpbVNukjGuaT1wV4rgy2oNw+r/A1cwTVyoDNMofkYNxlVXgI7gDfR7L8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SN6PR02MB5277.namprd02.prod.outlook.com (2603:10b6:805:68::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 11:56:40 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006%3]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 11:56:40 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>, "agross@kernel.org" <agross@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "bjorn.andersson@linaro.org"
 <bjorn.andersson@linaro.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robdclark@gmail.com" <robdclark@gmail.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>
Subject: RE: [PATCH v3 2/4] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Topic: [PATCH v3 2/4] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Index: AQHYHZLh06gQVGDajEGApE7TCFe+eqyL/BQAgACzSHA=
Date: Thu, 10 Feb 2022 11:56:40 +0000
Message-ID: <MW4PR02MB7186F07A6CBDBBFBEFA863BDE12F9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644396932-17932-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n53OxjWD7ybT-AhseO4h3BBG+aFiJZxar5TZYsYgC0ci1w@mail.gmail.com>
In-Reply-To: <CAE-0n53OxjWD7ybT-AhseO4h3BBG+aFiJZxar5TZYsYgC0ci1w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79ad9a16-8c1a-4fe6-16c0-08d9ec8c664b
x-ms-traffictypediagnostic: SN6PR02MB5277:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR02MB5277FE9CE0900683DDF9E4159D2F9@SN6PR02MB5277.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /q/6gqi9cl4uA/axLwCOD2DOYqekiKYDuEdflprBBmf3WcQMz6w3ZifyC8mfYB/3Ma02NezGdfk/xzJdfqj7bBFkBk6PLA+WxDpLB9AC8TlKRR3UeqSyEVrF9S2ScWOJ+b3gUukhHd0gC+gTc2VhRP1a7ExA9/h4eYlcbk9E6pyeTsfB3t/btSCSMUaXCDU94PPXSeykoVDgHeBl4El2DyPuMBZpy6NX82AEIXwGBsHbmuk/D0Xb7fWvKAjKaIhy331su4j9wRsV0xdMieUsT6PmXZSQqwpsqzZb/B1uoG87wT6Xr3hYgAeXFlXp3ceSyu9OAH1NCHT4UM0Cv26+nuiHVLnyQDY6MONCXjTdOIUVak+k4jTFqIie5EmSEOhY+GqojPyAy6PZZOFasvClvp4QCNwHuUfS3NEcK55G7sKsMLJAk+Rc2kgLaRjVevsroHcSJ8HwPiE1QUscgnW3pSzpCJP0yx/LDcz6LYTLaVeFbbSecL71J29iWnN1mbr5tMnSSP14n1t7Y5C3Ege+DXNism22bTe1F8+knDDUS6hetHCyHCVsEp03rwiS0/N6ZP8ZuspPnpL0niwVwLlN/R1Hja5CqAcwvvcNGY1731g/cDzv+jKPEghFIGdYzFMSQ5LQpt0QdHxzrSLAuF6SHnmaV494aJz74pdV/qZ4my7MQoYALYrr267wOj2ELMW6WKgTxq5b1z38b5vLgb9bx+BrNctkCAdwkO/FKAg9B8Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(71200400001)(8676002)(107886003)(6506007)(110136005)(86362001)(38070700005)(54906003)(53546011)(4326008)(508600001)(8936002)(7696005)(316002)(55016003)(33656002)(66476007)(66556008)(66946007)(66446008)(76116006)(122000001)(2906002)(83380400001)(38100700002)(9686003)(5660300002)(7416002)(52536014)(921005)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b003TW51M3QzY2NaQldpS0ZCejhnbjdUb214dlJmTnEzMDFIV3lWL3hMWGlq?=
 =?utf-8?B?d1ZDamVmdXFMS29KK0VIV0NWeENMblNWSFhpL0RBeThxbVozUVRzQ1lJZjFN?=
 =?utf-8?B?d1B4WFprN0NERTJyL2cxakNnMWlQRUU2N3d0MVpmQ0g2c0t2WkloYzhGNjdK?=
 =?utf-8?B?dmJHMzFpRjk2ZWNwbHFBMEtoZytlUVdldnJ1ajZHanp2bHI3VmF0Wm51QVFS?=
 =?utf-8?B?akd1RDVJaEs5NjV6MUlkUHJzQUwzdm1yNmRvVkF2UVJpN2ZnMytPc2tYSXVq?=
 =?utf-8?B?L2N1OUNRRjU2M2h6cnAzZGEzM0M4UWh4cTM5VndscWhLVlhYTUo3VUVtejFW?=
 =?utf-8?B?T3VQTU44S1IwRkZWSGhxc3pMZm1kTmRGMHE4TEprckdraXI2NHRnWlJ0LzVN?=
 =?utf-8?B?cFV1aitwclhhdVJvT09vd3ZUM0QwcFVWemkxTmxvNm5EUHZMMktPY1FrY3Nu?=
 =?utf-8?B?YkU5M2JFb1FNTjhyZXViWG5sRFg0cTdVN1poWjRVbEpqNUxtMmxmMDFKdGpD?=
 =?utf-8?B?U0luWHhMZ2hoUDZkaGpocmwwN2V0YWNmRzAyU2pzcHJTc1N1TE8zbThSOWtq?=
 =?utf-8?B?V1BqL2l2a0dSd1cwZldwSVl3MlVTelQ0Z3NFL011Nmlyc2MxL2hIUkRhck91?=
 =?utf-8?B?QmJHOVVRa3dQZGRMWHVCbGM1bmJWUmY1RVBqV3daQUpHRTlvNzIzSTJtc2Fz?=
 =?utf-8?B?SUIzWVdacDVXNnlsMzZNTER2K2xoaDY1WEhYa2VqQ1E0ampFYk9lOS9UWGVV?=
 =?utf-8?B?T2I5R2loM2c4MWFZckRWTWFPcElqTVJJb2VEcjNGbVQwWDlEUmVXVXhyMHRH?=
 =?utf-8?B?bVVtd2IzTDRDT2pkUGI4UVh3SjVLYUQ4NDFmTjc2VExYN0JhUkZ1OUdmS1U4?=
 =?utf-8?B?Y3p3MkZYZC9vWEc0QVJUS2Z0ODVvVXZQYzd1OFNYSFJ3TkNPUmRJOUNRRXdm?=
 =?utf-8?B?RHNMVHFLTEF0bDJvcGJ1Y3c3ajBUVWN0RjVNcXVsSlhaSG4vdDJFNk9SaEJm?=
 =?utf-8?B?TnNmMEJsQVdCZlJvczFkaVcydVNORDNEcVY2TzFRU0orVU0zbmNhRVlkeUFl?=
 =?utf-8?B?Vm0xZkQ5N0ozUWJMUGYzdHFHRmJzK1dzSzNlZUpZa2M5SFZWMTRvYlR1K0Vi?=
 =?utf-8?B?K1pNOWJMcEMzeElQN2YxWDNuWkVGbEs1WFk5UFliQWM0TGJDU0lZb0k1cEdC?=
 =?utf-8?B?MTlLT3d2WTE2R3FxQ0J4c1lRa0wwQUdkam9XcVRlTk5kWk1OZFF2VXk2RWx0?=
 =?utf-8?B?bTFhZW9aOUphU1BlbFBVRmUvUjc5R0FZd2E4RFovdzhGOU1iaitwa05KM21D?=
 =?utf-8?B?NExVdkt1N0ZqSWxzc0NRRTUyOTd4MUUzblFIeHR6WEE1U0FIRDlGdGxXTURv?=
 =?utf-8?B?d1VqMjNrQjJrVHBTWnFVWVRxOEhJeVhRMnNjbWthWHExUTR2VCtFNTJ1YVNm?=
 =?utf-8?B?TEZLekxMdG9DWUljZnBXc1BjTjg5dXAwZWtnVjNHaE55Y2hWcCt5b2R5T2NB?=
 =?utf-8?B?M25xZUV2L1NVa0oySUpMRkJZNksrajZRY2RqRnBaSWZrMWpndmhIS0RVM1d5?=
 =?utf-8?B?NmxKNUd2Si9LdUhVblVlZzNweWt3c3F5bDFhYVdIeWZyZDNJYXFNTnAwTkc3?=
 =?utf-8?B?MEQxQnJGMUdXYytKNDc1L0hQN3hHYi9ta1Nld2pZelM4RkErWHRQd2V2TDQ0?=
 =?utf-8?B?SlI2Tm9wMUNTc0M0dmFmZkt5WXZzNkFOcHFUNC95Vkc1bUdtUkhDV1dWTHFN?=
 =?utf-8?B?WWQ1bWtOclFoR1lGRklkTjJZVG1reEhmYVVSQWtoVVZQYTUxSlBhREtHejRJ?=
 =?utf-8?B?b09GUW8rZHdIaEZXbHF1Z1czNTlVTEpNVGxyT2ZXVDFDdUMrMlgxRzdOVktm?=
 =?utf-8?B?SVUzM2pDY2EwNUw5TW5nZkxjTEkyWTlTbjFkR2FzWlR6dFpqNXZlelZwWGFV?=
 =?utf-8?B?NUZMc0RJbHBJT1Y1RVBhRE5Ga0RnMjBnM1QxZkRDY0x5TVcyNkJ2alp2OU9t?=
 =?utf-8?B?NU50dzVyWEJRMktTMnJCQmtTLzB1RFpKVHVxYjJIcVVxdGlkL2thZ0RtWHVH?=
 =?utf-8?B?SXh6eE5GUmkxMThDdGZTWjFKR1JobmN3QzRKYWlnRXFoeFlJTVFEdFlVcmxv?=
 =?utf-8?B?cHJubnhUMEtpbzNGcEhYejQrZ0pCeXoxd0VyZGtMeWFkeERENmNpV1ozcDlm?=
 =?utf-8?B?YWxuYUNvQVJHKzVFWUtKaVdFRW16S1Y1UjYxQm0xYTdFZmNhN3pxSXM2cklP?=
 =?utf-8?B?Y1NZWHlPSzVLb24rOHhseVdCTlZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ad9a16-8c1a-4fe6-16c0-08d9ec8c664b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 11:56:40.4315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQFqUwhVvdDoIh6kRsBuf2589rTWzs2DEUOWTq3pHgRwSX1ro1dWWhH/jIzFZyfgWMjXjBSUjP00bRXl0zuK+6x2ukHMnahzJs7YYnkJjC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5277
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
 quic_vproddut <quic_vproddut@quicinc.com>,
 quic_mkrishn <quic_mkrishn@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlcGhlbiwNCldpbGwgaW1wbGVtZW50IGFsbCB0aGUgc3VnZ2VzdGVkIGNoYW5nZXMuDQoN
ClRoYW5rIHlvdSwNClNhbmtlZXJ0aA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPiANClNlbnQ6IFRodXJzZGF5LCBG
ZWJydWFyeSAxMCwgMjAyMiA2OjQ1IEFNDQpUbzogU2Fua2VlcnRoIEJpbGxha2FudGkgKFFVSUMp
IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPjsgYWdyb3NzQGtlcm5lbC5vcmc7IGFpcmxpZWRA
bGludXguaWU7IGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnOyBkYW5pZWxAZmZ3bGwuY2g7IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBkaWFuZGVyc0BjaHJvbWl1bS5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbTsgbGludXgtYXJtLW1zbUB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHJvYmRjbGFya0BnbWFpbC5j
b207IHJvYmgrZHRAa2VybmVsLm9yZzsgc2FtQHJhdm5ib3JnLm9yZzsgc2VhbnBhdWxAY2hyb21p
dW0ub3JnOyB0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20NCkNjOiBxdWljX2thbHlhbnQgPHF1aWNf
a2FseWFudEBxdWljaW5jLmNvbT47IEFiaGluYXYgS3VtYXIgKFFVSUMpIDxxdWljX2FiaGluYXZr
QHF1aWNpbmMuY29tPjsgS3VvZ2VlIEhzaWVoIChRVUlDKSA8cXVpY19raHNpZWhAcXVpY2luYy5j
b20+OyBxdWljX21rcmlzaG4gPHF1aWNfbWtyaXNobkBxdWljaW5jLmNvbT47IHF1aWNfdnByb2Rk
dXQgPHF1aWNfdnByb2RkdXRAcXVpY2luYy5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIv
NF0gYXJtNjQ6IGR0czogcWNvbTogc2M3MjgwOiBBZGQgc3VwcG9ydCBmb3IgZURQIHBhbmVsIG9u
IENSRA0KDQpRdW90aW5nIFNhbmtlZXJ0aCBCaWxsYWthbnRpICgyMDIyLTAyLTA5IDAwOjU1OjMw
KQ0KPiBFbmFibGUgdGhlIGVEUCBkaXNwbGF5IHBhbmVsIHN1cHBvcnQgd2l0aG91dCBIUEQgb24g
c2M3MjgwIHBsYXRmb3JtLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBTYW5rZWVydGggQmlsbGFrYW50
aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gLS0tDQo+DQo+IENoYW5nZXMgaW4gdjM6
DQo+ICAgLSBTb3J0IHRoZSBub2RlcyBhbHBoYWJldGljYWxseQ0KPiAgIC0gVXNlIC0gaW5zdGVh
ZCBvZiBfIGFzIG5vZGUgbmFtZXMNCj4gICAtIFBsYWNlIHRoZSBiYWNrbGlnaHQgYW5kIHBhbmVs
IG5vZGVzIHVuZGVyIHJvb3QNCj4gICAtIENoYW5nZSB0aGUgbmFtZSBvZiBlZHBfb3V0IHRvIG1k
c3NfZWRwX291dA0KPiAgIC0gQ2hhbmdlIHRoZSBuYW1lcyBvZiByZWd1bGF0b3Igbm9kZXMNCj4g
ICAtIERlbGV0ZSB1bnVzZWQgcHJvcGVydGllcyBpbiB0aGUgYm9hcmQgZmlsZQ0KPg0KPg0KPiBD
aGFuZ2VzIGluIHYyOg0KPiAgIC0gU29ydCBub2RlIHJlZmVyZW5jZXMgYWxwaGFiZXRpY2FsbHkN
Cj4gICAtIEltcHJvdmUgcmVhZGFiaWxpdHkNCj4gICAtIE1vdmUgdGhlIHB3bSBwaW5jdHJsIHRv
IHB3bSBub2RlDQo+ICAgLSBNb3ZlIHRoZSByZWd1bGF0b3JzIHRvIHJvb3QNCj4gICAtIERlZmlu
ZSBiYWNrbGlnaHQgcG93ZXINCj4gICAtIFJlbW92ZSBkdW1teSByZWd1bGF0b3Igbm9kZQ0KPiAg
IC0gQ2xlYW51cCBwaW5jdHJsIGRlZmluaXRpb25zDQo+DQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRz
L3Fjb20vc2M3MjgwLWNyZC5kdHMgfCAxMjIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaSAgICB8ICAgMiArLQ0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzI4MC1jcmQuZHRzIA0K
PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAtY3JkLmR0cw0KPiBpbmRleCBlMmVm
YmRkLi4yYTQ5MGEwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vc2M3
MjgwLWNyZC5kdHMNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzI4MC1jcmQu
ZHRzDQo+IEBAIC0yMSw2ICsyMSw1OSBAQA0KPiAgICAgICAgIGNob3NlbiB7DQo+ICAgICAgICAg
ICAgICAgICBzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsNCj4gICAgICAgICB9Ow0K
PiArDQo+ICsgICAgICAgYmFja2xpZ2h0XzN2M19yZWd1bGF0b3I6IGJhY2tsaWdodC0zdjMtcmVn
dWxhdG9yIHsNCj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVk
IjsNCj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gImJhY2tsaWdodF8zdjNfcmVn
dWxhdG9yIjsNCj4gKw0KPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQg
PSA8MzMwMDAwMD47DQo+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9
IDwzMzAwMDAwPjsNCj4gKw0KPiArICAgICAgICAgICAgICAgZ3BpbyA9IDwmcG04MzUwY19ncGlv
cyA3IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiArICAgICAgICAgICAgICAgZW5hYmxlLWFjdGl2ZS1o
aWdoOw0KPiArDQo+ICsgICAgICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0K
PiArICAgICAgICAgICAgICAgcGluY3RybC0wID0gPCZlZHBfYmxfcG93ZXI+Ow0KPiArICAgICAg
IH07DQo+ICsNCj4gKyAgICAgICBlZHBfM3YzX3JlZ3VsYXRvcjogZWRwLTN2My1yZWd1bGF0b3Ig
ew0KPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOw0KPiAr
ICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiZWRwXzN2M19yZWd1bGF0b3IiOw0KPiAr
DQo+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsN
Cj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0K
PiArDQo+ICsgICAgICAgICAgICAgICBncGlvID0gPCZ0bG1tIDgwIEdQSU9fQUNUSVZFX0hJR0g+
Ow0KPiArICAgICAgICAgICAgICAgZW5hYmxlLWFjdGl2ZS1oaWdoOw0KPiArDQo+ICsgICAgICAg
ICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiArICAgICAgICAgICAgICAgcGlu
Y3RybC0wID0gPCZlZHBfcGFuZWxfcG93ZXI+Ow0KPiArICAgICAgIH07DQo+ICsNCj4gKyAgICAg
ICBlZHBfYmFja2xpZ2h0OiBlZHAtYmFja2xpZ2h0IHsNCj4gKyAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAicHdtLWJhY2tsaWdodCI7DQo+ICsNCj4gKyAgICAgICAgICAgICAgIHBvd2VyLXN1
cHBseSA9IDwmYmFja2xpZ2h0XzN2M19yZWd1bGF0b3I+Ow0KPiArICAgICAgICAgICAgICAgcHdt
cyA9IDwmcG04MzUwY19wd20gMyA2NTUzNT47DQo+ICsgICAgICAgfTsNCj4gKw0KPiArICAgICAg
IGVkcF9wYW5lbDogZWRwLXBhbmVsIHsNCj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
c2hhcnAsbHExNDBtMWp3NDYiOw0KPiArDQo+ICsgICAgICAgICAgICAgICBwb3dlci1zdXBwbHkg
PSA8JmVkcF8zdjNfcmVndWxhdG9yPjsNCj4gKyAgICAgICAgICAgICAgIGJhY2tsaWdodCA9IDwm
ZWRwX2JhY2tsaWdodD47DQo+ICsNCj4gKyAgICAgICAgICAgICAgIHBvcnRzIHsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiArICAgICAgICAgICAgICAgICAgICAgICBw
b3J0QDAgew0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlZHBfcGFuZWxfaW46IGVuZHBvaW50IHsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2lu
dCA9IDwmZWRwX291dD47DQoNCldoZXJlIGlzIGVkcF9vdXQgbm93Pw0KDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4g
KyAgICAgICAgICAgICAgIH07DQo+ICsgICAgICAgfTsNCj4gIH07DQo+DQo+ICAmYXBwc19yc2Mg
ew0KPiBAQCAtNzYsNiArMTI5LDQ0IEBAIGFwX3RzX3Blbl8xdjg6ICZpMmMxMyB7DQo+ICAgICAg
ICAgfTsNCj4gIH07DQo+DQo+ICsmbWRzcyB7DQo+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0K
PiArfTsNCj4gKw0KPiArJm1kc3NfZHAgew0KPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4g
Kw0KPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsgICAgICAgcGluY3Ry
bC0wID0gPCZkcF9ob3RfcGx1Z19kZXQ+Ow0KPiArICAgICAgIGRhdGEtbGFuZXMgPSA8MCAxPjsN
Cj4gKyAgICAgICB2ZGRhLTFwMi1zdXBwbHkgPSA8JnZyZWdfbDZiXzFwMj47DQo+ICsgICAgICAg
dmRkYS0wcDktc3VwcGx5ID0gPCZ2cmVnX2wxYl8wcDg+OyB9Ow0KPiArDQo+ICsmbWRzc19lZHAg
ew0KPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gKw0KPiArICAgICAgIHZkZGEtMXAyLXN1
cHBseSA9IDwmdnJlZ19sNmJfMXAyPjsNCj4gKyAgICAgICB2ZGRhLTBwOS1zdXBwbHkgPSA8JnZy
ZWdfbDEwY18wcDg+Ow0KPiArICAgICAgIC9kZWxldGUtcHJvcGVydHkvIHBpbmN0cmwtbmFtZXM7
DQo+ICsgICAgICAgL2RlbGV0ZS1wcm9wZXJ0eS8gcGluY3RybC0wOw0KPiArfTsNCj4gKw0KPiAr
Jm1kc3NfZWRwX291dCB7DQo+ICsgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZlZHBfcGFuZWxf
aW4+OyB9Ow0KPiArDQo+ICsmbWRzc19lZHBfcGh5IHsNCj4gKyAgICAgICBzdGF0dXMgPSAib2th
eSI7DQo+ICsNCj4gKyAgICAgICB2ZGRhLTFwMi1zdXBwbHkgPSA8JnZyZWdfbDZiXzFwMj47DQo+
ICsgICAgICAgdmRkYS0wcDktc3VwcGx5ID0gPCZ2cmVnX2wxMGNfMHA4PjsgfTsNCj4gKw0KPiAr
Jm1kc3NfbWRwIHsNCj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ICt9Ow0KPiArDQo+ICAm
bnZtZV8zdjNfcmVndWxhdG9yIHsNCj4gICAgICAgICBncGlvID0gPCZ0bG1tIDUxIEdQSU9fQUNU
SVZFX0hJR0g+OyAgfTsgQEAgLTg0LDcgKzE3NSwzOCBAQCANCj4gYXBfdHNfcGVuXzF2ODogJmky
YzEzIHsNCj4gICAgICAgICBwaW5zID0gImdwaW81MSI7DQo+ICB9Ow0KPg0KPiArJnBtODM1MGNf
Z3Bpb3Mgew0KPiArICAgICAgIGVkcF9ibF9wb3dlcjogZWRwLWJsLXBvd2VyIHsNCj4gKyAgICAg
ICAgICAgICAgIHBpbnMgPSAiZ3BpbzciOw0KPiArICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAi
bm9ybWFsIjsNCj4gKyAgICAgICAgICAgICAgIHFjb20sZHJpdmUtc3RyZW5ndGggPSA8UE1JQ19H
UElPX1NUUkVOR1RIX0xPVz47DQo+ICsgICAgICAgICAgICAgICBiaWFzLWRpc2FibGU7DQo+ICsg
ICAgICAgICAgICAgICBvdXRwdXQtbG93Ow0KDQpJcyB0aGUgJ291dHB1dC1sb3cnIG5lY2Vzc2Fy
eT8NCg0KPiArICAgICAgIH07DQo+ICsNCj4gKyAgICAgICBlZHBfYmxfcHdtOiBlZHAtYmwtcHdt
IHsNCj4gKyAgICAgICAgICAgICAgIHBpbnMgPSAiZ3BpbzgiOw0KPiArICAgICAgICAgICAgICAg
ZnVuY3Rpb24gPSAiZnVuYzEiOw0KPiArICAgICAgICAgICAgICAgcWNvbSxkcml2ZS1zdHJlbmd0
aCA9IDxQTUlDX0dQSU9fU1RSRU5HVEhfTE9XPjsNCj4gKyAgICAgICAgICAgICAgIGJpYXMtZGlz
YWJsZTsNCj4gKyAgICAgICAgICAgICAgIG91dHB1dC1sb3c7DQoNClNhbWUgcXVlc3Rpb24uDQoN
Cj4gKyAgICAgICB9Ow0KPiArfTsNCj4gKw0KPiArJnBtODM1MGNfcHdtIHsNCj4gKyAgICAgICBz
dGF0dXMgPSAib2theSI7DQo+ICsNCj4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
Ow0KPiArICAgICAgIHBpbmN0cmwtMCA9IDwmZWRwX2JsX3B3bT47DQo+ICt9Ow0KPiArDQo+ICAm
dGxtbSB7DQo+ICsgICAgICAgZWRwX3BhbmVsX3Bvd2VyOiBlZHAtcGFuZWwtcG93ZXIgew0KPiAr
ICAgICAgICAgICAgICAgcGlucyA9ICJncGlvODAiOw0KPiArICAgICAgICAgICAgICAgZnVuY3Rp
b24gPSAiZ3BpbyI7DQo+ICsgICAgICAgICAgICAgICBiaWFzLXB1bGwtZG93bjsNCj4gKyAgICAg
ICB9Ow0KPiArDQo+ICAgICAgICAgdHBfaW50X29kbDogdHAtaW50LW9kbCB7DQo+ICAgICAgICAg
ICAgICAgICBwaW5zID0gImdwaW83IjsNCj4gICAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gImdw
aW8iOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzI4MC5kdHNp
IA0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaQ0KPiBpbmRleCAzNTcy
Mzk5Li5lY2E0MDNhIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vc2M3
MjgwLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzI4MC5kdHNpDQo+
IEBAIC0zMDY2LDcgKzMwNjYsNyBAQA0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcG9ydEAxIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDE+Ow0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBlZHBfb3V0OiBlbmRwb2ludCB7IH07DQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1kc3NfZWRwX291dDogZW5kcG9p
bnQgDQo+ICsgeyB9Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fTsNCg0KSXQgZmVlbHMgbGlrZSB0aGlzIHNob3VsZCBiZSBhIGRpZmZlcmVudCBwYXRjaCBmb3Ig
dGhpcyBwaGFuZGxlIHJlbmFtZS4NCg==
