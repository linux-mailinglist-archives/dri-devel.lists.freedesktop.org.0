Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4445374CE5B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C5510E1E4;
	Mon, 10 Jul 2023 07:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADCB10E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:28:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZoYiHpu70bkA/3pbJQVtnQmO7IFSSpOOHJxng/fk7yMKDDUs4LrY+udU1Nbz5JFWfmrermIcwH3aWC4NKEtA8GlI0u807C5AtuP0VqLXB7FRGpeteRG9eD0Rbj4A8bYCztASj0/U0E4WF1rFJoOg8/cKGhlCIvqkrQqF18jgBNWGlA0r98iXmjaXcTstRDDlaXYuzjtKNkF0ph7WeCZSdZX1PAufnkt5rc8Rxjt2fp4cRlrWgM3ItXVXq/QK+pgEhiOJ0wI58/Je/kOYwL9uU+p4+Mw5ocxlF7AT4xTkQLu9DU+YnwlUAwVVO52uksjgpCEhkGZqwL1HDHsWRl1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmq+H5AXiRisNNKn34e8VojiRjXkYvbPxUv4US30Hi8=;
 b=HAtBaqVOQLPN9pwAvhd8C3giDekt4slAC3aoLBdI3LXxGhFEYhB50JSw7HRwOvJbqgFlRnLpx/a0rmcTwHeXtNsRa65xfdKmCkdwzWHNpGIqpx1bWAKMVNRaQpCduJceZfO9zCSVcEezskZpq7v2F3ZzH0wwX+YVc1iM6MLiLz0tMs8gN7GtOHwCx6zO8rpa/rFRqQl8QDQ6rzEby5Vr+I3hLD6q82em5p3NdGq/iDCmZukWpmAR5TKaxG6SCwUpgMUWOGVlL6m6g+OZSe2k98JbYVu8hed9JLFsW6dkX5N6xvD8kqBDkrhjuG6XNRb+8bWDYYPQQg3U9LUjB6OSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmq+H5AXiRisNNKn34e8VojiRjXkYvbPxUv4US30Hi8=;
 b=AdXhg03xVrx/d7HIHjvJY/tv3iNwRpgOSBD9rEmoJ2Nr6f3ng3Gs2T3tM7ZJP1z0LrNoqBh5haEeAOGHd5r90sKTBePczl0SyRyD8Y1YjLxZ/iSnldFcIaV8a13GYLutskxNMrGVHSIB2Rb2tUgS4brTdlWNV/G86IV4B4lG1Lc=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8398.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 07:28:44 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 07:28:44 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Topic: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Index: AQHZnyaWSldT+9YfOk2MiOGSER4/uq+aTasAgBhbjaA=
Date: Mon, 10 Jul 2023 07:28:43 +0000
Message-ID: <PAXPR04MB9448598256524162A74F0311F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
 <6f590bb6-7d17-3ae8-684d-2d4403d6ff55@linaro.org>
In-Reply-To: <6f590bb6-7d17-3ae8-684d-2d4403d6ff55@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM9PR04MB8398:EE_
x-ms-office365-filtering-correlation-id: f844fd4c-512c-49a4-fe10-08db81174aa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1KcYWw0OAR0XoRAHn6N3qSkrYZZp6ZhyJxTQo1VvOohDY9HILaEeaSfh9mpQOs/RUlzkOa8dvephaWpvXaX/KjAnuoniWwLcTajpHF6MtNiJnICV0sVhKcMITIaDMBZox43yMI6hny3oPFEFZZZ/s1V8Nd+91gRNM4DCQUHVmQojzoYXZvodE9/TRj/TvxmijW8df9hiBjAzwldqkDXyb7hTYBn8MTrEGicfIJhBwN5TSruoW16qu21UFqBqP2YtTU++d3eRMBApgfrqEqLj+ClyUuak4KX9lCLs4qcHuSX329h0jw2GA6IsNXZ3tI+OH+JJXd5yt0oK/63zWGEYAohWInY105ll5/wZW9ll2E1HBkpU97tNRYpWCnra5ipwE8ypZGVl90mWNzpvyRtVfFgDkaxSZ81mwDWmEp2OFJcFGFVYRm8GuwbDZGZ0QlsRjBeb7fJLza/outiAFhS9AC7wN4EJWZGi/DTJG3SC9nMhh2HG/pifSCxbb+S9Y5h8XvpfnR2F+tsM91aPVTOLg2SbJBFzsU+o1Ly8hkmRgI9psXdSpS8kOqLL19NaWR/0YQVt7UIZSO+C+o5iLbuEqTQ/4Xsbco/ax6AWnr34lxjXfe8DAukQQ8QvCVDvt7Y6n8Tnak5Rerxe2FI/t7y6HA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(86362001)(38100700002)(38070700005)(33656002)(55016003)(71200400001)(7696005)(110136005)(54906003)(76116006)(921005)(122000001)(9686003)(53546011)(6506007)(186003)(44832011)(7416002)(5660300002)(52536014)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(64756008)(66446008)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTEwSk5nZlJmV1h4MGhSbkVtb3FhejdyUEQweE5rSDdiYTUyUTdzNVZYckdM?=
 =?utf-8?B?aEJ6bGRPYmxXUjA0QTRGU29VemFHbW9rOGNJaTR3UjFvUWdRSVRzbnB6OXcv?=
 =?utf-8?B?a1lvb1JOZVZyb1dwejdqVk54bk8yc05Eb2piM0h4dVMrQ0hFZGt2cVcyc3hB?=
 =?utf-8?B?UjRxUHpwVmxxTG9zN2hIbEhCS1o4WURkOWhRNXE3MFhILzcyVEtXUjI4TWta?=
 =?utf-8?B?N1Q0Z1ZoczJEYU9BUVNzUndJaXZpVEY4bnFxRVVXdlduK0w5MFAydU9VWHh3?=
 =?utf-8?B?RDg5TXZ1d2JrVGR0eW9XS2JTL2xIVnVKZDY2M2VGYmVUbmhONEZHMVJKNW9v?=
 =?utf-8?B?WVcrQmVqaklobFRsQlN3STFhVVZaN0NwZVRvQ3ByVERWeHNZbEp5em5GWHZw?=
 =?utf-8?B?MVNZSEFWbDdQTEhBZmJyRHliNnQ2WGUrdWZ0T3IzbXFYUWJqY3dWVmFqNXZr?=
 =?utf-8?B?dXJqWGg0MElQMVRDUjBjRkplb1VyYnY0ZlFMd0NwaU1IWmFNTTlYVVpJRWVU?=
 =?utf-8?B?Zm5wZXd2SE9mQnQrV1pJbVlCY0dVU005QzlhMXNpNElJRFV2NXA4TVFkbXFk?=
 =?utf-8?B?K0dLTWhpcWFUNTdha3BzL2YvaVdjblhreXQ2NTNFWnQ1Q29EYXliKytxa09X?=
 =?utf-8?B?VldzaWxmblg2SEg0dlJ5Nmw0NERGRzRDRFJXZitMcEIvMEErVnBackNIbVFs?=
 =?utf-8?B?WXNUMitMK29kUGRld2l1OGpGLy9FMU9BUHpoUTdQSDdnYTBMSThRNjJpY1NH?=
 =?utf-8?B?a2hQdVVxZkVsbEM4NVVycGR5MmJ5aEorOU1DckpoS0dHelJtK3Bwc05WZFJC?=
 =?utf-8?B?cWgwVHFXUWdObDgwcEJUTnliV1hQNThlR01pODB1MTVrVFdsWUxzVGFRbkIy?=
 =?utf-8?B?alJRTmJUTm9Sd3dUQ0dtYUdLMFhTNFk2VUd2VHdibWNENjBqNzAyVEZUM29C?=
 =?utf-8?B?dnRUZ25xK2xNREI1UHM3KzhPcGhKcTBUdEJoV3ljUWZVajJ2SjlVKzNUcXY0?=
 =?utf-8?B?RFhpRyt2WDVuL1lnODV1blhnb1kyZ2xlaGVOWDdGSStpdmY2WUN4Mm01NU83?=
 =?utf-8?B?RGRXeWhVZUNzZUpCT2Z4SDljNk8vSWZZQ01XbXFVNENpaHkyNFRLL1Njd1lT?=
 =?utf-8?B?MlEvQlJCSm9QV2taZW5icmZPRFY4c1JHV1dabXZ3Tko5YzZUL1B6YnQva2c2?=
 =?utf-8?B?QTBBS3NBYStqcnpCR2VKVGZQdVVuWEs0Ui94RFVCWS8vQ05vNXNmSHd3c0NH?=
 =?utf-8?B?UUoxZUo1TTU4UE9JeUZwaTUxcTdjdlQybmQ0KzQ4cTFDRkpmWXlxcnJwTzZp?=
 =?utf-8?B?RUUxVVQ1bHdrMGNhazNVUDFMaHhWa1RLUVdEWXBITlk5dU03TlBucGZVaVox?=
 =?utf-8?B?MnhwajFJMjZtRUs5SFh2dnp0K3dyVXFTMjFsc0hZL2hWdDJjR3hYdGdqSVdM?=
 =?utf-8?B?VVhWMmErYS93bDZBNjZKNDY3SjJjWkdWYUoyVHRCQU8zNDhxWlgrSUlyUVdi?=
 =?utf-8?B?dklEblAyL1MzakNJZUFuZHBaWHlocldtNHAzY1FoVzl5SWxXdDN6TnhkY0xj?=
 =?utf-8?B?TDVqZk1DU0ZNOEZIeTVWNHY2K3RhMGVCNjBZMmFBaExCZ3pnR3ZmV2h3Tk5Y?=
 =?utf-8?B?ZGg4LzArMFFPRU1LZEJTK3hmWlBYc2w4OTNFbHVFK0VuYkRHMXR3MFJrSUZO?=
 =?utf-8?B?YWJDYkx5RkpOMzNhM1E5TUJvUjh1NE94NkRlVWFWWEFmeHZLMzI0TnBmckVG?=
 =?utf-8?B?MFhBZWVSQmhLelh4cGRrS29vR0d5b1hlN3hJbUpxckxwd3AxeEhseDUzci9o?=
 =?utf-8?B?bTFjVmdhdmRSRVpjS0V6b1JBRkY4WHVlR2c2SkJQc3A0Z0Vld0pWV3NmN3dN?=
 =?utf-8?B?bXdIai9WVFUxT2ZqTVZtdjJFUHZMY1RYb2VVeTQwSXZ6djhNcE8vREs0SnEw?=
 =?utf-8?B?VWNKSWg3M3c2SjVQMzk0bUdZSzZvZDNkY3dBYStZcDB1RGlrNjNiK21waDdk?=
 =?utf-8?B?aEs0VHh5M0F1Y0ZmUDNsanZrU2FzdElKTk5wZVA2MnVKN0w5emttUzhaY0tv?=
 =?utf-8?B?REJUMytXdTRUV0lWN3hRczNEY0I0S2MrY2tSdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f844fd4c-512c-49a4-fe10-08db81174aa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 07:28:43.9576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEOln2CoPsNCxTCFU3slTqfYR671koux6jzQEamMnn4c7wgz0S8g2L2bixAIVLYiLjv3xskOkqjROrdu1K0YwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8398
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
Cc: Oliver Brown <oliver.brown@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtv
dkBsaW5hcm8ub3JnPg0KPiBTZW50OiAyMDIz5bm0NuaciDI15pelIDI6MDINCj4gVG86IFNhbmRv
ciBZdSA8c2FuZG9yLnl1QG54cC5jb20+OyBhbmRyemVqLmhhamRhQGludGVsLmNvbTsNCj4gbmVp
bC5hcm1zdHJvbmdAbGluYXJvLm9yZzsgcm9iZXJ0LmZvc3NAbGluYXJvLm9yZzsNCj4gTGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tOyBqb25hc0Brd2lib28uc2U7DQo+IGplcm5lai5z
a3JhYmVjQGdtYWlsLmNvbTsgYWlybGllZEBnbWFpbC5jb207IGRhbmllbEBmZndsbC5jaDsNCj4g
cm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7DQo+
IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdt
YWlsLmNvbTsNCj4gdmtvdWxAa2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgt
cGh5QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQ2M6IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZGwt
bGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IE9saXZlciBCcm93bg0KPiA8b2xpdmVyLmJy
b3duQG54cC5jb20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjYgNC84XSBwaHk6IEFk
ZCBIRE1JIGNvbmZpZ3VyYXRpb24gb3B0aW9ucw0KPiANCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBl
eHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yDQo+
IG9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1
c2luZyB0aGUgJ1JlcG9ydA0KPiB0aGlzIGVtYWlsJyBidXR0b24NCj4gDQo+IA0KPiBPbiAxNS8w
Ni8yMDIzIDA0OjM4LCBTYW5kb3IgWXUgd3JvdGU6DQo+ID4gQWxsb3cgSERNSSBQSFlzIHRvIGJl
IGNvbmZpZ3VyZWQgdGhyb3VnaCB0aGUgZ2VuZXJpYyBmdW5jdGlvbnMgdGhyb3VnaA0KPiA+IGEg
Y3VzdG9tIHN0cnVjdHVyZSBhZGRlZCB0byB0aGUgZ2VuZXJpYyB1bmlvbi4NCj4gPg0KPiA+IFRo
ZSBwYXJhbWV0ZXJzIGFkZGVkIGhlcmUgYXJlIGJhc2VkIG9uIEhETUkgUEhZIGltcGxlbWVudGF0
aW9uDQo+ID4gcHJhY3RpY2VzLiAgVGhlIGN1cnJlbnQgc2V0IG9mIHBhcmFtZXRlcnMgc2hvdWxk
IGNvdmVyIHRoZSBwb3RlbnRpYWwNCj4gPiB1c2Vycy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gICBpbmNsdWRlL2xp
bnV4L3BoeS9waHktaGRtaS5oIHwgMzgNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gICBpbmNsdWRlL2xpbnV4L3BoeS9waHkuaCAgICAgIHwgIDcgKysrKysrLQ0K
PiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9waHkvcGh5LWhkbWkuaA0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmgNCj4gPiBiL2lu
Y2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmggbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgNCj4g
PiAwMDAwMDAwMDAwMDAuLjU3NjVhYTViYzE3NQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9pbmNsdWRlL2xpbnV4L3BoeS9waHktaGRtaS5oDQo+ID4gQEAgLTAsMCArMSwzOCBAQA0KPiA+
ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPiA+ICsvKg0KPiA+ICsg
KiBDb3B5cmlnaHQgMjAyMiBOWFANCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaWZuZGVmIF9fUEhZ
X0hETUlfSF8NCj4gPiArI2RlZmluZSBfX1BIWV9IRE1JX0hfDQo+ID4gKw0KPiA+ICsvKioNCj4g
PiArICogUGl4ZWwgRW5jb2RpbmcgYXMgSERNSSBTcGVjaWZpY2F0aW9uDQo+ID4gKyAqIFJHQiwg
WVVWNDIyLCBZVVY0NDQ6SERNSSBTcGVjaWZpY2F0aW9uIDEuNGEgU2VjdGlvbiA2LjUNCj4gPiAr
ICogWVVWNDIwOiBIRE1JIFNwZWNpZmljYXRpb24gMi5hIFNlY3Rpb24gNy4xICAqLyBlbnVtDQo+
ID4gK2hkbWlfcGh5X2NvbG9yc3BhY2Ugew0KPiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0Vf
UkdCLCAgICAgICAgLyogUkdCIDQ6NDo0ICovDQo+ID4gKyAgICAgSERNSV9QSFlfQ09MT1JTUEFD
RV9ZVVY0MjIsICAgICAvKiBZQ2JDciA0OjI6MiAqLw0KPiA+ICsgICAgIEhETUlfUEhZX0NPTE9S
U1BBQ0VfWVVWNDQ0LCAgICAgLyogWUNiQ3IgNDo0OjQgKi8NCj4gPiArICAgICBIRE1JX1BIWV9D
T0xPUlNQQUNFX1lVVjQyMCwgICAgIC8qIFlDYkNyIDQ6MjowICovDQo+ID4gKyAgICAgSERNSV9Q
SFlfQ09MT1JTUEFDRV9SRVNFUlZFRDQsDQo+ID4gKyAgICAgSERNSV9QSFlfQ09MT1JTUEFDRV9S
RVNFUlZFRDUsDQo+ID4gKyAgICAgSERNSV9QSFlfQ09MT1JTUEFDRV9SRVNFUlZFRDYsDQo+ID4g
K307DQo+IA0KPiBUaGlzIGVudW0gZHVwbGljYXRlcyBlbnVtIGhkbWlfY29sb3JzcGFjZSBmcm9t
IDxsaW51eC9oZG1pLmg+IEhETUkgMi4wDQo+IGRlZmluZXMgJzcnIHRvIGJlIElETy1kZWZpbmVk
Lg0KPiANCj4gV291bGQgaXQgYmUgYmV0dGVyIHRvIHVzZSB0aGF0IGVudW0gaW5zdGVhZD8NCkFj
Y2VwdC4gSSB3aWxsIGNyZWF0ZSBoZWFkIGZpbGUgaGRtaV9jb2xvcnNwYWNlLmggdG8gcmV1c2Ug
ZW51bSBoZG1pX2NvbG9yc3BhY2UgaW4gPGxpbnV4L2hkbWkuaD4uDQoNCkIuUg0KU2FuZG9yDQo+
IA0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCBwaHlfY29uZmlndXJlX29wdHNfaGRt
aSAtIEhETUkgY29uZmlndXJhdGlvbiBzZXQNCj4gPiArICogQHBpeGVsX2Nsa19yYXRlOiAgUGl4
ZWwgY2xvY2sgb2YgdmlkZW8gbW9kZXMgaW4gS0h6Lg0KPiA+ICsgKiBAYnBjOiBNYXhpbXVtIGJp
dHMgcGVyIGNvbG9yIGNoYW5uZWwuDQo+ID4gKyAqIEBjb2xvcl9zcGFjZTogQ29sb3JzcGFjZSBp
biBlbnVtIGhkbWlfcGh5X2NvbG9yc3BhY2UuDQo+ID4gKyAqDQo+ID4gKyAqIFRoaXMgc3RydWN0
dXJlIGlzIHVzZWQgdG8gcmVwcmVzZW50IHRoZSBjb25maWd1cmF0aW9uIHN0YXRlIG9mIGEgSERN
SSBwaHkuDQo+ID4gKyAqLw0KPiA+ICtzdHJ1Y3QgcGh5X2NvbmZpZ3VyZV9vcHRzX2hkbWkgew0K
PiA+ICsgICAgIHVuc2lnbmVkIGludCBwaXhlbF9jbGtfcmF0ZTsNCj4gPiArICAgICB1bnNpZ25l
ZCBpbnQgYnBjOw0KPiA+ICsgICAgIGVudW0gaGRtaV9waHlfY29sb3JzcGFjZSBjb2xvcl9zcGFj
ZTsgfTsNCj4gPiArDQo+ID4gKyNlbmRpZiAvKiBfX1BIWV9IRE1JX0hfICovDQo+IA0KPiBbc2tp
cHBlZCB0aGUgcmVzdF0NCj4gDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQoN
Cg==
