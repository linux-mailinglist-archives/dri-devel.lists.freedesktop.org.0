Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9944AEAEC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FBF10E340;
	Wed,  9 Feb 2022 07:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 09 Feb 2022 07:18:58 UTC
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C60110E340;
 Wed,  9 Feb 2022 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644391138; x=1644995938;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wEF4VMn2yxYToBaopGC1pv7uoupZwLCcgp+ZFxaEcKI=;
 b=UpjfJ02ULXp6HQmKiBwFJrsgsqxSHS8/EV8aiTrSGJyHn6Xf5MgZlbOj
 II0bHA4/OIQ6uvaL0w6qUQm2/P+qJS4cn2a/1fhF6i0MmQ2kVlfIfXCjy
 rgLLxLlQHT2zISv6jfOvNKfhLlueBt9/0aFzdHH/y5CKI/DxR67pQwvaP s=;
Received: from mail-bn8nam08lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:11:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdnAMQP0L7sEMN1JyZEE1U4pMqk65A8r9W22gGyFwqT6+9MSvvZAdhuktvyY7V6zyxKm7hhvCRtJlPR/E88Au+A1pwiT2ME7CIo+lMZbOoFLvYjm/4kK/YlpwPGU3fGuOjfM2p8Mi8ZnZ32Ncf4TRliOTszhig3tSk/W2mQDwyMAZS/CMNctPaHSCghD03ChDNlV4js/1oRgtMpe1G3e57AjqEgeeR+omlvhuxtmouk18xHSdua0p3+UnfB9ZkRJh94v5UMfup37Q3FfolRcejdxNFOYobIdHTlVwoRAz1oDs+kBJelEcObidBlDZ4VMK4J8G22Or+tilyO/wWk0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEF4VMn2yxYToBaopGC1pv7uoupZwLCcgp+ZFxaEcKI=;
 b=YJ+2yCrC0uk8WqCE7n2GUq7E02VJv3zzYu7nf7MDj2+mXSPf5qpyiWBro1A1k7KsAgntZrYM/0J1lt1JFOUVRZGlFG3aGijKO3A3wkLwDoBsg/pors8lLTWRY+H3NUxs7/C81yHaicall2dWvzVR0/gEErDHZYpfi1P9ZCIoyaB+m2idcuJ2C+IpSvjFC5+H4QWFnJM5r2fHCEHtRb52ySdfp2STwZJC1d3lxOz0RgvLRaootY05qUyOYGyMhS5Wa7xygnCi+//e3Yr43Xi8ZPhWPBHii7cIDKt+TMPHKX9ybNk/TvuhWL22aB2lPp9HRE5eIVSWB+DbjePXas7mjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SN1PR02MB3694.namprd02.prod.outlook.com (2603:10b6:802:2c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 07:11:45 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006%3]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 07:11:44 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Matthias Kaehlcke <mka@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Topic: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Index: AQHYHP9CXGHnyqg4DUy0QOrgphcweKyKOxCAgACThHA=
Date: Wed, 9 Feb 2022 07:11:44 +0000
Message-ID: <MW4PR02MB7186E8DDE74E7AD4EF76AB10E12E9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1644333525-30920-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644333525-30920-3-git-send-email-quic_sbillaka@quicinc.com>
 <YgLtb8NCGKDi2uh4@google.com>
In-Reply-To: <YgLtb8NCGKDi2uh4@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68a9c1cb-b904-4bb6-f953-08d9eb9b6e16
x-ms-traffictypediagnostic: SN1PR02MB3694:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN1PR02MB3694F6BE3586B2C93F9CA1FA9D2E9@SN1PR02MB3694.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LlkxtnMUpnqHq/tUgQHvRV+gj2ATfb0aP/HDSeb1t8DC9JBL2q+w2fDkR99lzMeNliBNDBrMb8yVGlWbE7fqrrJkVBHLdKppG7EZ/WWcdfIL29Xokyid1klJB/LsUf1ZwJmm9nlpIWqTz9r8zu77uf4gZ1VCROiOJtXLc92kwXtz4xii+HsNfUmcLpoexWS3gHgPaEUfDc2NThtmpwLPWVr86Pid+QqMIFEBZt43sXPStDhQT0efRf3wvQJA/mvuXTL5i7QjgGrvLv6iuAnPuTUS6FqqMNgMwL6oiZol+HPjF0DUf6dRs8Pg7YsIyUaC8YgH5QS3pdW5T/59Fqzp0yvaxqxkis+KfV81xwC5h2NpqEvKALVQh8zsMbpu2yIQTn1iDp8LWsTz0oflhWAQx2GH7jqj72NmycJppzmkrcXEEAP/ZT0JrtGOABZRIL4sbLhJUDnLETrKW5UBZ4W+FfELssmH/HyK4OTU1SOBImHdRCuQEfRKOiVxIOtAwDTerNqL8BnK/rw/iZaK+j/76B/PRTalOTejM7Y+bHLtRcp0I4Jupzudisa3q7DJmHMGVhRI6GH8xw7zjILCjMTGkKqOXEoDQo5KYOMEpCnbEQFrfOUolOe8o1IXhDtNzhcU3MQ+7hKKqV9gf2SC3d37oBX3043+BdLfRxOpMT6xUKrsuHe1zD2jA8e9xpS+J5vVHeRT61HenSXo48YEj53cbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(122000001)(4326008)(8676002)(66476007)(7416002)(8936002)(64756008)(66556008)(66446008)(66946007)(76116006)(316002)(38070700005)(38100700002)(186003)(26005)(508600001)(55016003)(107886003)(53546011)(6506007)(110136005)(7696005)(71200400001)(52536014)(83380400001)(9686003)(54906003)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTg4U2FTcDVCb3lEYkUrWTVzQVJraFVnN2REbnRoMjBmSW1mVnFMZWhhbTJo?=
 =?utf-8?B?L3dnSUtzZlcwcHpNTHlWcDkwRUhXU3NjVmJHODYxMjlnYzBmaWMyTjVBOXZB?=
 =?utf-8?B?dHp6eDZVMi83ODJPTlVDdnYwQnNsdHluc1loc1VBYjFGNUE5bDlvRCtRSWdM?=
 =?utf-8?B?ZjNTcFo0MVJLazU4Um9CMDVxb295dEJKQk13amcyT0xqdmV3dXg1MERDRXdy?=
 =?utf-8?B?R1lZL29oVlVBOHVEL1NlRHRZNVhuWFp0WUxvbTYzRmZva1ZSc3VSSGxhNS81?=
 =?utf-8?B?RlRjOW1lV01NVXc3Y3dGalNGK2dYb2JiWk53eUpQdlBRTHlMUUNoY21lQjJh?=
 =?utf-8?B?L0FLS1dBcXY1Q3NHVEcrSWVjcElvUlZSSUR5ZjArYjhiYXRPSWRndTJLOEFQ?=
 =?utf-8?B?VXFlUkIxQXRUei9ZS0pHeUNUNUIvQXYrYjUycWR3cDhNajQxenFJYklLSDhr?=
 =?utf-8?B?UUdPS2ZweUFSazFKN3lwNkhJcWc5bWU2WnUwaWVzZVh4REZaR0lGUFdqQW5Q?=
 =?utf-8?B?Z1ZLU09tWjNoRG9WY2hLaktuSzkvKytjSGE3Nk5rdU4vclEwcXY1U1dwS290?=
 =?utf-8?B?OGxsT2FMS0ErOUNNczRSRSswNjZkTnN2UkNaN1IwRTNGUzJKMmkxK1MzTVVG?=
 =?utf-8?B?OXJiNDNnM3JKNVFSZkROWS9LQ1gvZHROL1BXdmd3RzJvVXBnU2hUZjByYXJo?=
 =?utf-8?B?aFpzc25xdUQ1Nld3Q1RtYWxXYzM4UDd0QU5yeGMrTk51bHNNdkhrcG9zeWVq?=
 =?utf-8?B?OXllaGh6bVRVd0ducGtlRlRXanlKUGZsbnF2SmJlUlZsNGpHNytKd2xhd3VI?=
 =?utf-8?B?ZjFsaExWdHk1Yk52RXVyRnVlYlNSVWdWeXR0YkNId3QrUGJlV1pQOVcxM01M?=
 =?utf-8?B?bnFaY2h3SW1aODNlNjFBSzgvbVpFM2dIdTd1U0xPQzcxcjg3ZGlVV25hOGZr?=
 =?utf-8?B?VFJRNXZMbXE1eGs2S0txY3dOMTNJSlk2MDkvVks5R1Z0SmtRMUNBUmNHZzdN?=
 =?utf-8?B?RlhqWGV0b21ob2dBYWxSVE9KZFlJQUE5ZjRYVXd4UU9CSTY1dXYyOWNoYlhX?=
 =?utf-8?B?RkwveFNaaUVrMklyVmtiQ0cxMmVLRGlZRktieFZJZmRwZ2ZDM2l6eCt1WUkr?=
 =?utf-8?B?dmZrN0lndFlFN2NlT2lvY0tHdEpaMHRNUHZhOXowbTlHTGRyMXJDUmZOa2or?=
 =?utf-8?B?YklnQ0tHUTdSczZDZG9BN3J1TGFxT3dJVVpGRFp2bnRudU1DaXg3YVVKZWJy?=
 =?utf-8?B?VE5xVDUxOEdJZk9QalVWSmpOUEpjTjVScnl5Ri9xeDgwUmh1OVk2cVFNRGFT?=
 =?utf-8?B?Tzd6M2lPVVZZNzkrMVcwLzBLZ0o0bHM5VU1pUjN3R3NUZGJraFJoME1tT3Rm?=
 =?utf-8?B?TkZ6WWNXZGJuL1JlU21hcTl3eXFWd1Vuc1Z6WGNkSDk3WUlMWVVZS3pRRDY1?=
 =?utf-8?B?ellmUUhKWXBjTFI4MWNKZURLUVdaekl2Z1k0WTZzTmNKYnE0bHU5ZVQvV1Q1?=
 =?utf-8?B?bzYwOWd3TFJVeUFMZkhkcXZVQWk5aDVJeDBiQVJ6aGlEWnRJUnBtcUQyRWdI?=
 =?utf-8?B?SnJRUWlBak9OS0wvemtvdnN2ejFHVXJjWXdhMFNyTERKbm04d2pYaUF4Nml1?=
 =?utf-8?B?UVlGd3RtMC9mWUdBNHQza1BieGhxbG9UaE5hU2NvQnIrV3JvOUljZHcvZi9I?=
 =?utf-8?B?U2VydmlaMHV2aUZQQUlkY0w3Q3NLV0ZCN05nUWJnRnlMYUYxZzAveUp0NmZl?=
 =?utf-8?B?MVA0elNycjhuQWZVTE9wNjYwclUvY0hIOWpTVlBReDlrZW9zVVNHMmwwZEYx?=
 =?utf-8?B?QUMyMktpb3RMN1VzUis4OUJUTnNRWjFIcVZ5WTJGTVRhZnFkMlRpQVBDdDJF?=
 =?utf-8?B?dlozTEwzbVZhK1BVQ2tSZUVJaXowTW5qWkovdi9GTTNJMU1nbXg1VDBSUjIr?=
 =?utf-8?B?cmhNTS8xMHdUWGN3S1hlY04zRXNXUG54em5JRys1UVhSb3RIQjZBZEZDK1ZD?=
 =?utf-8?B?UlNqL1NmYlFaaFkyNjJyellJR1IwNExqRDJuWk1IbGVtNUZzS2JpZ0lEdTFn?=
 =?utf-8?B?TytIb0UybDRvSGxmMytjbklYTzJSUUVKOHU3Y2VpMXZEMk9mc2VURmU4MVBy?=
 =?utf-8?B?YWpIdDIxTG5rSlBkQmluNFY1VUZqZHRiOGpMTU9xN1FLWEc2MElHZ1A4K1ZP?=
 =?utf-8?B?REl5anJrdkxMK0c5bjRSbGczUGNVcUp2Umw3TFlrQzduY1FLc2MydDd5MmxL?=
 =?utf-8?B?UlYxeXdOZUlsakx5YmdrMkVoQVV3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a9c1cb-b904-4bb6-f953-08d9eb9b6e16
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 07:11:44.7218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vF1wTAjHtXqq9e+kxPTbyitZ16SGXWRvxEhHQLQE+jqJrijnaPsS2jJ3o9cSO8nrqErpo01xDp+MzIx7WqzCMwEVlj1Ln+bgRaXJyyNrQaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3694
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
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "Abhinav Kumar
 \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "agross@kernel.org" <agross@kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 quic_mkrishn <quic_mkrishn@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dGhpYXMsDQoNCkkgd2lsbCBpbXBsZW1lbnQgdGhlIGNoYW5nZXMuDQoNClRoYW5rIHlv
dSwNClNhbmtlZXJ0aA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWF0dGhp
YXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+IA0KU2VudDogV2VkbmVzZGF5LCBGZWJydWFy
eSA5LCAyMDIyIDM6NTQgQU0NClRvOiBTYW5rZWVydGggQmlsbGFrYW50aSAoUVVJQykgPHF1aWNf
c2JpbGxha2FAcXVpY2luYy5jb20+DQpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBhZ3Jvc3NAa2VybmVsLm9yZzsgYmpvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc7
IHJvYmgrZHRAa2VybmVsLm9yZzsgcm9iZGNsYXJrQGdtYWlsLmNvbTsgc2VhbnBhdWxAY2hyb21p
dW0ub3JnOyBzd2JveWRAY2hyb21pdW0ub3JnOyBkaWFuZGVyc0BjaHJvbWl1bS5vcmc7IGtyenlz
enRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbTsgdGhpZXJyeS5yZWRpbmdAZ21haWwuY29tOyBz
YW1AcmF2bmJvcmcub3JnOyBhaXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2g7IHF1aWNf
a2FseWFudCA8cXVpY19rYWx5YW50QHF1aWNpbmMuY29tPjsgQWJoaW5hdiBLdW1hciAoUVVJQykg
PHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+OyBLdW9nZWUgSHNpZWggKFFVSUMpIDxxdWljX2to
c2llaEBxdWljaW5jLmNvbT47IHF1aWNfbWtyaXNobiA8cXVpY19ta3Jpc2huQHF1aWNpbmMuY29t
Pg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzRdIGFybTY0OiBkdHM6IHFjb206IHNjNzI4MDog
QWRkIHN1cHBvcnQgZm9yIGVEUCBwYW5lbCBvbiBDUkQNCg0KT24gVHVlLCBGZWIgMDgsIDIwMjIg
YXQgMDg6NDg6NDNQTSArMDUzMCwgU2Fua2VlcnRoIEJpbGxha2FudGkgd3JvdGU6DQo+IEVuYWJs
ZSB0aGUgZURQIGRpc3BsYXkgcGFuZWwgc3VwcG9ydCB3aXRob3V0IEhQRCBvbiBzYzcyODAgcGxh
dGZvcm0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19z
YmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAgIC0g
c29ydCBub2RlIHJlZmVyZW5jZXMgYWxwaGFiZXRpY2FsbHkNCj4gICAtIGltcHJvdmUgcmVhZGFi
aWxpdHkNCj4gICAtIG1vdmUgdGhlIHB3bSBwaW5jdHJsIHRvIHB3bSBub2RlDQo+ICAgLSBtb3Zl
IHRoZSByZWd1bGF0b3JzIHRvIHJvb3QNCj4gICAtIGRlZmluZSBiYWNrbGlnaHQgcG93ZXINCj4g
ICAtIHJlbW92ZSBkdW1teSByZWd1bGF0b3Igbm9kZQ0KPiAgIC0gY2xlYW51cCBwaW5jdHJsIGRl
ZmluaXRpb25zDQo+IA0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzI4MC1jcmQuZHRz
IHwgMTIyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBhcmNoL2FybTY0L2Jv
b3QvZHRzL3Fjb20vc2M3MjgwLmR0c2kgICAgfCAgIDIgLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3Fjb20vc2M3MjgwLWNyZC5kdHMgDQo+IGIvYXJjaC9hcm02NC9ib290
L2R0cy9xY29tL3NjNzI4MC1jcmQuZHRzDQo+IGluZGV4IGUyZWZiZGQuLmJmZjI3MDcgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAtY3JkLmR0cw0KPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vc2M3MjgwLWNyZC5kdHMNCj4gQEAgLTIxLDYgKzIx
LDM0IEBADQo+ICAJY2hvc2VuIHsNCj4gIAkJc3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBu
OCI7DQo+ICAJfTsNCj4gKw0KPiArCWJhY2tsaWdodF9wb3dlcjogYmFja2xpZ2h0LXBvd2VyIHsN
Cg0Kbml0OiB0aGUgb3RoZXIgZml4ZWQgcmVndWxhdG9yIGluIHNjNzI4MC1pZHAuZHRzaSBpcyBj
YWxsZWQgJ252bWVfM3YzX3JlZ3VsYXRvcicsIGlmIHlvdSB3YW50ZWQgdG8gYmUgY29uc2lzdGVu
dCB5b3UgY291bGQgY2FsbCB0aGlzIGJhY2tsaWdodF8zdjNfcmVndWxhdG9yLg0KDQo+ICsJCWNv
bXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsNCj4gKwkJcmVndWxhdG9yLW5hbWUgPSAiYmFj
a2xpZ2h0X3Bvd2VyIjsNCj4gKw0KPiArCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAw
MDAwPjsNCj4gKwkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTgwMDAwMD47DQo+ICsNCj4g
KwkJZ3BpbyA9IDwmcG04MzUwY19ncGlvcyA3IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiArCQllbmFi
bGUtYWN0aXZlLWhpZ2g7DQo+ICsNCj4gKwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4g
KwkJcGluY3RybC0wID0gPCZlZHBfYmxfcG93ZXI+Ow0KPiArCX07DQo+ICsNCj4gKwllZHBfcG93
ZXI6IGVkcC1wb3dlciB7DQoNCm5pdDogc2VlIGFib3ZlDQoNCj4gKwkJY29tcGF0aWJsZSA9ICJy
ZWd1bGF0b3ItZml4ZWQiOw0KPiArCQlyZWd1bGF0b3ItbmFtZSA9ICJlZHBfcG93ZXIiOw0KPiAr
DQo+ICsJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KPiArCQlyZWd1bGF0
b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4gKw0KPiArCQlncGlvID0gPCZ0bG1tIDgw
IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiArCQllbmFibGUtYWN0aXZlLWhpZ2g7DQo+ICsNCj4gKwkJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwkJcGluY3RybC0wID0gPCZlZHBfcGFuZWxf
cG93ZXI+Ow0KPiArCX07DQo+ICB9Ow0KPiAgDQo+ICAmYXBwc19yc2Mgew0KPiBAQCAtNzYsNiAr
MTA0LDQyIEBAIGFwX3RzX3Blbl8xdjg6ICZpMmMxMyB7DQo+ICAJfTsNCj4gIH07DQo+ICANCj4g
KyZlZHBfb3V0IHsNCj4gKwlyZW1vdGUtZW5kcG9pbnQgPSA8JmVkcF9wYW5lbF9pbj47DQo+ICt9
Ow0KPiArDQo+ICsmbWRzcyB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArfTsNCj4gKw0KPiAr
Jm1kc3NfZWRwIHsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICsNCj4gKwl2ZGRhLTFwMi1zdXBw
bHkgPSA8JnZyZWdfbDZiXzFwMj47DQo+ICsJdmRkYS0wcDktc3VwcGx5ID0gPCZ2cmVnX2wxMGNf
MHA4PjsNCj4gK307DQo+ICsNCj4gKyZtZHNzX2VkcF9waHkgew0KPiArCXN0YXR1cyA9ICJva2F5
IjsNCj4gKw0KPiArCXZkZGEtMXAyLXN1cHBseSA9IDwmdnJlZ19sNmJfMXAyPjsNCj4gKwl2ZGRh
LTBwOS1zdXBwbHkgPSA8JnZyZWdfbDEwY18wcDg+Ow0KPiArfTsNCj4gKw0KPiArJm1kc3NfZHAg
ew0KDQpzaG91bGQgYmUgYmVmb3JlICdtZHNzX2VkcCcuDQoNCj4gKwlzdGF0dXMgPSAib2theSI7
DQo+ICsNCj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiArCXBpbmN0cmwtMCA9IDwm
ZHBfaG90X3BsdWdfZGV0PjsNCj4gKwlkYXRhLWxhbmVzID0gPDAgMT47DQo+ICsJdmRkYS0xcDIt
c3VwcGx5ID0gPCZ2cmVnX2w2Yl8xcDI+Ow0KPiArCXZkZGEtMHA5LXN1cHBseSA9IDwmdnJlZ19s
MWJfMHA4PjsNCj4gK307DQo+ICsNCj4gKyZtZHNzX21kcCB7DQo+ICsJc3RhdHVzID0gIm9rYXki
Ow0KPiArfTsNCj4gKw0KPiAgJm52bWVfM3YzX3JlZ3VsYXRvciB7DQo+ICAJZ3BpbyA9IDwmdGxt
bSA1MSBHUElPX0FDVElWRV9ISUdIPjsNCj4gIH07DQo+IEBAIC04NCw3ICsxNDgsNjUgQEAgYXBf
dHNfcGVuXzF2ODogJmkyYzEzIHsNCj4gIAlwaW5zID0gImdwaW81MSI7DQo+ICB9Ow0KPiAgDQo+
ICsmcG04MzUwY19wd20gew0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKw0KPiArCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZlZHBfYmxfcHdtPjsNCj4gK307
DQo+ICsNCj4gKyZwbTgzNTBjX2dwaW9zIHsNCg0Kc2hvdWxkIGJlIGJlZm9yZSAncG04MzUwY19w
d20nDQoNCj4gKwllZHBfYmxfcG93ZXI6IGVkcC1ibC1wb3dlciB7DQo+ICsJCXBpbnMgPSAiZ3Bp
bzciOw0KPiArCQlmdW5jdGlvbiA9ICJub3JtYWwiOw0KPiArCQlxY29tLGRyaXZlLXN0cmVuZ3Ro
ID0gPFBNSUNfR1BJT19TVFJFTkdUSF9MT1c+Ow0KPiArCQliaWFzLWRpc2FibGU7DQo+ICsJCW91
dHB1dC1sb3c7DQo+ICsJfTsNCj4gKw0KPiArCWVkcF9ibF9wd206IGVkcC1ibC1wd20gew0KPiAr
CQlwaW5zID0gImdwaW84IjsNCj4gKwkJZnVuY3Rpb24gPSAiZnVuYzEiOw0KPiArCQlxY29tLGRy
aXZlLXN0cmVuZ3RoID0gPFBNSUNfR1BJT19TVFJFTkdUSF9MT1c+Ow0KPiArCQliaWFzLWRpc2Fi
bGU7DQo+ICsJCW91dHB1dC1sb3c7DQo+ICsJfTsNCj4gK307DQo+ICsNCj4gKyZzb2Mgew0KPiAr
CWVkcF9iYWNrbGlnaHQ6IGVkcC1iYWNrbGlnaHQgew0KPiArCQljb21wYXRpYmxlID0gInB3bS1i
YWNrbGlnaHQiOw0KPiArDQo+ICsJCXBvd2VyLXN1cHBseSA9IDwmYmFja2xpZ2h0X3Bvd2VyPjsN
Cj4gKwkJcHdtcyA9IDwmcG04MzUwY19wd20gMyA2NTUzNT47DQo+ICsJfTsNCj4gKw0KPiArCWVk
cF9wYW5lbDogZWRwX3BhbmVsIHsNCg0KaW4gZGlmZmVyZW5jZSB0byBsYWJlbHMgbm9kZSBuYW1l
cyBzaG91bGQgdXNlIGRhc2hlcyBhcyBzZXBhcmF0b3IsIG5vdCB1bmRlcnNjb3JlcyAoaS5lLiAn
ZWRwLXBhbmVsJykNCg0KPiArCQljb21wYXRpYmxlID0gInNoYXJwLGxxMTQwbTFqdzQ2IjsNCj4g
Kw0KPiArCQlwb3dlci1zdXBwbHkgPSA8JmVkcF9wb3dlcj47DQo+ICsJCWJhY2tsaWdodCA9IDwm
ZWRwX2JhY2tsaWdodD47DQo+ICsNCj4gKwkJcG9ydHMgew0KPiArCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gKwkJCXBvcnRAMCB7DQo+ICsJCQkJ
cmVnID0gPDA+Ow0KPiArCQkJCWVkcF9wYW5lbF9pbjogZW5kcG9pbnQgew0KPiArCQkJCQlyZW1v
dGUtZW5kcG9pbnQgPSA8JmVkcF9vdXQ+Ow0KPiArCQkJCX07DQo+ICsJCQl9Ow0KPiArCQl9Ow0K
PiArCX07DQo+ICt9Ow0KPiArDQo+ICAmdGxtbSB7DQo+ICsJZWRwX3BhbmVsX3Bvd2VyOiBlZHAt
cGFuZWwtcG93ZXIgew0KPiArCQlwaW5zID0gImdwaW84MCI7DQo+ICsJCWZ1bmN0aW9uID0gImdw
aW8iOw0KPiArCQliaWFzLXB1bGwtZG93bjsNCj4gKwl9Ow0KPiArDQo+ICAJdHBfaW50X29kbDog
dHAtaW50LW9kbCB7DQo+ICAJCXBpbnMgPSAiZ3BpbzciOw0KPiAgCQlmdW5jdGlvbiA9ICJncGlv
IjsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaSAN
Cj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vc2M3MjgwLmR0c2kNCj4gaW5kZXggMzU3MjM5
OS4uZjhmYTcxNiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzI4
MC5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaQ0KPiBA
QCAtMzAxMiw4ICszMDEyLDYgQEANCj4gIA0KPiAgCQkJbWRzc19lZHA6IGVkcEBhZWEwMDAwIHsN
Cj4gIAkJCQljb21wYXRpYmxlID0gInFjb20sc2M3MjgwLWVkcCI7DQo+IC0JCQkJcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IjsNCj4gLQkJCQlwaW5jdHJsLTAgPSA8JmVkcF9ob3RfcGx1Z19kZXQ+
Ow0KDQpUaGlzIHdhcyBqdXN0IGFkZGVkIGEgZmV3IGRheXMgYWdvIGJ5IGNvbW1pdCAxMThjZDNi
OGVjMGQgKCJhcm02NDogZHRzOiBxY29tOg0Kc2M3MjgwOiBBZGQgZWRwX291dCBwb3J0IGFuZCBI
UEQgbGluZXMiKS4gVGhlIHBhdGNoIGFzc3VtZXMgdGhhdCB0aGUgJ0hvdCBQbHVnIERldGVjdCBs
aW5lICh3aGljaCBmdW5jdGlvbnMgYXMgInBhbmVsIHJlYWR5IiBpbiBlRFApIGlzIGhpZ2hseSBs
aWtlbHkgdG8gYmUgdXNlZCBieSBib2FyZHMuJy4gSWYgdGhhdCBpcyBpbmRlZWQgdGhlIGNhc2Ug
YW5kIHRoZSBDUkQgaXMgdGhlIGV4Y2VwdGlvbiB0aGVuIGl0IHNlZW1zIHRoYXQgZGVsZXRpbmcg
dGhlIHR3byBwcm9wZXJ0aWVzIGZyb20gdGhlIENSRCBEVCB3b3VsZCBiZSBhIGJldHRlciBzb2x1
dGlvbi4NCg==
