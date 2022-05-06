Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E251D940
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 15:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C31110E28C;
	Fri,  6 May 2022 13:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B7410E31A;
 Fri,  6 May 2022 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1651844209; x=1652449009;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=40JdjvoiUmxug5Zl0N9lsKhnqp49lEwcv4Bq15+VFSw=;
 b=IGHFqKrL+7HAGzLQJTFZ/kLr+YYD0bpy70OoAk6rcm6GNqD/P5TFfEWZ
 qY4Rh0EqKrNWJUe2kogPSqtDloWfVtK7vCpL83KM9eKYmnB76BGb8BJAQ
 wQlh/TPkIHqFMFIMe41rwv3Oe2GDx3R+HVmOeElzk/6JqCvKH+dTtPQeu M=;
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 13:36:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU3l+3BEhIWsfkz09IcIP7HPj/Rlry0kTp8jvCdaS34NSAiDevHiXeQGISsB0kY6as2mlUf2WHxqD9zT5GuQzIpEfDUbpXgxnsJPxV2tTS2uyeXWzQZAdfV1f0a93A+ylUcEpoA88pZTmpqGQAiy+ANSKMR+7qZHbe40cnTDXZnHbgidpH4I29l9zLrYP1AwQVPqhPmZhe6uZYnpzKkTVJFzpHdjiI9/YU+FsmRK2cw5jSB8rPwQJgC2LHQUG7tbfbr74RijehY0tdn9uGosoaGkWh5Qfv1axlYr1an7HQQYMDTOH/b7DdsbN4vrGE0cYhihIa6kSRnJBk57BQQnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40JdjvoiUmxug5Zl0N9lsKhnqp49lEwcv4Bq15+VFSw=;
 b=jnBH/bDOluFNVSjvRTBHnopQL9fU97UtLeaB1H7tZqTJqrAZs6Ex3rCt2FgLxxDXeSuoHQK6pTXeroN2BRtTOwpjsoMXu+S+L9bzhEG3P5RqFgFErTKHbn6yExMXovFfEpsWGVnGL8R1uhf2A49gZyktYrSnyLutQhUs9Dtke3JzzcKbT75Q0TBzFzjiSxJK3PiS96g/F3jw2whfXx21W8N5LYmY6vyo8tvsSKQWBjdOEfTATNRvPm4WAqNx/atkzd4z/cKA9xwTpHUYWbbYa3J5wdf3SxY+Q+7tBHTN1JgAqMVf1mU6Svn4K9bXXV3EY8QwXLXsguCxOhO5NRLWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by DM6PR02MB6057.namprd02.prod.outlook.com (2603:10b6:5:1fe::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 13:36:43 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 13:36:43 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
Thread-Topic: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
Thread-Index: AQHYWOh0LkcVWva+fESk6uZPP3V7t60BIRCAgAABL4CAD35OcIAABpoAgAADzZCAAAmXAIABNkSw
Date: Fri, 6 May 2022 13:36:43 +0000
Message-ID: <MW4PR02MB71866E59B844A0842DF7570EE1C59@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
 <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
 <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
 <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n51Q=cGwrMec3JEQENqWHV3pAUjLPT6RwZLA5xV080sgxQ@mail.gmail.com>
 <MW4PR02MB71867A18732B266DE8FA2040E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n53MEBYhyRtGWOCmjj923UQU_iVE_SEBQw6_FUci8NLz3w@mail.gmail.com>
In-Reply-To: <CAE-0n53MEBYhyRtGWOCmjj923UQU_iVE_SEBQw6_FUci8NLz3w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51ec83b0-ac78-40de-482f-08da2f657564
x-ms-traffictypediagnostic: DM6PR02MB6057:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR02MB605753BC09DED35F892913149DC59@DM6PR02MB6057.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rd8W00pTQhtfddNzu9pVsnvRryZdHYncQkYkdK4yjThepW/gzzEfZ61EJ5UgAVuCci7aRIQ23tZTG09CELPq7nEMLvXGrmgeLoAUlnv+6BYfv0PXHhA23vWkdOHlJHFPptmB3MyrS3bF4YqsEf3B3BHuxqNtU5Q5keG/Q9TFsr/sqJ0tmtSiDXgWvUoUEOVbNjFFwvbUrTX9eHYQqWa0S0MEcgv/0YrJSD6Iqwvm865WA7RQzXDHoR5NMDMTYFAptuqGzXcwRHNV0VcxJup7y1dA31V7dVCEcYutzoS5/lIU0KrHgIdh8IddrS5m+WKN9Tr7JQkLMbXbB/2y5QKm2+L9kBo8I8NcPXLLld6LBQwg+QKq1bOcEcA3+geN7lH8TtY5E4N1suP3EFbiwLiKWYFZn4bcnUhlvEfcFdoRiYHm4G96T1TUgkujqXFBKGlaGUKEkx2R8H4TyfoTAOL8i7D18jSDe8jrt34B+4u1kT0PaggPpdurjmYgVSGwkRIhH5IAZ5E2WPtggsueogMrguXEd8/FhQH5qcGzNHB9VU+wBDs3Q173J9IdwqN/7gS+L3YWZmbPS9jMjrqksqqmMfa7KDsW3oHmju5c/EbaBmogHhPL3unfTPNaDOdzKE1Zo6Rgt1wQyRYZcF7wPd46tcf0N5X8SGCJCSOkpnpWPqeGpxc3PPDrdAOYJqjSLVXCb0wacVYUFFJzqpkfcfRHSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(33656002)(66446008)(186003)(76116006)(4326008)(8676002)(66946007)(8936002)(64756008)(66476007)(52536014)(66556008)(9686003)(54906003)(55016003)(26005)(71200400001)(110136005)(7416002)(6506007)(316002)(508600001)(7696005)(2906002)(38100700002)(38070700005)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1ZNSUVrWVA3YndiZ1h1N3hlT0xrQk9NajlHais3aDE4d2tYQnlmajBLZlFP?=
 =?utf-8?B?aDc0NCttKzQ0YTk5M0ZGTisyMkFwRUN6Sk1NVkFQOWVhTC9zdEpRbzNSeWt2?=
 =?utf-8?B?Wkp6azJsL0t4THFocmE4ZEV3RjlBQXA5QUFseGZBU1JLSURzL0UvWmFaME9B?=
 =?utf-8?B?SWd3OFFwYWhPMGttcncvbkxwVWQwalpHT3gxWDN4ZjVEY0N1WmhCcUcyeFVZ?=
 =?utf-8?B?VUo5STJxTWJsNlZKb3J4RkZuTXN4QU1pUXI5VEg0MER4bXBVOHNvY2NMdkp6?=
 =?utf-8?B?K1RYYXpvNFVOVTJHQlRwNWVIK3M0VGRHMHNVR0dFS0VzbHRsbkNyMVp1VkZr?=
 =?utf-8?B?aXkrTmdFc2w2VGdsN1RXT04rbldXRlFBYnVlYkE4T2p0ay95OStiTDBWWlJu?=
 =?utf-8?B?SVh3dHVGQ09Vek90WkUxdURkc09NS2RiSXIwbWdXWnZmQjdGS0t4eDNWWUlI?=
 =?utf-8?B?bEFRYXRQL09xbDFaSWhkbU5IemRGS0dvTGdpVEVQNmdQQTBZbUVWR2I1cjVh?=
 =?utf-8?B?WUwzeWR4SmdJWXZiamdLc21JMXhYRTZIaTFDWnlkaS9ZRXpKYWxxdWwrN1Vx?=
 =?utf-8?B?K3B4dVZJRzUya1hIS0RFS2YwNjZBT1JqOW5ST28wY0NyK1FSWHBYeDhnbnVD?=
 =?utf-8?B?c2VRUW8wU0VSVUtkRjNtZnNrVGFlNVZXWHhQUEk4WUhPSWZDK2VLQUUzL0o3?=
 =?utf-8?B?SlgxUSsvZU5ITEt6TWNIY1JGNjM5bTZjc0dqTWM2WDNGWGNGQlltREE2b2x5?=
 =?utf-8?B?SjNka0VmVlk0TXVGWmN5N1NxV3A5Q3ZpWGpNTDRWYW5JdExYcUlEbFYvdEF4?=
 =?utf-8?B?SGtDa3o1TUVYWUFhNG42WjRxazd0eGE1NGg3V2NPN2R5RjlIWFJqaUhhOGVa?=
 =?utf-8?B?djd4WjZYMXdlNkRtdHJHMlpUd3MwVVplendNVEdHc0NNVVU2OC9zcVRsbk0y?=
 =?utf-8?B?MWc0UEp6M2JJOTV3OXppNWF4QzZpbkVvZVFZYTE1b0w1TGxSQ2VqdTVmQnVG?=
 =?utf-8?B?aGROVnAra3ZldGFERFE1bUFjVG9ySEUyMi8zZFNueVZSN3FkYWRXVCtrQmM2?=
 =?utf-8?B?bUdKa2RYWmJwVmFtQlBaY2NJWkFuMmJiaEtISEpMTkFwUUR4ZzJpY0xtMU5w?=
 =?utf-8?B?TGU5czNVSEVuL3cxYmZPMHNtYkRVNXJqWHNkWHFERHU2NmNMRXJOQUxjY0gx?=
 =?utf-8?B?b2t0L0xFWlQyKzFuRDc3dUVESHkrNE5ONFY3Qk5WYjJ4VEpkM1VHbXdZLzRT?=
 =?utf-8?B?dENjcFNSOXZvMFhGQXhOdFl1ZFpaTXFVM1BmY2V1aGM3NVZ0dHNyTS9xZHAr?=
 =?utf-8?B?TE14Ym15bHFYN3JjKzVHT1lQempOWTdqcDZMbUdrRW4xQmpGbUxXdGF1bmx5?=
 =?utf-8?B?dXlES0RHMW5yRTJTS2xiSFNzaFh5QitaTUdWNS9Wa214MlM3UGkyWmlxNjZu?=
 =?utf-8?B?SjV0VjUzT2tjZWZoUHRWQ2UyT1ZrUWlSU3dWNjQxVnpLa1JrclNKUXpMbEg4?=
 =?utf-8?B?eDRrNldQTmJUbENjeGg3TGRYNG01S3ZZeGhPUDNxb0JGZ2xWS3RoMHM4bjMy?=
 =?utf-8?B?b2djZGlucmo0eFJWcGMvR3Roa0laeDg1d3RkV3NYb0dXendZaW90TXdyMGo3?=
 =?utf-8?B?Mm1aRzNwRlYrWUZNNWh1K25kbVUwVVJyL0RMVGlHZG1GV09sQURia0IzNjBa?=
 =?utf-8?B?ZmprUVRnTENkTUh3MXFULzZsZkIxenZnK2laWFA3VGlMQ3lrbk9wQUFvbzFB?=
 =?utf-8?B?ajVIM2krQ2tDUVZrQWwxcnN1eVUwOHhhV243S2kxVUVKOExzWDFiS2Z0UDl3?=
 =?utf-8?B?eFIxZmdRUzN3VEZNZFJ2QVR6UVJuZUp0S2RpazNkYXJpSkFEblBGa1V2aFJz?=
 =?utf-8?B?N3dJdDNMYlJWaHFjL2VHdyt1MndCQU1tT1R5YWhJMnpkcnZzSGxqNDV6TEww?=
 =?utf-8?B?eTk2aVFncUlJU0plWHpFVXA4U2s4bk9UQ1VwN0c4aTBQZjFyV0RhQVQrZFlS?=
 =?utf-8?B?MlRzeEc5Z1JzOTd1U2xMQXRUOCtxMm9CbnU5eXl3UWJidDJhS0c1QlNuckM2?=
 =?utf-8?B?cGlBckpUV1lRZWJlSkxicEJKdDRFVEorYUZIeVJKdkE3RkpHbkVhalhHQXNN?=
 =?utf-8?B?UDI4SStVWFdqZmYvY09vMWhCN1BtS1FtbEtPbzloazdIbDJoNFlPMzZjLytC?=
 =?utf-8?B?eHFzMm9MOERIc3U4UkthMm5sdzM1UEZlSUJsWFMrVHFuNE1TMktMMXJrWGIr?=
 =?utf-8?B?R25ocHdvTVc1bDBhNjVSSk5wZnRUb0UzK1pnQjl5L0pMeTFiOUU0U1hEV1R3?=
 =?utf-8?B?Mi9ZTjNGaThRVVFlTG9TNENjM1FHWUtxcVdkWTlwSlRWMmlhVS9LZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ec83b0-ac78-40de-482f-08da2f657564
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 13:36:43.3742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+Kds+WwFj5VepbCRgk86aqUuKMzY5rOB5HPVQy4pG0XcaYUQ/mKfnyJYhcWky60lBGTBTgdR7Kz0+EYLsBNUspE0XjCHcfemAZcuZHwR6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6057
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

Pj4gPj4gT3VyIGludGVybmFsIHBvd2VyIGdyaWQgZG9jdW1lbnRzIGxpc3QgdGhlIHJlZ3VsYXRv
cnMgYXMNCj4+ID4+IFZERF9BXypfMVAyIGFuZCBWRERfQV8qXzBQOSBmb3IgYWxsIHRoZSBwbGF0
Zm9ybXMuDQo+PiA+DQo+PiA+RG8geW91ciBpbnRlcm5hbCBwb3dlciBncmlkIGRvY3VtZW50cyBp
bmRpY2F0ZSB3aGF0IHRoZXNlIHN1cHBsaWVzDQo+PiA+YXJlIHBvd2VyaW5nPyBUaGUgcXVlc3Rp
b24gaXMgaWYgdGhlc2Ugc3VwcGxpZXMgcG93ZXIgYW55IG9mIHRoZQ0KPj4gPmxvZ2ljIGluc2lk
ZSB0aGUgZURQIGNvbnRyb2xsZXIgb3IgaWYgdGhleSBvbmx5IHN1cHBseSBwb3dlciB0byB0aGUN
Cj4+ID5hbmFsb2cgY2lyY3VpdHMgaW4gdGhlIGVEUCBwaHkuIElmIGl0J3MgdGhlIGVEUCBwaHkg
b25seSB0aGVuIHRoZQ0KPj4gPnJlZ3VsYXRvciB1c2FnZSBpbiB0aGUgZURQIGRyaXZlciBzaG91
bGQgYmUgcmVtb3ZlZC4gSSB3b3VsZCBzdXNwZWN0DQo+PiA+dGhpcyBpcyB0aGUgY2FzZSBiZWNh
dXNlIHRoZSBjb250cm9sbGVyIGlzIHByb2JhYmx5IGFsbCBkaWdpdGFsIGxvZ2ljDQo+PiA+YW5k
IHJ1bnMgYXQgdGhlIHR5cGljYWwgMS44ViB0aGF0IHRoZSByZXN0IG9mIHRoZSBTb0MgdXNlcy4N
Cj4+ID5TaW1pbGFybHksIHRoZXNlIGFyZSB2b2x0YWdlIHJlZmVyZW5jZXMgd2hpY2ggc291bmQg
bGlrZSBhIFBMTCByZWZlcmVuY2UNCj52b2x0YWdlLg0KPj4gPg0KPj4gPlBsZWFzZSBjbGFyaWZ5
IHRoaXMgZnVydGhlci4NCj4+ID4NCj4+DQo+PiBGb3IgdGhlIERQIGRyaXZlciB1c2luZyB0aGUg
dXNiLWRwIGNvbWJvIHBoeSwgdGhlcmUgd2VyZSBjYXNlcyB3aGVyZQ0KPj4gdGhlIHVzYiBkcml2
ZXIgd2FzIHR1cm5pbmcgb2ZmIHRoZSBwaHkgYW5kIHBsbCByZWd1bGF0b3JzIHdoZW5ldmVyIHVz
Yi1kcA0KPmNvbmN1cnJlbnQgbW9kZSBuZWVkIG5vdCBiZSBzdXBwb3J0ZWQuDQo+PiBUaGlzIGNh
dXNlZCBwaHkgYW5kIHBsbCB0byBiZSBwb3dlcmVkIGRvd24gY2F1c2luZyBhdXggdHJhbnNhY3Rp
b24gZmFpbHVyZXMNCj5hbmQgZGlzcGxheSBibGFua291dHMuDQo+PiBGcm9tIHRoZW4gb24sIGl0
IGJlY2FtZSBhIHByYWN0aWNlIGZvciB0aGUgY29udHJvbGxlciBkcml2ZXIgdG8gdm90ZSBmb3Ig
dGhlDQo+cGh5IGFuZCBwbGwgcmVndWxhdG9ycyBhbHNvLg0KPj4NCj4NCj5UaGF0IHNvdW5kcyBs
aWtlIFVTQi1EUCBjb21ibyBwaHkgZHJpdmVyIGhhZCBpbXByb3BlciByZWd1bGF0b3IgcG93ZXIN
Cj5tYW5hZ2VtZW50IHdoZXJlIGF1eCB0cmFuc2FjdGlvbnMgZnJvbSBEUCBkaWRuJ3Qga2VlcCB0
aGUgcG93ZXIgb24gdG8NCj50aGUgcGh5LiBXaGVyZSBkb2VzIHRoZSBwb3dlciBwaHlzaWNhbGx5
IGdvPyBJZiB0aGUgcG93ZXIgaXNuJ3QgcGh5c2ljYWxseQ0KPmdvaW5nIHRvIHRoZSBEUCBjb250
cm9sbGVyIGl0IHNob3VsZG4ndCBiZSBjb250cm9sbGVkIGZyb20gdGhlIERQIGNvbnRyb2xsZXIN
Cj5kcml2ZXIuIElmIHRoZSBhdXggYnVzIG5lZWRzIHRoZSBEUCBwaHkgZW5hYmxlZCwgdGhlIERQ
IGNvbnRyb2xsZXIgZHJpdmVyDQo+c2hvdWxkIGVuYWJsZSB0aGUgcGh5IHBvd2VyICh2aWEgcGh5
X3Bvd2VyX29uKCk/KS4NCg0KWWVzLCBpdCB3YXMgbGltaXRhdGlvbiBlYXJsaWVyIHdoZW4gd2Ug
ZGlkIG5vdCBoYXZlIHByb3BlciBpbnRlcmZhY2UgdG8gaW50ZXJhY3QNCndpdGggdGhlIGNvbWJv
IHBoeS4NCg0KSW4gdGhpcyBjYXNlLCB0aGUgcG93ZXIgZnJvbSB0aGUgcmVndWxhdG9ycyBnbyB0
byB0aGUgY29tYm8gcGh5Lg0KDQpOb3cgdGhhdCB0aGVyZSBpcyBhbiBpbnRlcmZhY2UgZm9yIHRo
ZSBjb250cm9sbGVyIHRvIGludGVyYWN0IHdpdGggdGhlDQpjb21ibyBwaHksIHRoZSBwcm9wb3Nh
bCB0byBkcm9wIHRoZSBwaHkgcmVndWxhdG9yIHZvdGluZyBmcm9tIHRoZSBjb250cm9sbGVyDQpk
cml2ZXIgc2VlbXMgcmVhc29uYWJsZSB0byBtZS4NCg0KVGhlIHBoeV9wb3dlcl9vbigpIGlzIHVz
ZWQgZm9yIGdldHRpbmcgdGhlIHBoeSBvdXQgb2YgbG93IHBvd2VyIHN0YXRlIG9yIGdldHRpbmcN
Cml0IHJlYWR5IGZvciBkYXRhIHRyYW5zZmVyLg0KDQpUaGUgY29udHJvbGxlciBkcml2ZXIgbmVl
ZHMgdG8gZW5hYmxlIHRoZSBwaHkgcG93ZXIgdmlhIHRoZSBwaHlfaW5pdCgpIGJlZm9yZQ0KYW55
IGludGVyYWN0aW9uIHdpdGggdGhlIHNpbmsgbGlrZSB0aGUgYXV4IHRyYW5zYWN0aW9ucyBvciBi
ZWZvcmUgc2VuZGluZyB0aGUgZGF0YS4NClRoZSBjb250cm9sbGVyIGNhbiBkaXNhYmxlIHRoZSBy
ZWd1bGF0b3JzIHZpYSB0aGUgcGh5X2V4aXQoKSBjYWxsLg0KDQpUaGFuayB5b3UsDQpTYW5rZWVy
dGgNCg==
