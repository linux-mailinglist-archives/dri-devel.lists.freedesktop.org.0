Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5F50DCED
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 11:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD6D10E091;
	Mon, 25 Apr 2022 09:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8331210E091;
 Mon, 25 Apr 2022 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650879588; x=1651484388;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=74UZ+H85QldEoiTDk+6NxQU6J1i7uL5ZEdummYvHPn8=;
 b=dlJjPddogaC2Jm340JMCsrwFVAnP4Z3O6DnqyXr2KLYnk6IwF2RLLwDC
 3VKcg0v+C1MYRdJxM2zjXi9ZA9DX220+wQHwoREqK+iclvdwiofVV5YMx
 XURecM5FRzyC2i6fS3FP5+/yy9S2TMTBg8G6boPLxzdh88qKIlVgYhw1U g=;
Received: from mail-dm3nam07lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 09:39:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/MHC9jF2tP01jxUq8UK38sYtCUKNbve+ex5N6QM41QebHnWOGK35iPt9Now5mx+n90FIlZhPLHdIiZN7H9wcCcoogt3EOC/EuZq26tlEQeVnWvwLkohf4OCCF6lJWWCEt2Fz5VuFKS1iPzXs3xCDmp4GDW7e5yaiil8s7IYMml9VQKU1MBoConv5p8UOGBSkuzkm0VrZLvYhlqynfCIV4rPUIFSwtWXGrsFVxzv7xcMo83t1hluX3fS6tzuTN8ZDpX34PtevDQ9HWjY087pvtRPteYtRV3GpIi/SbfaUvejL83bZ8cMyJFX82sN5p7rb0gIwH/zypzvTx+QAHLZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74UZ+H85QldEoiTDk+6NxQU6J1i7uL5ZEdummYvHPn8=;
 b=WTuwSrY4YemZ2oA3sTiXaPgSoiizxBnp5MlhkRuTIqLsJlmOI3BGxRzd1BvQDFe+VMfY1elciCFHPfe6jlbmkvzhhJxF6iZZf9c15nK+5JazNcv18LHLjDtSxsjCojVEjmt1gcYvC+JtRaOzwHly34e9CeZzH2sMmB5nyoVYx8JQ9n7MIqdsX3MgTdC/ZTp592IeSm3ZrdjUYBXZmgh4FWfX6/fQ64pW+ahcfH4mMuG9TUh7LzJh3TTapNDqtuB0cR9NhqfDBx/tJVgvRorx5ZHCL0WUwLWgZDqCqnmtM5hQELMRJ1DlgW1ZFKN10GQva6/ptZdP8LPwMy+58cxtIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by CH0PR02MB8179.namprd02.prod.outlook.com (2603:10b6:610:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 09:39:44 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 09:39:44 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v9 1/4] drm/msm/dp: Add eDP support via aux_bus
Thread-Topic: [PATCH v9 1/4] drm/msm/dp: Add eDP support via aux_bus
Thread-Index: AQHYVij33cMqRc4msEyXGXlYd2OJw6z8oayAgAPCyMA=
Date: Mon, 25 Apr 2022 09:39:43 +0000
Message-ID: <MW4PR02MB7186108BA0131C8BFC46A219E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n51VBDmOOworjpuB1nqVD-7055yqvn2Er5H13qgFC5R2AQ@mail.gmail.com>
In-Reply-To: <CAE-0n51VBDmOOworjpuB1nqVD-7055yqvn2Er5H13qgFC5R2AQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c3b5880-fc07-47ab-45aa-08da269f8770
x-ms-traffictypediagnostic: CH0PR02MB8179:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR02MB8179F21F814B1F839034F2AF9DF89@CH0PR02MB8179.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w511Sba6bcJFieMcexxe3zs6yb+mvoavnWwZnDR2UXTNicmxKDcEApoWBsn4KoYFzPQWJJb2i9CEC+BHMM6yKNdf0BxmHznLgKVWKeQVWIVrWP8w9HrL2zMmYYxgqKQ+8tNU2VmHDkigzcCe2Tk1AmXNFwUhMK8ViJv6w7khz/JuhNQ5K2Dvh0+Tt+rGV6u+ypp22Slxqt5jtNp9/wiLXaqdG0e3WUn2VBtXN3QAH/l1WZco2H5GMHjO2zi521wMhk5ei2+g7S6n0+e6iVHYwdbP7U+AB7KcGJXGRS/1A0T9306ZCgI45QFwI4JArKzxzC2SKSqd94r/N6OVx6KBwe7g/zMsgb2DAyAUd84jOoXCCTeIGSfucpWR2udZ8iLluas59dTlA2EnL2PHKmAocbgTHWfUm4SmoZ5lZjRRUJ9ChjzOSsGTOgVoziZEAjMVqhZ/gCBK00O/3tE9nxPrfyYBrMFUl03GS7mxd824uQNrY+b3nS4F5eDYpp3lS0aBCuFMcefiVsU0T+P4u/KB0HBrN4Cwq7HkRMrpILRnk+8v013HHsdkGOKEvjrkKiebitMOJOCbIuU7jr8XJjhE7h1DLO42WGqVFUxXKudzUJqJ/U2HTS2TcoPqI8ZOV6amBRD2lXYcd+BvUc0WK67c8D2yz3mEY5vtLRzLe/Ve+OSX6E5u+pWu7KCYUene6ITYANvTNHDe4fl1GeZSPByA5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(86362001)(2906002)(38070700005)(508600001)(76116006)(66946007)(4326008)(66556008)(8676002)(64756008)(66446008)(66476007)(71200400001)(55016003)(7416002)(5660300002)(54906003)(316002)(110136005)(8936002)(52536014)(26005)(9686003)(83380400001)(6506007)(186003)(7696005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDRJYW1weWR1dVNJNVhpanhJaEVkeC9wdmJJNUZDYkdPMXhKRU4wNWZRUjE4?=
 =?utf-8?B?Vm5ZTWVEeGM5N3N6NUUydWx3amUwMmtNN3gwTCttMk9XamhIczdYWGxBTHJi?=
 =?utf-8?B?dmV0cGpobzE0V2JLWXV1blJGYmw2ZG1lK1duS0w1dllKMkxEcy95NUd0QUNw?=
 =?utf-8?B?emxuejF4V0VkaVRab1FJTG13SDE1K1FpVW5XN0FXVVMwcW5KRnZzWFo2Mlpq?=
 =?utf-8?B?REhHY0lvdFJGNmd4Rk1TWHJheWhzMitmTXNnTTd2RjhXbnlSUk10VkRwdjJJ?=
 =?utf-8?B?anIxOFVOTzIzSk8xK3FVZTNXMjZ5aGovK3c0YTQrYjNQbzY5NFU2ZEZnUjJa?=
 =?utf-8?B?K1hBR3pXWmFoRlVsckhTM1NBbGR4Q2Mxc3hPWTJmWE1OdUIzVXNxSVNjNW1p?=
 =?utf-8?B?MjdkUUVDTFZBR2ZtUG50ZkVyWWlUbkJxbkpMc0d0d3k4U3lDek9IY3U3S2p1?=
 =?utf-8?B?Ly9CQmtXY0YvdFoyK0RpbU1aQVA0enc4RzFPaWNQSzF6WXh3SG94eUVqT1BE?=
 =?utf-8?B?N01kK21Tcy9BWCtYcUk3L0JZbkcrR2lnVFpCc1U1bm5udDZ3aDlnUGdudnJp?=
 =?utf-8?B?Kzl0UTB4VUN1UitnbGc3d0pZQXFsa3J1c1RaNU5yaVpsaVBCNVQ0Y1JMSHlZ?=
 =?utf-8?B?Qm01RjJkNkRGRThBTW94QStabTlBYjRYVTNoMHl2NUZJdGxvdkFiQy9QMEJK?=
 =?utf-8?B?eDhaTEZicDJHNlhtSzBDNlRRNmd4cjJXRXlwR1NnWTROVXM4K0hmQ2E2aXRL?=
 =?utf-8?B?RjlVa2pSZlBET09EK096aDdyUGY5Zit0RmowVEFWNWNIcVNxNENlTVpVMTY0?=
 =?utf-8?B?aG0zd2x0Y1VxRjU1cVJJR2JTLzBDb2lRZjB4NEs0b2tWTGlvVDJRSWJJbE9l?=
 =?utf-8?B?aGxxWFMrZWRGNGZWSmFDdURrcEtlYVlNLzVMYUUxQ1h2Z2dBVHpRV0xvaUhn?=
 =?utf-8?B?VEFqaFpYaVlYbVZEOWE1T244eE05Q3lTR05HSlZhMVQ1THQ1ZUJDSTl1a0VX?=
 =?utf-8?B?Kzg3dmVyQlJSMVdxQ3ViSzh2TVRhTGNTRUtoN1JYUUJhVmYrN1N5VGFlZ1I2?=
 =?utf-8?B?Z3czNWd6WGJqWXdLc012SjFmbTZ1dFhHUm1qNzcyN3d0VXNyanMrd3MwTTkx?=
 =?utf-8?B?VFFCMTRldkVYVytwRlZuSTRsNkhybVlRL2dUeUpOd29lKzhjdWk1SU5PTDZ1?=
 =?utf-8?B?SlJER0lWSGp1YWdadXkrejU1VEVVK3VRQ2xIOE5seDR5WUZnZFVpVkR3NHQy?=
 =?utf-8?B?dm05cEliekxMdHdNSlNtSmwxT2U2VWxnOUJLa1pCR2hFYVhBOWRNZEJxV2NR?=
 =?utf-8?B?aEdHckZLNDZmeVdKWkZFVnZoUWN1M3hxQ1BMNXptMnI0aDhVQmNTUFJvM1pl?=
 =?utf-8?B?b1ZmT0tZNkJFWWt6MTBCWGE3alVnbUlGcFFNOGJJQzNoV2tyRm02QmJUbWl5?=
 =?utf-8?B?OUUrMVplRGE4cHl5VVVhNFdPb2NOaVAyQmxKRHVySC9BRWVwZzZZRVpQbWNI?=
 =?utf-8?B?azJocVdTNlptWFZ5c05FZkgwVmVsbmVIOTBkbnZVTUFkUm9aYjVCYkZDTTh4?=
 =?utf-8?B?V1Bzbkg3V1doWXVWMERNZzhDTjBSbk84ODZRaXdiVkcrOGc3MkRpZzFRZEtS?=
 =?utf-8?B?S04waUJWT0xNdmY1aFJVOXRyL1hncys3UUhlTGhyRjRXZmRBbTJzUVZscVlx?=
 =?utf-8?B?Z0tZeVBjdnVYUUtKUnNkVUxFaHJzQzZKWTFVQ0FqcXI4YkUzd3FCbUxvTS90?=
 =?utf-8?B?UlBrcnZBcDFpbDFQYmw3VS9CcFRXV3JLaFQ5RFlsTG9zV0VsM3RGZ2FTQjJQ?=
 =?utf-8?B?WlhOR1p4bTVkcUw5ays1WExqYUpBT0lvM0JrejJmS0F4cEJGNCtHNlRHRzdC?=
 =?utf-8?B?UUFSckt4MEN2ajQxNzVWQmtGL25XMnB3MWRoYUlQazl3czl6dnBkZ2YvTDRp?=
 =?utf-8?B?ZzlRTmszeTIzcnJ5bzM0aUNmOC9DdDVtbm4wWTVacklvblcvRXYvUDljbC8z?=
 =?utf-8?B?czVwYU9VWnJOTWQxUDJvNk41ZEZ3TFZDVG5XZW5mclQzeTl6a2E0bWROS3Z5?=
 =?utf-8?B?YTByckhXK3hrS3VSVzFPRW9kQmsvaFhUci9NOVd2dFQ0YUxIYm1VbFk3eWZT?=
 =?utf-8?B?Y1R4REhMYk1IUHBHVVovM01QZTRFcW8wUUtLdWNHTXFxNXZmKzRSOWloL3Bh?=
 =?utf-8?B?Z00za1FDUHhkTzkzSVYvNkZ6ZEczU0NuMU13M2lYUTlZV1UwNFkwRUpKNkNq?=
 =?utf-8?B?TzhhSUNIbmtQcHZ0azd5bzYxK1R0QzBzOXVCeUZYS2lJbnhBbmFGVDlRaDFT?=
 =?utf-8?B?UEpVS0Q2M0tGM081emQyQ0ZjRzJSSjJjOGRnMGFsVzczRFcrb0ttUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3b5880-fc07-47ab-45aa-08da269f8770
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 09:39:43.9659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1LOxEmt8Is54SQ3kb/BjcseaAxf5KoZgqGztjEWpmTbdO339rvCvQEs+eyR5ihdIbIG5y1RJtT/iTjhuXB5sSeHYJQgqH8YqnmZmc0SbwXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8179
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
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlcGhlbiwNCg0KPlF1b3RpbmcgU2Fua2VlcnRoIEJpbGxha2FudGkgKDIwMjItMDQtMjIg
MDI6MTE6MDMpDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNw
bGF5LmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMNCj4+IGluZGV4
IGQ3YTE5ZDYuLjA1NTY4MWEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rw
L2RwX2Rpc3BsYXkuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5
LmMNCj4NCj5Tb21lIG5pdHBpY2tzDQo+DQo+UmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c3di
b3lkQGNocm9taXVtLm9yZz4NCj4NCj4+IEBAIC0xNTA4LDcgKzE1MDksOCBAQCB2b2lkIG1zbV9k
cF9pcnFfcG9zdGluc3RhbGwoc3RydWN0IG1zbV9kcA0KPj4gKmRwX2Rpc3BsYXkpDQo+Pg0KPj4g
ICAgICAgICBkcF9ocGRfZXZlbnRfc2V0dXAoZHApOw0KPj4NCj4+IC0gICAgICAgZHBfYWRkX2V2
ZW50KGRwLCBFVl9IUERfSU5JVF9TRVRVUCwgMCwgMTAwKTsNCj4+ICsgICAgICAgaWYgKCFkcF9k
aXNwbGF5LT5pc19lZHApDQo+PiArICAgICAgICAgICAgICAgZHBfYWRkX2V2ZW50KGRwLCBFVl9I
UERfSU5JVF9TRVRVUCwgMCwgMTAwKTsNCj4NCj5EaWQgaXQgdHVybiBvdXQgdGhhdCBpbiBmYWN0
IERQIGlzbid0IHJlYWR5IHN0aWxsIHRvIHNldHVwIGV2ZW4gYWZ0ZXIgZGVsYXlpbmcgdGhlDQo+
aXJxPw0KPg0KDQpUaGUgaG9zdF9pbml0LCBjb25maWdfaHBkLCBwaHlfaW5pdCBhbmQgZW5hYmxl
X2lycSBhcmUgaGFwcGVuaW5nIGluIG1vZGVzZXRfaW5pdCBhbHJlYWR5IGZvciBlRFAuDQpTbywg
SSBhbSBub3Qgc2NoZWR1bGluZyB0aGUgRVZfSFBEX0lOSVRfU0VUVVAgZXZlbnQgZm9yIGVEUC4g
SSBhbSBub3QgbW9kaWZ5aW5nIHRoZSBkZWxheSBmb3IgRFAuDQoNCj4+ICB9DQo+Pg0KPj4gIHZv
aWQgbXNtX2RwX2RlYnVnZnNfaW5pdChzdHJ1Y3QgbXNtX2RwICpkcF9kaXNwbGF5LCBzdHJ1Y3Qg
ZHJtX21pbm9yDQo+PiAqbWlub3IpIEBAIC0xNTMwLDYgKzE1MzIsNjUgQEAgdm9pZCBtc21fZHBf
ZGVidWdmc19pbml0KHN0cnVjdA0KPm1zbV9kcCAqZHBfZGlzcGxheSwgc3RydWN0IGRybV9taW5v
ciAqbWlub3IpDQo+PiAgICAgICAgIH0NCj4+ICB9DQo+Pg0KPj4gK3N0YXRpYyBpbnQgZHBfZGlz
cGxheV9nZXRfbmV4dF9icmlkZ2Uoc3RydWN0IG1zbV9kcCAqZHApIHsNCj4+ICsgICAgICAgaW50
IHJjOw0KPj4gKyAgICAgICBzdHJ1Y3QgZHBfZGlzcGxheV9wcml2YXRlICpkcF9wcml2Ow0KPj4g
KyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmF1eF9idXM7DQo+PiArICAgICAgIHN0cnVjdCBk
ZXZpY2UgKmRldjsNCj4+ICsNCj4+ICsgICAgICAgZHBfcHJpdiA9IGNvbnRhaW5lcl9vZihkcCwg
c3RydWN0IGRwX2Rpc3BsYXlfcHJpdmF0ZSwgZHBfZGlzcGxheSk7DQo+PiArICAgICAgIGRldiA9
ICZkcF9wcml2LT5wZGV2LT5kZXY7DQo+PiArICAgICAgIGF1eF9idXMgPSBvZl9nZXRfY2hpbGRf
YnlfbmFtZShkZXYtPm9mX25vZGUsICJhdXgtYnVzIik7DQo+PiArDQo+PiArICAgICAgIGlmIChh
dXhfYnVzICYmIGRwLT5pc19lZHApIHsNCj4+ICsgICAgICAgICAgICAgICBkcF9kaXNwbGF5X2hv
c3RfaW5pdChkcF9wcml2KTsNCj4+ICsgICAgICAgICAgICAgICBkcF9jYXRhbG9nX2N0cmxfaHBk
X2NvbmZpZyhkcF9wcml2LT5jYXRhbG9nKTsNCj4+ICsgICAgICAgICAgICAgICBkcF9kaXNwbGF5
X2hvc3RfcGh5X2luaXQoZHBfcHJpdik7DQo+PiArICAgICAgICAgICAgICAgZW5hYmxlX2lycShk
cF9wcml2LT5pcnEpOw0KPj4gKw0KPj4gKyAgICAgICAgICAgICAgIC8qDQo+PiArICAgICAgICAg
ICAgICAgICogVGhlIGNvZGUgYmVsb3cgYXNzdW1lcyB0aGF0IHRoZSBwYW5lbCB3aWxsIGZpbmlz
aCBwcm9iaW5nDQo+PiArICAgICAgICAgICAgICAgICogYnkgdGhlIHRpbWUgZGV2bV9vZl9kcF9h
dXhfcG9wdWxhdGVfZXBfZGV2aWNlcygpIHJldHVybnMuDQo+PiArICAgICAgICAgICAgICAgICog
VGhpcyBpc24ndCBhIGdyZWF0IGFzc3VtcHRpb24gc2luY2UgaXQgd2lsbCBmYWlsIGlmIHRoZQ0K
Pj4gKyAgICAgICAgICAgICAgICAqIHBhbmVsIGRyaXZlciBpcyBwcm9iZWQgYXN5bmNocm9ub3Vz
bHkgYnV0IGlzIHRoZSBiZXN0IHdlDQo+PiArICAgICAgICAgICAgICAgICogY2FuIGRvIHdpdGhv
dXQgYSBiaWdnZXIgZHJpdmVyIHJlb3JnYW5pemF0aW9uLg0KPj4gKyAgICAgICAgICAgICAgICAq
Lw0KPj4gKyAgICAgICAgICAgICAgIHJjID0gZGV2bV9vZl9kcF9hdXhfcG9wdWxhdGVfZXBfZGV2
aWNlcyhkcF9wcml2LT5hdXgpOw0KPj4gKyAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGF1eF9i
dXMpOw0KPj4gKyAgICAgICAgICAgICAgIGlmIChyYykNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZXJyb3I7DQo+PiArICAgICAgIH0gZWxzZSBpZiAoZHAtPmlzX2VkcCkgew0KPj4g
KyAgICAgICAgICAgICAgIERSTV9FUlJPUigiZURQIGF1eF9idXMgbm90IGZvdW5kXG4iKTsNCj4+
ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+ICsgICAgICAgfQ0KPj4gKw0KPj4g
KyAgICAgICAvKg0KPj4gKyAgICAgICAgKiBFeHRlcm5hbCBicmlkZ2VzIGFyZSBtYW5kYXRvcnkg
Zm9yIGVEUCBpbnRlcmZhY2VzOiBvbmUgaGFzIHRvDQo+PiArICAgICAgICAqIHByb3ZpZGUgYXQg
bGVhc3QgYW4gZURQIHBhbmVsICh3aGljaCBnZXRzIHdyYXBwZWQgaW50byBwYW5lbC0NCj5icmlk
Z2UpLg0KPj4gKyAgICAgICAgKg0KPj4gKyAgICAgICAgKiBGb3IgRGlzcGxheVBvcnQgaW50ZXJm
YWNlcyBleHRlcm5hbCBicmlkZ2VzIGFyZSBvcHRpb25hbCwgc28NCj4+ICsgICAgICAgICogc2ls
ZW50bHkgaWdub3JlIGFuIGVycm9yIGlmIG9uZSBpcyBub3QgcHJlc2VudCAoLUVOT0RFVikuDQo+
PiArICAgICAgICAqLw0KPj4gKyAgICAgICByYyA9IGRwX3BhcnNlcl9maW5kX25leHRfYnJpZGdl
KGRwX3ByaXYtPnBhcnNlcik7DQo+PiArICAgICAgIGlmICghZHAtPmlzX2VkcCAmJiByYyA9PSAt
RU5PREVWKQ0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOw0KPj4gKyAgICAgICBlbHNlIGlm
IChyYykNCj4NCj5KdXN0IGFuIGlmIGJlY2F1c2UgdGhlcmUncyBhIHJldHVybiBhYm92ZS4NCj4N
Cg0KT2theQ0KDQo+PiArICAgICAgICAgICAgICAgZ290byBlcnJvcjsNCj4+ICsNCj4+ICsgICAg
ICAgZHAtPm5leHRfYnJpZGdlID0gZHBfcHJpdi0+cGFyc2VyLT5uZXh0X2JyaWRnZTsNCj4NCj5J
biB3aGljaCBjYXNlIGl0IGFsbW9zdCBmZWVscyBsaWtlIGl0IGNvdWxkIGJlIHdyaXR0ZW4NCj4N
Cj4JaWYgKCFkcC0+aXNfZWRwICYmIHJjID09IC1FTk9ERVYpDQo+CQlyZXR1cm4gMDsNCj4JaWYg
KCFyYykgew0KPgkJZHAtPm5leHRfYnJpZGdlID0gZHBfcHJpdi0+cGFyc2VyLT5uZXh0X2JyaWRn
ZTsNCj4JCXJldHVybiAwOw0KPgl9DQo+ZXJyb3I6DQo+CWlmIChkcC0+aXNfZWRwKSB7DQo+DQo+
YnV0IEknbSBub3Qgd29ycmllZCBlaXRoZXIgd2F5LCBiZXNpZGVzIHJlbW92aW5nIHRoZSBlbHNl
IGZyb20gdGhlIGVsc2UtaWYuDQo+DQoNCk9rYXkNCg0KPj4gKw0KPj4gKyAgICAgICByZXR1cm4g
MDsNCj4+ICsNCj4+ICtlcnJvcjoNCj4+ICsgICAgICAgaWYgKGRwLT5pc19lZHApIHsNCj4+ICsg
ICAgICAgICAgICAgICBkaXNhYmxlX2lycShkcF9wcml2LT5pcnEpOw0KPj4gKyAgICAgICAgICAg
ICAgIGRwX2Rpc3BsYXlfaG9zdF9waHlfZXhpdChkcF9wcml2KTsNCj4+ICsgICAgICAgICAgICAg
ICBkcF9kaXNwbGF5X2hvc3RfZGVpbml0KGRwX3ByaXYpOw0KPj4gKyAgICAgICB9DQo+PiArICAg
ICAgIHJldHVybiByYzsNCj4+ICt9DQo+PiArDQo+PiAgaW50IG1zbV9kcF9tb2Rlc2V0X2luaXQo
c3RydWN0IG1zbV9kcCAqZHBfZGlzcGxheSwgc3RydWN0IGRybV9kZXZpY2UNCj4qZGV2LA0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKSAgeyBk
aWZmIC0tZ2l0DQo+PiBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfcGFyc2VyLmgNCj4+IGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9wYXJzZXIuaA0KPj4gaW5kZXggZDM3MWJhZS4uOTUw
NDE2YyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfcGFyc2VyLmgN
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfcGFyc2VyLmgNCj4+IEBAIC0xMjUs
NyArMTI1LDcgQEAgc3RydWN0IGRwX3BhcnNlciB7DQo+PiAgICAgICAgIHUzMiBtYXhfZHBfbGFu
ZXM7DQo+PiAgICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpuZXh0X2JyaWRnZTsNCj4+DQo+PiAt
ICAgICAgIGludCAoKnBhcnNlKShzdHJ1Y3QgZHBfcGFyc2VyICpwYXJzZXIsIGludCBjb25uZWN0
b3JfdHlwZSk7DQo+PiArICAgICAgIGludCAoKnBhcnNlKShzdHJ1Y3QgZHBfcGFyc2VyICpwYXJz
ZXIpOw0KPj4gIH07DQo+Pg0KPj4gIC8qKg0KPj4gQEAgLTE0MSw0ICsxNDEsMTUgQEAgc3RydWN0
IGRwX3BhcnNlciB7DQo+PiAgICovDQo+PiAgc3RydWN0IGRwX3BhcnNlciAqZHBfcGFyc2VyX2dl
dChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTsNCj4+DQo+PiArLyoqDQo+PiArICogZHBf
cGFyc2VyX2ZpbmRfbmV4dF9icmlkZ2UoKSAtIGZpbmQgYW4gYWRkaXRpb25hbCBicmlkZ2UgdG8g
RFANCj4+ICsgKg0KPj4gKyAqIEBwYXJzZXI6IGRwX3BhcnNlciBkYXRhIGZyb20gY2xpZW50DQo+
PiArICogcmV0dXJuOiAwIGlmIGFibGUgdG8gZ2V0IHRoZSBicmlkZ2UgZWxzZSByZXR1cm4gYW4g
ZXJyb3IgY29kZQ0KPg0KPnJldHVybiBjb21lcyBhZnRlciB0aGUgZGVzY3JpcHRpb24gYmVsb3cu
IEFsc28gc2hvdWxkIGJlIGNhcGl0YWxpemVkLg0KPllvdSBjYW4gY2hlY2sgdGhpcyBieSBjb21w
aWxpbmcgd2l0aCBXPTEgSSBiZWxpZXZlLCBvciBydW4gdGhlIGtlcm5lbCBkb2MNCj5mb3JtYXQg
c2NyaXB0IG9uIHRoZSBmaWxlLi4NCj4NCg0KT2theQ0KDQo+PiArICoNCj4+ICsgKiBUaGlzIGZ1
bmN0aW9uIGlzIHVzZWQgdG8gZmluZCBhbnkgYWRkaXRpb25hbCBicmlkZ2UgYXR0YWNoZWQgdG8N
Cj4+ICsgKiB0aGUgRFAgY29udHJvbGxlci4gVGhlIGVEUCBpbnRlcmZhY2UgcmVxdWlyZXMgYSBw
YW5lbCBicmlkZ2UuDQo+DQo+UmV0dXJuOiAwIGlmIGFibGUgdG8gZ2V0IHRoZSBicmlkZ2UsIG90
aGVyd2lzZSBuZWdhdGl2ZSBlcnJubyBmb3IgZmFpbHVyZQ0KPg0KDQpPa2F5DQoNCj4+ICsgKi8N
Cj4+ICtpbnQgZHBfcGFyc2VyX2ZpbmRfbmV4dF9icmlkZ2Uoc3RydWN0IGRwX3BhcnNlciAqcGFy
c2VyKTsNCj4+ICsNCg==
