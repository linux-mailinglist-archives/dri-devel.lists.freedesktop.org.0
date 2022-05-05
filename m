Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9913151C6AB
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 20:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF07F10E32C;
	Thu,  5 May 2022 18:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C3510E32C;
 Thu,  5 May 2022 18:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1651773763; x=1652378563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w2Dhjxc8SU3O8N73+tskpToAYvxA0GTbivDl538Kjlw=;
 b=OW4MHs2pOk8Aht2I7ptbsYzWKaOfEZK2u3ioycaTjQlOaqamxD6T6aSv
 HPXNoJ7Brk7RMqkj8ipkpzOpcxGM+rYWldPRWzuB5JXNk7Ja1APZaIL2B
 i4RI7X27sRxsdN1cnkC+3BqT++D8I3/L5iVmSA6e3oZqfRwJnM7MkUkhQ 4=;
Received: from mail-bn8nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 18:02:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml6IoHHDssQY+37GBU7gigkiKlNYwRxqzaZkgh+0r+aKqRbTgBf9hkV/sg8cQsUz8Agn/YwKt3zguvERFtSDn0lS4AhhF5BL9Rymqv55YT6jpW/j8B9E4D5acS412j9XbHuXefMErXlmKljjcZ5raGyyrcW3JqA/NzSYh5Sc3OfrrKhjxRqYDBhWdFIOmngdINqHclXG4T3qrhTy7tpxMp6d9jhbNtR2x7nS//lwqAXr0r1a1orN7hWqNYI0eKKqvQzW58Bv0ibudCBjRd0iZ2NUsPclDZDK2CCkZntL6uuWf7GJ8yLTAgqSOul3iVpEbMSHoO6i/obaQXGOiX7X0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2Dhjxc8SU3O8N73+tskpToAYvxA0GTbivDl538Kjlw=;
 b=PP9KZ3k3ztSo6VTghyQ8wCFd2QdUTDGKXt1N1b6VJnMSuNPZ0ZP+y0jtgpSW3SDvl30fnUqwsKjjvqbHzGhvjUbsfAuWTSyz7PFf2k0MyXkdG97W6di2F4fdK6NCTIp7Ls0ZG3aXXDJCp9CWexTYbE6+x2/oJsS6K7tDqboFUb7ykMfrlzoPwkkvVjE+PI12DnKydJEy+qwIGBXm34EN2foBZklpPT+5RsTdpQbTkKh8la6ZeBdCO73ed1TcHOijdn52UUpE0kUCA8DIDKnO0MFBUdWSC4KEe1/K6xP05VBXHDSeSCGRIuHKlY6JOBGtFmzRfDNYt3q15xTqa2MMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by DM6PR02MB4236.namprd02.prod.outlook.com (2603:10b6:5:9a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 5 May
 2022 18:02:36 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 18:02:36 +0000
From: Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
Subject: RE: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
Thread-Topic: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
Thread-Index: AQHYWOh0LkcVWva+fESk6uZPP3V7t60BIRCAgAABL4CAD35OcA==
Date: Thu, 5 May 2022 18:02:36 +0000
Message-ID: <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
 <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
 <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
In-Reply-To: <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59c32a7a-1777-41da-3fb4-08da2ec16fd6
x-ms-traffictypediagnostic: DM6PR02MB4236:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR02MB42368F11FB19802F38FF07B7E1C29@DM6PR02MB4236.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /TdcQy4gImfMcSpzBrB9qk/xNVRW8u8xTMEQLlHO8Wm11JLjndkX97NCcl5UhzBdMl76eKAOyrdsNgjRnnaxiDh+pO6pi1ZJVr1tb0iM+QWxGaWIC9CWkZsVj2sqgW3kLDo+cLgpJJqIgdpn4lkkzZYAZ7llIHUa2ZS3g/gwHXTTHXwPoitP8i0cFJeYv+BWYg1LFLDTebTz1bbJTtqeNMGM9B0u1FeiTXRLDPLkeTVy+rrDYAFuv3bjzZ1IvAEX7Hdmmzgv+w8Itc9XXumSV9NDqHUyIKIIsPfR2IEy0UncspXrus4qYteJwEN+7OYg/jNTBLfyaeucUFJjRZVNCPGKdrVf2WBw4LboJKWGerWbAofghiXTTqE66vE9hApqmlK3WnblbEw78IDQWim8G2Ix/A58IBU9arT6fZodqXeHvntyoStGl15xg8hqJH/pCQxQmlmtrepOAEXqOUQi7nOUC1qhdboybQT4QZglgAua1+u5SUHDRWwksMKS+03I+H4QqCRhLr/HiwL4h7NBibQe//Xo0KZzlOudvRCxe56/Ipvyx/DX0Ua2y+t7UivlGMAJfJQerL6DouJq0DA8jj226ZhGM7Hixq22tW4vmR3H1oyeVkLuDkMEgXW9bO9jHLqUfjrkzp8Tp0s2vh/u94YWZEq27X93zI5RzBFnsOMm2Hs/2bX5Oa4DIfhA/1mxDWmTpFjtWiJJOqrxW1imRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(54906003)(110136005)(508600001)(6506007)(7696005)(55016003)(186003)(66556008)(26005)(66946007)(66446008)(8676002)(64756008)(66476007)(4326008)(86362001)(52536014)(2906002)(71200400001)(76116006)(5660300002)(7416002)(8936002)(33656002)(38100700002)(122000001)(38070700005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjdrOGc1Z3cyWExaQXRVMmhIdFRPa1VoNlY4bGUzQ0diNnFsdWhkVi9zNGpy?=
 =?utf-8?B?UmtmWFBNTW5RU3oxaWxhS0dqMTYyR3lObnVRZUFpU0c3VHdQT0J0Qm5HZTFk?=
 =?utf-8?B?YWo4Z3h0ZVZMZEJxL1d1UXFKSklqdllRSXdLVHY4WEVXcDJvU1pKMjFZRFk2?=
 =?utf-8?B?RUpqcWJkRzZuYS9zUFZXSVl4dFFxekhCU2NBRnUyTkgrd0NKWCtkb3dZT21B?=
 =?utf-8?B?QW01N3BvQXc1VFZjRjNpM0pqenU2Z3Vkd1NkKytGU2xmd0N6UWU2RXhpRzhN?=
 =?utf-8?B?MERIV09qYjJQcWtFU0RQRitYQ3d3UXhIb1JIVkRPK0N6cHllbzFlZ3FUNlRS?=
 =?utf-8?B?RUFmQkpneHB5enJRcVBoVG5WZVZhTzZUcG1kNnRwdU1pWDU4cjhOemVSaC9X?=
 =?utf-8?B?ZlNRTFllYVJ2S1hremRyTW1scXRrQVpmMTY2eDEyNGVtZmpXUk1Ca1pPY0ta?=
 =?utf-8?B?MVhTcEVYRExwL0FQNnJwN2FRVUlzZzR1Rk90V3JUUVNpc2JYZ2w1dkdobXRO?=
 =?utf-8?B?c3dxcGtyUWErS0E3eXE0K2IraU5QYjEzUmpabkE1dE9Dd2RGby9QdkdSMmtq?=
 =?utf-8?B?ekxvWm55V1VycktpdC94bXU4TFJQbXUwU2lncjZOaUxLK2NXcFRsZkZlR3VF?=
 =?utf-8?B?Sy8wanJhNklrMUhwY2FOaFlNY0pBT1BzbkJ2Z01pNUowbkUrRmRRTlNUeXBZ?=
 =?utf-8?B?UkZJN1B5c2dTVmthV3h5Nlkwb25La09keEdpMllNSWNraXNhRk5BNnY1NnFD?=
 =?utf-8?B?cmRuMG4zTGVJM1Avb3p3ZXhHQTJidW4wU0dlQUR0NDdkZzgrTFNPZXNyYlNh?=
 =?utf-8?B?bURUNXRHZXBPQ2RSQmIwM3R3SHFkbnlHMzRLZUNDVlM4TkpxZld2Yk54WDBN?=
 =?utf-8?B?cmowRDFNZHgzNUYrWTA2ZWd1SStVTlJZT1dVRG9OTWZyMHE1MG15Nkh6WUhJ?=
 =?utf-8?B?Sng5NFU4WWJhaWVSL3JienBOaUhZdCs5K3RHWFArK1g0LzRmWGRmRnpvK3RF?=
 =?utf-8?B?ZEl3M3R5dVp3RUxDV3h1NHhmcWZrajREekpEbDRSajUzdFpJT2JZbk5FdFZo?=
 =?utf-8?B?NDJGVUxnMVROLzhSYTBRYWRBVU9DNVZCbVNDbVAydzE3RCt0S3IzVlJTUEVv?=
 =?utf-8?B?ajViRnp1cCtUanJEMHRYQ1A4dTV3VXhIMWtQSW9jMVk3RDR6RER4cTlBeGxT?=
 =?utf-8?B?bWQ4ZndHamNZdHRWWVdzdURMR3kvRUkxQXVmVUxRSXo2SHh6TGdvcGZtTWJX?=
 =?utf-8?B?MGtCQU5zVmNJb2JzQVlyRGJDekpKRm5ndEtpL3owVkhQQm0ydUhnYWhFNXB0?=
 =?utf-8?B?MzEzbUErMG5UQlhPUWs2bWFwQ1YwTVB0WVBBZVFpdU5LSGFqajFraW5Ha2ZJ?=
 =?utf-8?B?R2RRT2ZGcVdEclpNd0pEM01VWE91VU9XNmJQRW5SaU5GY2NKUjFsTlp4eHB0?=
 =?utf-8?B?VVBSdXEzWUtGbjg0bUd3cVZoSnlTUjZwNHZDZEZXY05JVDlKSlkzaXkxMUtG?=
 =?utf-8?B?REdWNjVUWDhQcUZPbW0yMzMyeWtjNSsxd094NFYvWXlhOWs2U0w1c1FacTRE?=
 =?utf-8?B?K2JNcEhmaUxBK2ErTkpsY2M1UGFmK3VVTlVqWFpmam5uN05rcDBNWnc2ZFNu?=
 =?utf-8?B?eGd2blBsdXFYV3l6b0VLbUVQT21na3A3N1ZVd0FLNmhmRTl0Zk15QWU2Y3Fh?=
 =?utf-8?B?NWU2NG85cUNTd0dETmFmUnYrYk1EQ0dBWHcvZVZOWUR2R3NIcmsxN1J5MHNn?=
 =?utf-8?B?RmYvUlNGd3NhYnZSUkE0WXQ5WFZMSGd3a3VDZS9ad2thdHJLT3VmbHQySjNM?=
 =?utf-8?B?eXlsMSttTGpBN1g4Ymt2b090ZTNITVFQTHFPaldKN2NTRURlL2VSVzNrNGZQ?=
 =?utf-8?B?Yk42L29wRmVVVVVMU1VrdHE3OTFpVGFZSG5uTVUwUDhTT2JXRGZsR0Yway8z?=
 =?utf-8?B?ZjBEUTRRYitzMXo0dlRjTGMreUhWSVR1VG8vWUszdjVobUNaeUcwd09Kakkz?=
 =?utf-8?B?Rjh1Si9lM1E2UHU4YkFRYThZMzNJQW9DZnFPUjdVSTJIdnB1a3dCZU9ndmhO?=
 =?utf-8?B?YVY2MHVHTmlzNmZEK1dXc3BpZk9LcTV3bXNTOUdhV1pKM1BGckFXbzYxYUhQ?=
 =?utf-8?B?ZWlLNTN2MjYxY29HT05zL21iZHFzWmZHQzVUS05zaXFlZHlqQWI3NWlOMlYz?=
 =?utf-8?B?TklzQ0Q4bTRyNmNQam1tN1lvNmd5azV3VHFSTGovTlZWeDB3aXpSMVl3NWQ1?=
 =?utf-8?B?OEd0alJVZnE4WklqeWNwdHVNTmx3MXdubFhab3p3TVIyN000NkRzaEgrK1l0?=
 =?utf-8?B?cVlQNmp2UnJCZHJ1TVRsWXF3Mm51R3BqOWxldFJpQTY5MXBvaHBFSkZwS2t0?=
 =?utf-8?Q?xmlcNWsUIf7czekU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c32a7a-1777-41da-3fb4-08da2ec16fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 18:02:36.5599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjMMG2nUGtN151hr3ZCJwQ7/f2X4qdDdO2Y5iuaHwYwoZHuGt1zTdtrvlstT7Fx5DUECXjGF6U6Yp7OqaMaeb69wTACBvVbhsgglc8FvFqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4236
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
 "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
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

SGkgRG91ZywNCg0KPj4NCj4+IFF1b3RpbmcgRG91Z2xhcyBBbmRlcnNvbiAoMjAyMi0wNC0yNSAx
NDowNjo0MikNCj4+ID4gV2UncmUgc3VwcG9zZWQgdG8gbGlzdCB0aGUgc3VwcGxpZXMgaW4gdGhl
IGR0IGJpbmRpbmdzIGJ1dCB0aGVyZSBhcmUNCj4+ID4gbm9uZSBpbiB0aGUgRFAgY29udHJvbGxl
ciBiaW5kaW5ncy4gTG9va2luZyBhdCB0aGUgTGludXggZHJpdmVyIGFuZA0KPj4gPiBleGlzdGlu
ZyBkZXZpY2UgdHJlZXMsIHdlIGNhbiBzZWUgdGhhdCB0d28gc3VwcGxpZXMgYXJlIGV4cGVjdGVk
Og0KPj4gPiAtIHZkZGEtMHA5LXN1cHBseQ0KPj4gPiAtIHZkZGEtMXAyLXN1cHBseQ0KPj4gPg0K
Pj4gPiBMZXQncyBsaXN0IHRoZW0gYm90aCBpbiB0aGUgYmluZGluZ3MuIE5vdGUgdGhhdCB0aGUg
ZGF0YXNoZWV0IGZvcg0KPj4gPiBzYzcyODAgZG9lc24ndCBkZXNjcmliZSB0aGVzZSBzdXBwbGll
cyB2ZXJ5IHZlcmJvc2VseS4gRm9yIHRoZSAwcDkNCj4+ID4gc3VwcGx5LCBmb3IgaW5zdGFuY2Us
IGl0IHNheXMgIlBvd2VyIGZvciBlRFAgMC45IFYgY2lyY3VpdHMiLiBUaGlzDQo+PiA+IHRoaXMg
aXMgb2J2aW91cyBmcm9tIHRoZSBwcm9wZXJ0eSBuYW1lLCB3ZSBkb24ndCBib3RoZXIgY2x1dHRl
cmluZw0KPj4gPiB0aGUgYmluZGluZ3Mgd2l0aCBhIGRlc2NyaXB0aW9uLg0KPj4gPg0KPj4gPiBT
aWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+
PiA+IC0tLQ0KPj4gPg0KPj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20v
ZHAtY29udHJvbGxlci55YW1sICAgICAgfCA2ICsrKysrKw0KPj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQ0KPj4gPg0KPj4gPiBkaWZmIC0tZ2l0DQo+PiA+IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RwLWNvbnRyb2xsZXIueWFtbA0K
Pj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kcC1j
b250cm9sbGVyLnlhbWwNCj4+ID4gaW5kZXggY2QwNWNmZDc2NTM2Li5kYmEzMTEwOGRiNTEgMTAw
NjQ0DQo+PiA+IC0tLQ0KPj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21zbS9kcC1jb250cm9sbGVyLnlhbWwNCj4+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RwLWNvbnRyb2xsZXIueWENCj4+ID4gKysr
IG1sDQo+PiA+IEBAIC03Niw2ICs3Niw5IEBAIHByb3BlcnRpZXM6DQo+PiA+ICAgICIjc291bmQt
ZGFpLWNlbGxzIjoNCj4+ID4gICAgICBjb25zdDogMA0KPj4gPg0KPj4gPiArICB2ZGRhLTBwOS1z
dXBwbHk6IHRydWUNCj4+ID4gKyAgdmRkYS0xcDItc3VwcGx5OiB0cnVlDQo+PiA+ICsNCj4+ID4g
ICAgcG9ydHM6DQo+PiA+ICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGll
cy9wb3J0cw0KPj4gPiAgICAgIHByb3BlcnRpZXM6DQo+PiA+IEBAIC0xMzcsNiArMTQwLDkgQEAg
ZXhhbXBsZXM6DQo+PiA+DQo+PiA+ICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnJwbWhwZCBT
QzcxODBfQ1g+Ow0KPj4gPg0KPj4gPiArICAgICAgICB2ZGRhLTBwOS1zdXBwbHkgPSA8JnZkZGFf
dXNiX3NzX2RwX2NvcmU+Ow0KPj4NCj4+IEhhdmluZyAnYScgaW4gJ3ZkZGEnIHR5cGljYWxseSBt
ZWFucyAnYW5hbG9nJyBmb3IgJ2FuYWxvZycgY2lyY3VpdHMsDQo+PiBzbyBJJ2QgZXhwZWN0IHRo
aXMgdG8gb25seSBtYXR0ZXIgZm9yIHRoZSBwaHkgdGhhdCBjb250YWlucyB0aGUgYW5hbG9nDQo+
PiBjaXJjdWl0cnkuIEl0IHdvdWxkIGJlIGdyZWF0IHRvIHJlbW92ZSB0aGUgcmVndWxhdG9yIGNv
ZGUgZnJvbQ0KPj4gZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9wb3dlci5jIGFuZCBtb3ZlIHRo
ZSByZWd1bGF0b3Jfc2V0X2xvYWQoKQ0KPj4gY2FsbCB0byB0aGUgcGh5IGRyaXZlciBpZiBwb3Nz
aWJsZS4gSG9wZWZ1bGx5IHFjb20gZm9sa3MgY2FuIGhlbHANCj4+IGNsYXJpZnkgaGVyZS4NCj4N
Cj5JbnRlcmVzdGluZy4gT2RkbHkgZW5vdWdoLCB0aGUgc2M3MjgwIGRhdGFzaGVldCBkb2Vzbid0
IGxpc3QgdGhlICJfQSIuDQo+SXQgY2FsbHMgdGhlc2UgIlZERF9WUkVGXzBQOSIgYW5kICJWRERf
VlJFRl8xUDIiLiBIb3dldmVyLCBvbiB0aGUNCj5zY2hlbWF0aWMgaW4gZnJvbnQgb2YgbWUgc29t
ZW9uZSBsYWJlbGVkIHRoZXNlIHBpbnMgb24gdGhlIHNjNzI4MCB3aXRoIHRoZQ0KPiJBIi4gLi4u
YW5kIHRoZSBkcml2ZXIgbG9va3MgZm9yIGEgc3VwcGx5IHdpdGggdGhlICJhIi4gOi0vDQo+DQo+
SXQgd291bGQgYmUgZ29vZCB0byBnZXQgY2xhcmlmaWNhdGlvbiBmcm9tIHNvbWVvbmUgd2l0aCBi
ZXR0ZXIgaW5mb3JtYXRpb24uDQo+DQo+LURvdWcNCg0KT3VyIGludGVybmFsIHBvd2VyIGdyaWQg
ZG9jdW1lbnRzIGxpc3QgdGhlIHJlZ3VsYXRvcnMgYXMgVkREX0FfKl8xUDIgYW5kIFZERF9BXypf
MFA5DQpmb3IgYWxsIHRoZSBwbGF0Zm9ybXMuDQoNClNvLCBhcyBhIHByYWN0aWNlLCB3ZSBwdXQg
dGhlIHNhbWUgbmFtZSBpbiB0aGUgRFQgZmlsZXMuIEhlbmNlLA0KDQpSZXZpZXdlZC1ieTogU2Fu
a2VlcnRoIEJpbGxha2FudGkgPHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQoNClRoYW5rIHlv
dSwNClNhbmtlZXJ0aCANCg==
