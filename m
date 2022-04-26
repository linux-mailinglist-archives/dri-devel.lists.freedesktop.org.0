Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24450EE62
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 03:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301D710E356;
	Tue, 26 Apr 2022 01:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1615910E92B;
 Tue, 26 Apr 2022 01:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650938346; x=1651543146;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oyFAu1dz9Vgmn0mnsFNqJ+duogmT17B23gUvlCmkcAY=;
 b=vFSeikvyaNRjUKe1jWrKpNI+p88/dhYwuZYQsSTJvZpgVxt4BEdwT0Bf
 e/4t8jFCpffc4/2jC1vbIZLAnmCfVSZBxMOCgpQ33IbE4ksLLGKNfsCnN
 YVBFsIb7WV2dr/DVwK/I4OszvScpcdhIgU8yls4fLaPXlcLFNHp6VcT8E 8=;
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 01:59:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMdkHY+ezGNsYWyZTBXmUBdSBDZZY+vnc27js0PudRPXEVdXBnrfZiKgMZMx+3IEztkUdV3e2SWkG1OgLoQMesfF4ir4bH79eHBF/i6olGOKv8eZSVNboJUzW2S9aMXSP99KcILrHMe5tOeGVUxGh5il47Ak9wRekgyU/VEI/zp5RM8lsiM1D3Eemk11AbNSsE8mWUPg1m73wt2y1Nbmcdf8zlLfeCJOT0s5/alhfs+ROg0STu/Ks0v2HEyTUZzNRnZvltydKnHbpb2FhI+xy9/GfhI1bXIHNvM4bFlTbfrpTM01PMGXCiFCylvaYVUhWcOylZYU8ouzvNbLa8fOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyFAu1dz9Vgmn0mnsFNqJ+duogmT17B23gUvlCmkcAY=;
 b=UrqfklSf/Sp22s884FFIseRPvLfcZDLLu24E1s6X2GDo7NhEDAkHy9VjAXh20dDaB0yhy1mUOKLTPXFTisnWoTXus6lnYCYxZEQIYkIuPV0Lb8fgkOMB8TeUNbtyLzy9Rg8dlZDt02MQIHHLISstnosaCWAG0AZpN5idFqTVFk1uSPf3yK7ulUItvG+IU76JZEnzUP/LIYFW3Y9acfLGQIA5OCmNmhvSop2e9+sFLsVVGFDwWg6RYZETZXGu/HGEzUln/po7WOZY+ugLrpVetlkUPy3svIyBDMpctD9a0Q7aSp+D5+qsxhsL2okvzY04IUvNGaXXrHdiducKTVI1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by BYAPR02MB5831.namprd02.prod.outlook.com (2603:10b6:a03:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 01:58:59 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 01:58:59 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v9 1/4] drm/msm/dp: Add eDP support via aux_bus
Thread-Topic: [PATCH v9 1/4] drm/msm/dp: Add eDP support via aux_bus
Thread-Index: AQHYVij33cMqRc4msEyXGXlYd2OJw6z8oayAgAPCyMCAALSfgIAADOGAgABQGCA=
Date: Tue, 26 Apr 2022 01:58:58 +0000
Message-ID: <MW4PR02MB71867AB85F2F4911B5B86E9CE1FB9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n51VBDmOOworjpuB1nqVD-7055yqvn2Er5H13qgFC5R2AQ@mail.gmail.com>
 <MW4PR02MB7186108BA0131C8BFC46A219E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n51oUFkYuZ5qd2CbnaUGo2xcAjU+F0M+Kptk8b=7curH0Q@mail.gmail.com>
 <664de9f0-a9a1-9b5e-9612-06a051c85434@linaro.org>
In-Reply-To: <664de9f0-a9a1-9b5e-9612-06a051c85434@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9a888db-1c7a-4139-673c-08da27285412
x-ms-traffictypediagnostic: BYAPR02MB5831:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR02MB5831F35189684CC60CE044F59DFB9@BYAPR02MB5831.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qnRX66TQAqmWY2fCgPM6+fpvM4yIm+LBHuV9U6U60fjnQ5wPHfsTqOGc78+DDtrGfGCg9VGUEEgriOJ/lOJSnRC9PU0Iqzsf9B5haUU1W3f9dcTJcI8RX/E9mGCKCkYqMm7xki6olKLiGkdrFtpUtP0Etp2YDq3LebkFT2F/vT3S5ehUB0U/VKz5zpZ8RoHY/Cfb8ydpZEOM7T8f4rg7ESuR1On3894LHWWFmb3wSyWafdd7X2xiri02yMw4L1JvB8C4f/qp1Y8oFuHy/4RXTM7BZNfgEwEC/K1jUrmwA4GQu5f7hQ0T3fZ87FZbw/PiDU2v7Wtt9p+VHU0biWGmCy8uNTp0k83RXk/k/eo3T04c/W53bqjRCpSARQcbEuYIeMh0IOKfvN6Qsa+aHFWhGIbsH4vkpHR+nS68k+dWYOhrC5xP3ZmRjFHhrIDpSAb/JMwSNZLcIuf9l8hW/kvyQ49UtdqKOJRxmA9vwVQwYG7LUXj/Ir46L6VpYd90hQOEt3q/qtrymMn5rXeHxAy4YTqJXIcwA+FGt1o22v1BGCVoYMVZLrPSIxyX8s9C6qn+VRRXMdf0UkmiaWOrJc0ZLGUR1JvHzXKt2/jDXh2MTkVfuAXxOQRtUtXlNGhkb31enR0s8LqetWSOgtMsxQwH8QwWuVMFAu/byGXr1GMZVJb2Wq9yjtJtvN7ADTAv0rPLD9Mqe63rsBxRnHorbXdJ1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(4326008)(66446008)(71200400001)(38070700005)(5660300002)(38100700002)(66556008)(9686003)(26005)(6506007)(7696005)(2906002)(122000001)(52536014)(64756008)(66476007)(7416002)(33656002)(8676002)(8936002)(55016003)(508600001)(66946007)(316002)(186003)(76116006)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3YvUDRJRVhBM1dDNytHOWF1MjRqZnloS0FZRWlHZlhvaUhZeDdrMy85MXpU?=
 =?utf-8?B?TEwvcUU1V0FUZGxLTlVRVy8wcWUvSk0vbnJnU240NjdlRi80TFpZY0hNOWJ5?=
 =?utf-8?B?UzVDUHZ5d01sOWVsYUVtaVgwbktJNEdIT1Vhemx0ektsNDVabzRDRE5wMGsz?=
 =?utf-8?B?R3hmRGlPaXB5NjJhdXZKNnVBWnNKNDczYUlldXd3TmJVVThiQ2hLME1BUFNm?=
 =?utf-8?B?Rm12YXZyUmEwemxnTDQwU3AxWmRpaTV6aUhjQVRSQjNtZmZabENHb0d2M2JR?=
 =?utf-8?B?UExKemRoVSt1Y01ZUkJRNWtQNEJYNDF0cWRLVTV6bVgzVkdrUXZOVHZpWDdJ?=
 =?utf-8?B?aUM0NXBmVjZ1ajRtU25XSnlmZ29ldjVlSDBia2Y3R1RONWtwcU41eEdhZms3?=
 =?utf-8?B?YVcwRlhKQ1JDSUtHVk5iM2dvM0ZEYkxHa2tDdmtON2xnbzVJcEJOOTdFblpz?=
 =?utf-8?B?K1hmdE9YdzVBdnZaaG4rRjVEWFRZT3A0eFdYNWR2Q1VRMkdBdXVtT3hmK0JZ?=
 =?utf-8?B?alhBQzZIRjZBTnlZbm8xMHR5VElvblJIY2psYzZQRWlBZVZDN1g5YUE1OFhI?=
 =?utf-8?B?SWJQUnpTeHliUDFqSDBhV0s5Tnl4RDFSN2NFRDhaNzcrY2UvMEJUT3M4RHgz?=
 =?utf-8?B?OHdyQUgvcCt0YWtZSjdqcU5URURqMVk2NnpwNHYxaU0yUWNRODlxOEpDaERC?=
 =?utf-8?B?K0RncHoxSUQxMU5XYVU3bitZZHU0V1JZdXhQOGV2dTJrSFpYVmovTkRoeVR3?=
 =?utf-8?B?YVFodVVOeDUzaG5iUFUxN3NEL3lyRUdpUStjb1dva2lmMHUrWkZQeWdmcTVT?=
 =?utf-8?B?L004QXk1eWoxcVp0djRpNTZtajVmWUc5SWRHVG9sWDdvMEFwSy9uZlpGSXBT?=
 =?utf-8?B?bE5zc20vN203VmMyeUNSUmhlQm1uVDNiN2tLZmJBU2ltYnBEMmNWTzAxNTN5?=
 =?utf-8?B?QXMxMEJmcmNLUHNWSVN0cXAwcnNJdWp0MFFRMU1TUjl1Q0hyOW5tZlVTSm41?=
 =?utf-8?B?d3IvZG81bStveTFvdE5vZ0UrK2hJRVFPT2s2U2tGMWpoRjY5YU5MNmRwWnRU?=
 =?utf-8?B?dFZoUGw3OUtlRm5kSkVmeUI1bXlKKzZGTkw4Y1ArQ1ZTNXE5TFd1NU5WeFVT?=
 =?utf-8?B?K1hqYklaclQyaDBZWkdqV0VqaXk3eGQyTDhOamdmTFZwWGxsVDRpNitWbmgr?=
 =?utf-8?B?am1EWWVtMFk4c0c4Smc1RS9pQ0hlelFBQnJxOCtsTXFhU2tubUJXSlRubFlJ?=
 =?utf-8?B?NmVjL1JPNmFyelhXTWVucTBISzdFeGRsUVNQbDVSRS9oaXZQVmxzdHAzeTlE?=
 =?utf-8?B?aExmazdsdE5MNzhYcWQ5VW5HQlNabnc1VjgrTlo3UHpxSUxNS0Y4a3hDU0F3?=
 =?utf-8?B?TkFISmE3MTN2OEdjbUM5cmNPZkVqa0lIS1NZby82enRtNTk5MExjM0RuZThB?=
 =?utf-8?B?K0ZLYXEwbkcrR0Vlck1SZ2ZFL2ptMStqWjVtaUhxOUc2TXBoeWZWbDdiZGZo?=
 =?utf-8?B?bDVTUjZoSGxxcitHc2F4a3BDcDJObTJXbnd6ZU9WOFBrSjVOajJjRGpMWHFo?=
 =?utf-8?B?cnRIeDJtcU1ENGgvMXhkM0pMaE9TdThHR21NY015d1ZBNWsrU0xtYVlEZzlF?=
 =?utf-8?B?eVMyQ1BFdElzNitWVTREbkExSkNYQktGYmxUdlRiMFk1QnlNWFo5L3JlN1Zs?=
 =?utf-8?B?c2lxWmdsYlJFcnlVZTdGUk9qTmQvb1N3c0NMZVdld0FsVlppRTRxUDlrdWdv?=
 =?utf-8?B?dFhoc01nbHNBNHVjVlArRWFSdTFTOGdBUmVFSlpCR3NiN09qUWcrR3BwVDFo?=
 =?utf-8?B?RkJ2L1o4b2Ywd1kvTWlaZlladlkzZUZRTktEU1UrNmpUMVlQNE45VG1pUWJq?=
 =?utf-8?B?ZkZrOERHTENzVUVSZkxpVVZIU2U5WHNJcFdxZjQvWXRINTBuM3RtbUxYU2lW?=
 =?utf-8?B?SVYzNTlvM3VqRFkwYzVUTklXYlh5M1lFaUNQM1JnRjlEZ2xsL0JtemFXQXZS?=
 =?utf-8?B?M0VHWENrcE53REZTOCtFOXh4ODI3TjZ6Z1FCejlBdHN1SmJDSldBU0tqenlP?=
 =?utf-8?B?T2NIbFVDVk5yMEhSOUhTRXFPYTR0K3d2YnpyNFZCVzdyWXdadHBtQnJrdVpt?=
 =?utf-8?B?S2tDS1RkQi9pOGJmZ3NraEtYVDlnSU1FVkgxdG5QNS80elc5dFEwN1JvYjA1?=
 =?utf-8?B?eTJSSkxBS21BUEpnNWxtMTFGazFFMFdpSkJIelArcHJzZ09UcExoS1BUN3cw?=
 =?utf-8?B?OGF4dE9nL0xuYjFCOUpMQVlIQjFSYnJvQXlZTG9WMjRMQ3htWEJoUEZja2h1?=
 =?utf-8?B?Q1hFTzVxS3J2VWVkMlZVMXlJUlMrUVBCanhkSEJDU0ozSExLL2UyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a888db-1c7a-4139-673c-08da27285412
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 01:58:58.8701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4JOatIiAsZsqWzaBc/VvknDdJeURGMOAtwob7BBCc5PbIMjbqqQFOEYcjgolEirC6dCRAjAH6AwX+ah/kNi0jXPJikkLn5IKOONGWHAeBg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5831
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
 "dianders@chromium.org" <dianders@chromium.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Abhinav
 Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>, "steev@kali.org" <steev@kali.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Aravind
 Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlcGhlbiwNCg0KPj4+PiBRdW90aW5nIFNhbmtlZXJ0aCBCaWxsYWthbnRpICgyMDIyLTA0
LTIyIDAyOjExOjAzKQ0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAv
ZHBfZGlzcGxheS5jDQo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5j
DQo+Pj4+PiBpbmRleCBkN2ExOWQ2Li4wNTU2ODFhIDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZHAvZHBfZGlzcGxheS5jDQo+Pj4+DQo+Pj4+IFNvbWUgbml0cGlja3MNCj4+Pj4NCj4+
Pj4gUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4NCj4+Pj4N
Cj4+Pj4+IEBAIC0xNTA4LDcgKzE1MDksOCBAQCB2b2lkIG1zbV9kcF9pcnFfcG9zdGluc3RhbGwo
c3RydWN0IG1zbV9kcA0KPj4+Pj4gKmRwX2Rpc3BsYXkpDQo+Pj4+Pg0KPj4+Pj4gICAgICAgICAg
ZHBfaHBkX2V2ZW50X3NldHVwKGRwKTsNCj4+Pj4+DQo+Pj4+PiAtICAgICAgIGRwX2FkZF9ldmVu
dChkcCwgRVZfSFBEX0lOSVRfU0VUVVAsIDAsIDEwMCk7DQo+Pj4+PiArICAgICAgIGlmICghZHBf
ZGlzcGxheS0+aXNfZWRwKQ0KPj4+Pj4gKyAgICAgICAgICAgICAgIGRwX2FkZF9ldmVudChkcCwg
RVZfSFBEX0lOSVRfU0VUVVAsIDAsIDEwMCk7DQo+Pj4+DQo+Pj4+IERpZCBpdCB0dXJuIG91dCB0
aGF0IGluIGZhY3QgRFAgaXNuJ3QgcmVhZHkgc3RpbGwgdG8gc2V0dXAgZXZlbg0KPj4+PiBhZnRl
ciBkZWxheWluZyB0aGUgaXJxPw0KPj4+Pg0KPj4+DQo+Pj4gVGhlIGhvc3RfaW5pdCwgY29uZmln
X2hwZCwgcGh5X2luaXQgYW5kIGVuYWJsZV9pcnEgYXJlIGhhcHBlbmluZyBpbg0KPm1vZGVzZXRf
aW5pdCBhbHJlYWR5IGZvciBlRFAuDQo+Pj4gU28sIEkgYW0gbm90IHNjaGVkdWxpbmcgdGhlIEVW
X0hQRF9JTklUX1NFVFVQIGV2ZW50IGZvciBlRFAuIEkgYW0gbm90DQo+bW9kaWZ5aW5nIHRoZSBk
ZWxheSBmb3IgRFAuDQo+Pg0KPj4gQ29vbC4gVGhhdCBkaWRuJ3QgYW5zd2VyIG15IHF1ZXN0aW9u
IHRob3VnaC4gV2h5IGRvZXMgRFAgc3RpbGwgbmVlZA0KPj4gdGhlIGRlbGF5PyBJIHRob3VnaHQg
cmVjZW50IGNoYW5nZXMgbWFkZSBpdCB1bm5lY2Vzc2FyeS4NCj4NCj5JJ2Qgc2F5IHRoYXQgaWYg
aXQgaXMgbm90IG5lY2Vzc2FyeSwgaXQgc2hvdWxkIGJlIGNoYW5nZWQgaW4gdGhlIHNlcGFyYXRl
IGNvbW1pdC4NCj5UaGUgcXVlc3Rpb24gaXMgdmFsaWQgbmV2ZXJ0aGVsZXNzLg0KPg0KDQpZZXMs
IHRoYXQgaXMgcmlnaHQuIFRoZSBkZWxheSBpcyB1bm5lY2Vzc2FyeSB3aXRoIHRoZSByZWNlbnQg
Y2hhbmdlcy4NCkxpa2UgRG1pdHJ5IHJpZ2h0bHkgc3VnZ2VzdGVkLCB3ZSB3aWxsIHJlbW92ZSB0
aGUgZGVsYXkgaW4gYSBzZXBhcmF0ZSBjb21taXQuDQoNCj4NCj4tLQ0KPldpdGggYmVzdCB3aXNo
ZXMNCj5EbWl0cnkNCg==
