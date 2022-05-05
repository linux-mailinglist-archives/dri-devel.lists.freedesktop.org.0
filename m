Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4251C857
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 20:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1431010E912;
	Thu,  5 May 2022 18:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBADC10E912;
 Thu,  5 May 2022 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1651776447; x=1652381247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y8AcrwkJicKVO/PlBEgosDSKNFGQpROLAVtBFdeZFgw=;
 b=Aqh67YHNfO+CPhSeBSvwZxOi5pSS/acuahQzhxPp34wFOahfmP0p2Rzb
 1X9Me/Hh7BMUjY5hdUXCjuk6NPgVNGfopSefBRWzYLr8flGWzaq+/W8zL
 HGxsRiltEgBfVNJ1oaabUgYr45lWpxRubuHvQsHYZ98u91TmI5SFssctm A=;
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 18:47:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuPLAqyq1CFdsZ8d5PlYhhR7M9QQkTXcwi1T17m/XBa4W773+g0qVi0AImZ8iwdIlTVj8dGF7ZQjFdnFquOkA2+Iw2oW+BKROoffcQ5XxQp9p7hrTwpvg80ABbelGDBzNGmIJ4BW+HABF7VBDD4GPo6KgQW+P2YaMyelcvyrlwSngZ8LuGu+GtAwfm+Az8Jyg9fz09tsWhHKxL8XySlSvnuc3FiR1d6Yu3RdSsLtkrzl0+n/jGNzuMzj09CyJkP0qLaeqf5IM4nQo/fK7uSogSFbzjMyzD395itY6jnVdxE2SajIKM6KHKFTLVATjB/9gKCqnlCSmuMM20dwngRi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8AcrwkJicKVO/PlBEgosDSKNFGQpROLAVtBFdeZFgw=;
 b=NJJcuMdMCl4UOtcJVTqcP4u4SNCFhVL0Tg75cnUBb+3jFuuQ6UEndozF9HSjLsq1qwfnv2p46Ny96pwJ5v5/y3HV8YIbYN/Z2+B5CrqX05aXWYLlevgUu60atHXQv/JlOGJmUEYFLGwgGj2Cysq2JJ0uu4rt6MsyQT5X/I9HNPQhdY5CdrbLBRmKcZKhinIiSoAsHA6cntspM/g8VcZjL2NZxdx2DbM81iDj4iW5Fw/pjvnJUR0rimi8TWA2+fTuvb9ZsD60LKeUhR9iGX57wgcBdYxbYM0ZoveHdN1nfn99IFB3WT2ApTOB3WwmQ8fCqU3/NAJgHSseAX5/FA6MvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by DM5PR02MB3704.namprd02.prod.outlook.com (2603:10b6:4:af::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 18:47:20 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 18:47:20 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>
Subject: RE: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
Thread-Topic: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
Thread-Index: AQHYWOh0LkcVWva+fESk6uZPP3V7t60BIRCAgAABL4CAD35OcIAABpoAgAADzZA=
Date: Thu, 5 May 2022 18:47:20 +0000
Message-ID: <MW4PR02MB71867A18732B266DE8FA2040E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
 <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
 <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
 <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n51Q=cGwrMec3JEQENqWHV3pAUjLPT6RwZLA5xV080sgxQ@mail.gmail.com>
In-Reply-To: <CAE-0n51Q=cGwrMec3JEQENqWHV3pAUjLPT6RwZLA5xV080sgxQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a25f7260-ded6-4afc-4217-08da2ec7af9c
x-ms-traffictypediagnostic: DM5PR02MB3704:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR02MB3704564FA513AE3B5679BC219DC29@DM5PR02MB3704.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gUl5pJrT3P6pllD1iYt8zrpqWCC695vVifHDIk8lR2iHKb/6pTYOR/yY1nr5T1ARxUQbJ++7WuCn10hdRzcp3WifvwlC+Ypj/UnPvACSDIGJ8zFmrfJChekHa6xUPVdatUyftLgMRYjCj+swVt0bbQ10T/85rcKxI4FTnHzu+ZVpX81BEEO1VkG7ryJoV9bqPS3ycImRRLFzj2vqUah/GHu5j4dFsugPwIESIFzTvIm1bfIcZHyTIsp2zg9f24ldB37/hbVQ7+c3EPkpEBKrO0lI8kuEogPKtQqVYItiyed07wyyhkXmG6HZ46mT6Ojm3KCnYm5yOMQv3wDHGeLep/pQ91Vqctd9CKEA/TtmRYI8bnt82ik28jX8UJJ44Ecs+fV9+tigcNFRZv1LUMxnv01BhPI5IBqBApDKLEAy/71UJQVLkkP6RT7MNeOkZnuNm/hZunulmXCtWHq+r/XiQ2phLAQlEUdPQBia18gsctAxHxMU20pNitNoX8msPmyGO46b+Dy+u+qz+L9/b93dvFlT2RMmWlRWvW2jiyDjciUdhY1UTFpIxtK0cLiqDOwdnZtCtNpZEYZD4vNw9IzJVuLvNJckwn0FGQtJdsHksgJeBT6HZLubS6me3KnhOhZStw1WEkPNKzKLjfxtV1KiXi1gtbgw2W9l9e/sVWSjaYkcHAURXJH/R4D2Kyo97QbfTFJtKwZ0ivNaIK+dvgnaSQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6506007)(26005)(33656002)(7696005)(9686003)(122000001)(8936002)(86362001)(38070700005)(38100700002)(55016003)(54906003)(83380400001)(110136005)(52536014)(5660300002)(7416002)(508600001)(316002)(66446008)(66946007)(66476007)(64756008)(71200400001)(8676002)(76116006)(66556008)(2906002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGZoQll5UXlvQ2dUUTYwY1lxNmQzSWpUMnJvQ2JLTFZLZ3dYRGw5dUN4TmlY?=
 =?utf-8?B?YzV4RXUvcWlQcHA1elZTMUREL0ZucUdmdGxVNWd1N2N3S1l1VnU2dmkrZ1l0?=
 =?utf-8?B?TDFMS2JYSWw4Z2xLdm1ia2dlcm9DMGE3ZXQ5Tlh6NzYzNmVaaEZpMlF4K2l3?=
 =?utf-8?B?N1BRRlFVUUtYNFQxVXhnKzJ0dG01aWlNSU1aUzNhRENEMkxFNHNaYWpWRGtv?=
 =?utf-8?B?WHFxelAwM2RIbS9xVll2enRFN2kvdDhlWUV1cEE2K1NQQUpvd2xlWkVRb3Av?=
 =?utf-8?B?enNKT1k2NERsSzRONGFiNXY4RDRkeWJMVEFTZ3hGNmZIMHRMMmpZS0JUMlU2?=
 =?utf-8?B?VlR2T3kya2RWMHB5ekpqc1Uwd3lIN1NKaTFQKy9HYXNCZ1Q1TlZqSmtROVNi?=
 =?utf-8?B?SWFWbGorVXU4SHFWQXB1ZGdZK3lUS2k3WDB1MCszTDh2QjRISjdtZmtsUzh6?=
 =?utf-8?B?dTBLRlVHSzhtYmlwMGRDS01wc0JLdmplM0hnMEljSW5ObytFdnpZS013S0Ey?=
 =?utf-8?B?V3RQYjJ4TjNVdmVxQlJtS0hIZzVBaS80UnhrdDlaV01kT3VseStKZHRNZWFD?=
 =?utf-8?B?YUhON0YrMGtqM0lNbGc3K3JpRFI5RFdMSFNjOVdYbVNZREdyb0tTRFkvVmZv?=
 =?utf-8?B?WitGbmQwRXV6Qzh4ZjhTVEVVd2NuakkvN0dYODBFOUhkT2M3SzlyOG5CM1dI?=
 =?utf-8?B?czRUYk9kdHY2RVl0TFNIQzNrcWRLQXRIWlY2d2dsK21uVUlBMVRBdXJDajJr?=
 =?utf-8?B?cGVZSUphUTVBRGtxRVRkWmlCNldJQXpBMjRjN0d0YnpXRTNqeGVJRklDZGh4?=
 =?utf-8?B?bzkwOW5Nc3BpdmFKY1VjclZaOGJteGxZaHU2bmNodGFHdmxIWWhDUStHREdF?=
 =?utf-8?B?RXFGQ3lBWDI1ZkwxS0FSN2tpQ1VWN0dXN1krZGpveHVTc0tqdHZ4NVJXRDY2?=
 =?utf-8?B?bG5sR09IOElST2xSKzVnSUVvL3A3ZGhTUG1yTDhBWWhTZXRPWng0cllONldK?=
 =?utf-8?B?QkEvKzAvcEJ6b1ZNTGwwOVh3T3VaYXpJU0xGNFVMajVJR2daRUo1Y2N4UnFj?=
 =?utf-8?B?SWRYUWZNNnRUN1A0WDFNYmVyUXh2dUloM0J4b3NMQWd3THg1eklpOXlrU2JB?=
 =?utf-8?B?d2svbjBkWEU0ZUxnQThyaHc2R0w5QkNDZ2JvWGpkWVZMS0hLbDlOUDFTWWxs?=
 =?utf-8?B?ZFUwZjJMN3lscXRrbmNteTJSZnN2dlREMkp3N29DMzI0dXNxeXN4Q1VRUkVs?=
 =?utf-8?B?Z1VvMkxMRFpLRXRIc1J2V3Z4a0pJSFVkOXRkWnNRdlJGQVRsN2d2cXBIaFh0?=
 =?utf-8?B?TWxiZVhkb3h1STJkMHJhMjRUNlFRRmJMSnJ0a2tZcXdjM3lQblpiQkc0c01O?=
 =?utf-8?B?RXlBT0lKUnQrOFFCQUd5NkY4REN4RFhMRDM2Q0dxQmNxaTZJZXBtNnVMcnFv?=
 =?utf-8?B?d3Fwb0ZyWm5PdkVScklGSEkzWDVYT0tHMVZ3WXVhZHFsQlBXcTljQmxOOVBp?=
 =?utf-8?B?TkYrTXFreFlGWjNWbUdkNVRaTFZ5cDZ4OEFuZi9RRUV0ZERxUVRjeGNnYTFo?=
 =?utf-8?B?eXI3YVFSbzVBckN3RkhYcWliSHhFemFUNlRUb3d0SVVDd1hoaGk2Y2Y3NDVQ?=
 =?utf-8?B?N0VqWEF1dVpER3p5bUMyV21Na0RLbjQybHlzekUvLzFzZE5WaUJRb0xCV05L?=
 =?utf-8?B?SSsrc3BRQlYrdWphdjlrS2xXcElYZi9rU2pZVjhlWURJU0tFUzdxT1hpWGln?=
 =?utf-8?B?eTJMSlNGYjJ1Zk5meHhud2dzTmxyR1JReFdIemF5M1NuTktubElUallWTlpw?=
 =?utf-8?B?STAwR0YyU0QxQk9TT2dnUjJJcHVqbk5kaTMzWU0yRG8xWjBzMEJ4bUk0TjFB?=
 =?utf-8?B?YzhwNUxKR3VIMjRHNEtZdjJQUGJVOHpPcTRJa0xYa2F3dTlUUFBLdHEzOFRF?=
 =?utf-8?B?Z2RPYzZkTUtwVXAvcVpnRFM0djI0UGxIVnlqaEFHaHUyTkpvOG1uK2RvQWtj?=
 =?utf-8?B?MTZvcEQzZzhoRzA2a094NmU2Y0QwQkhvdjBrZGZNbVZORzZqd0x3Nm1yaWxw?=
 =?utf-8?B?MG9waTkzTzlBWlNOYWZSSVV1VW9TSnp6RFNBSWdobnN2N3RvZWROb3E3Y0lw?=
 =?utf-8?B?SEI0RExlS2ZSLzJ3b0VMZFIzOUZYNlFSSU9xS24wdzdBSHFKV2RGa0pZL0hG?=
 =?utf-8?B?NUNTOEtMZUZSNmJJcWhJQUFBbmlJVVd5OUhtQTNSUEpsWlFLVTZDRjNYcUY5?=
 =?utf-8?B?by91QWZud2VnTFpHUWI2OE1ta0xYeVRGN2NLWUNQQVZBRmtldEcrYlAySFo1?=
 =?utf-8?B?MmNUZm01dVMrZFVNbmVUUnowNnhOSWtxOHhlUlh4cWVtdVpCTG1LZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25f7260-ded6-4afc-4217-08da2ec7af9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 18:47:20.5500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lvC3a1lWP/vHW+GTclxsOIq0A6SSa7FtkG2OJoDA2wh3zJZClfe3MLb5ibANDqqlWntCUS8Wu7lkR4B0vZao6HddPeGSMV6d/wK6y3xKyg=
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
Cc: Rob Clark <robdclark@chromium.org>,
 "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Kishon Vijay Abraham I <kishon@ti.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PlF1b3RpbmcgU2Fua2VlcnRoIEJpbGxha2FudGkgKDIwMjItMDUtMDUgMTE6MDI6MzYpDQo+PiA+
Pg0KPj4gPj4gUXVvdGluZyBEb3VnbGFzIEFuZGVyc29uICgyMDIyLTA0LTI1IDE0OjA2OjQyKQ0K
Pj4gPj4NCj4+ID4+IEhhdmluZyAnYScgaW4gJ3ZkZGEnIHR5cGljYWxseSBtZWFucyAnYW5hbG9n
JyBmb3IgJ2FuYWxvZycNCj4+ID4+IGNpcmN1aXRzLCBzbyBJJ2QgZXhwZWN0IHRoaXMgdG8gb25s
eSBtYXR0ZXIgZm9yIHRoZSBwaHkgdGhhdA0KPj4gPj4gY29udGFpbnMgdGhlIGFuYWxvZyBjaXJj
dWl0cnkuIEl0IHdvdWxkIGJlIGdyZWF0IHRvIHJlbW92ZSB0aGUNCj4+ID4+IHJlZ3VsYXRvciBj
b2RlIGZyb20gZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9wb3dlci5jIGFuZCBtb3ZlDQo+dGhl
DQo+PiA+PiByZWd1bGF0b3Jfc2V0X2xvYWQoKSBjYWxsIHRvIHRoZSBwaHkgZHJpdmVyIGlmIHBv
c3NpYmxlLiBIb3BlZnVsbHkNCj4+ID4+IHFjb20gZm9sa3MgY2FuIGhlbHAgY2xhcmlmeSBoZXJl
Lg0KPj4gPg0KPj4gPkludGVyZXN0aW5nLiBPZGRseSBlbm91Z2gsIHRoZSBzYzcyODAgZGF0YXNo
ZWV0IGRvZXNuJ3QgbGlzdCB0aGUgIl9BIi4NCj4+ID5JdCBjYWxscyB0aGVzZSAiVkREX1ZSRUZf
MFA5IiBhbmQgIlZERF9WUkVGXzFQMiIuIEhvd2V2ZXIsIG9uIHRoZQ0KPj4gPnNjaGVtYXRpYyBp
biBmcm9udCBvZiBtZSBzb21lb25lIGxhYmVsZWQgdGhlc2UgcGlucyBvbiB0aGUgc2M3MjgwDQo+
PiA+d2l0aCB0aGUgIkEiLiAuLi5hbmQgdGhlIGRyaXZlciBsb29rcyBmb3IgYSBzdXBwbHkgd2l0
aCB0aGUgImEiLiA6LS8NCj4+ID4NCj4+ID5JdCB3b3VsZCBiZSBnb29kIHRvIGdldCBjbGFyaWZp
Y2F0aW9uIGZyb20gc29tZW9uZSB3aXRoIGJldHRlcg0KPmluZm9ybWF0aW9uLg0KPj4gPg0KPj4g
Pi1Eb3VnDQo+Pg0KPj4gT3VyIGludGVybmFsIHBvd2VyIGdyaWQgZG9jdW1lbnRzIGxpc3QgdGhl
IHJlZ3VsYXRvcnMgYXMgVkREX0FfKl8xUDINCj4+IGFuZCBWRERfQV8qXzBQOSBmb3IgYWxsIHRo
ZSBwbGF0Zm9ybXMuDQo+DQo+RG8geW91ciBpbnRlcm5hbCBwb3dlciBncmlkIGRvY3VtZW50cyBp
bmRpY2F0ZSB3aGF0IHRoZXNlIHN1cHBsaWVzIGFyZQ0KPnBvd2VyaW5nPyBUaGUgcXVlc3Rpb24g
aXMgaWYgdGhlc2Ugc3VwcGxpZXMgcG93ZXIgYW55IG9mIHRoZSBsb2dpYyBpbnNpZGUgdGhlDQo+
ZURQIGNvbnRyb2xsZXIgb3IgaWYgdGhleSBvbmx5IHN1cHBseSBwb3dlciB0byB0aGUgYW5hbG9n
IGNpcmN1aXRzIGluIHRoZSBlRFANCj5waHkuIElmIGl0J3MgdGhlIGVEUCBwaHkgb25seSB0aGVu
IHRoZSByZWd1bGF0b3IgdXNhZ2UgaW4gdGhlIGVEUCBkcml2ZXIgc2hvdWxkDQo+YmUgcmVtb3Zl
ZC4gSSB3b3VsZCBzdXNwZWN0IHRoaXMgaXMgdGhlIGNhc2UgYmVjYXVzZSB0aGUgY29udHJvbGxl
ciBpcw0KPnByb2JhYmx5IGFsbCBkaWdpdGFsIGxvZ2ljIGFuZCBydW5zIGF0IHRoZSB0eXBpY2Fs
IDEuOFYgdGhhdCB0aGUgcmVzdCBvZiB0aGUgU29DDQo+dXNlcy4gU2ltaWxhcmx5LCB0aGVzZSBh
cmUgdm9sdGFnZSByZWZlcmVuY2VzIHdoaWNoIHNvdW5kIGxpa2UgYSBQTEwgcmVmZXJlbmNlDQo+
dm9sdGFnZS4NCj4NCj5QbGVhc2UgY2xhcmlmeSB0aGlzIGZ1cnRoZXIuDQo+DQoNCkZvciB0aGUg
RFAgZHJpdmVyIHVzaW5nIHRoZSB1c2ItZHAgY29tYm8gcGh5LCB0aGVyZSB3ZXJlIGNhc2VzIHdo
ZXJlIHRoZSB1c2IgZHJpdmVyDQp3YXMgdHVybmluZyBvZmYgdGhlIHBoeSBhbmQgcGxsIHJlZ3Vs
YXRvcnMgd2hlbmV2ZXIgdXNiLWRwIGNvbmN1cnJlbnQgbW9kZSBuZWVkIG5vdCBiZSBzdXBwb3J0
ZWQuDQpUaGlzIGNhdXNlZCBwaHkgYW5kIHBsbCB0byBiZSBwb3dlcmVkIGRvd24gY2F1c2luZyBh
dXggdHJhbnNhY3Rpb24gZmFpbHVyZXMgYW5kIGRpc3BsYXkgYmxhbmtvdXRzLiANCkZyb20gdGhl
biBvbiwgaXQgYmVjYW1lIGEgcHJhY3RpY2UgZm9yIHRoZSBjb250cm9sbGVyIGRyaXZlciB0byB2
b3RlIGZvciB0aGUgcGh5IGFuZCBwbGwgcmVndWxhdG9ycyBhbHNvLg0KDQo+Pg0KPj4gU28sIGFz
IGEgcHJhY3RpY2UsIHdlIHB1dCB0aGUgc2FtZSBuYW1lIGluIHRoZSBEVCBmaWxlcy4gSGVuY2Us
DQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IFNhbmtlZXJ0aCBCaWxsYWthbnRpIDxxdWljX3NiaWxsYWth
QHF1aWNpbmMuY29tPg0KPj4NCg==
