Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96380431A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 01:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB15710E450;
	Tue,  5 Dec 2023 00:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066FA10E44B;
 Tue,  5 Dec 2023 00:06:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T96K09Uj+wQI0DNOC5Izq4nOWbouDnDj+gH0zbbfBfsOzQM+Qirgh3fOiAH8L0ea47MjspkItyF4/UFkG6mzIAlNJKPdrDNF20bYKIyMinR0laZ6oYQ/Pd8PJcq0ZHvm7xtcXDmnuzjEN6cM1zUi+C/Mm5923mIHvXG5adt2SOUsags9v27mU6CVxwA06vDLiETKrKs8jn1NpNRG8e1sDemrdnQsOH/Jy7VeRpmcF6OMxzC0yyAY6jtUQSjqF+T0Lb5J8nxpPWO4aKtWiwjb3EKay63JFa5t1Y0AqL5k3gjCxb4dN9HkVWoU/JqtmNh2bSF33ObkZQu81O7WPdKBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1D6JDDahy0v5fE0z5EtGkklryhpobt/BWyojZ0YY4M=;
 b=AF7G2XyEOkovgbCO8zfuz8UsmMjZd9gXb8NJrBwXVFBSdj69Xstufsyu8zKMDXTUxk/NGhUoM5Xd2g8vsKTn+itZdUItdkSC4vhSU/8oPI12pchcUYuJMFnmYlKqYn2RArAHVXiKB+zRYtZBFQtjN3xmQGlnqEHnRgBWXGMRt6C0+caNjStKXuTAVk2oMYA/v4x2yko7E1KWHp/aZO/xJRtCaPt4shCnVdRAJ4Oif8qUgpjtrE87qm275AMFqKB+i2Y9qX7DnbWup9Tm6PaHUOBAjMUrB72g/1NUoTYPX3kQc6Gx/+jCI/v5FajB1XHgr/ZM4dzcX5zlUOlwlUwslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1D6JDDahy0v5fE0z5EtGkklryhpobt/BWyojZ0YY4M=;
 b=cF+1eHCKlpK40ds+0nzuMDXhJ03wQaOTCKPXed8ZdGf7C/O7g4rhWsIe9KXsXCSbtYkoCwtDyOi7fcIv+jcm/oUvW2oGX3JVmwMfK3BMsJktPOS+Fi6+CzkswLHyClcinuXe+KV0Go/lK7KbbYyCJpYaVWPZBh/7jvEk6Jy/PJNXWEudRp8aLHm0JAWRRsfMV7II6NjMf/JsQVPTEjZlPVxrnqkNVLZVoipURmQHe+uFXzedp3naRad8LYoSQ/nw/DrTQi/2nJRTAsLB3MeL2CsXjlB9n+PTdGAGUCE9LauRsIgFeFlgsNVZZiqna/xJKWFaNcUiGHw6PSHzuuEITg==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by LV3PR12MB9213.namprd12.prod.outlook.com (2603:10b6:408:1a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 00:06:37 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 00:06:37 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau/gsp: add three notifier callbacks that
 we see in normal operation
Thread-Topic: [Nouveau] [PATCH] nouveau/gsp: add three notifier callbacks that
 we see in normal operation
Thread-Index: AQHaJwT955NYBg3wsU+Lpx9E0tOTLbCZvv+AgAAPcYCAAAFYAA==
Date: Tue, 5 Dec 2023 00:06:36 +0000
Message-ID: <5385d8a02123ad0fa9b15339b2ac5837d29c8f87.camel@nvidia.com>
References: <20231204225519.358885-1-airlied@gmail.com>
 <30f51ed33c24b531649f876722a52f6628c194fb.camel@nvidia.com>
 <CAPM=9ty8dxnHR0ha5AuWND9pUez_1ROMQPs=4g7toiTn98AdEA@mail.gmail.com>
In-Reply-To: <CAPM=9ty8dxnHR0ha5AuWND9pUez_1ROMQPs=4g7toiTn98AdEA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|LV3PR12MB9213:EE_
x-ms-office365-filtering-correlation-id: a3b8b19f-5b19-47d0-6002-08dbf5260c7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8zLxB92MgrQJDLTv8+lg0Wh52N1eOK1VQWAOQkatuiKFEeYiVIR/FZx5nF13BWg6T43wcqc8FYgargJ2oRvbLiWOP+V2K2q2Qe91il6Bzgj2Js69VJJdyPYepQkhtfFDzthMZNTe97RWG9APvYigdJi6Jtvi2k4opkV4kSIb+XBPWO+dcDsy7ge4dtPfgRxYUwCR81xR7TpQyqPGDfxwT+ZK1JqEOiqSQRIfvJab4Mpw690VBSLmeb0cTq14M5pcErdL5WOD+gMUgSkQ1LtGdUBsp0reRugHWnDPkf+0+Npi04RDRZIXl0nZbYjQAymD+XKhRpUZvcJmycAhHSfk/OiY+9DCiifXv6M2XIlaLeWukWpml8VBJdbiK3XDJ0Tjqwzs9q9QTv6S5qHiK3nbgakZUlAT8GDJcBkGPImgsiS3fJo7CevpGXJCSN9gsAkfenB733P/+GvxZ82LBrtAfJzHdMNtdiJOntosW0GY/rgIbrbzgsZGZfMra4QRb+DG/fCvMFmR1/6gipcX7YIzKzlLzIipcEeY2nupRxRQ7W2+d9G00uMSfiNC8wBdBDDPCsDlYbiypJl44xpDkjAQDsr3Wfhz8JFRuUBCAapzl2H6+RmJp3Vf6yDciFLHPJln
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(4744005)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(6512007)(36756003)(2616005)(6506007)(83380400001)(6486002)(478600001)(26005)(71200400001)(38100700002)(122000001)(316002)(54906003)(6916009)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWZ3Q2U0YlVxbi9xdzRBcSt0eUdRUktQVVBYc3h1N3dqaHZXTHdndUcwK3B5?=
 =?utf-8?B?UGtpKzlXSzRvUXhXbGVkWXh4RkMyUFF5SFdBenFXR3YzSStsVGprNG91L09G?=
 =?utf-8?B?K0ZjU2RDUkxvQWwxcGVCTUpRUjB4RXVtNktYSGZSTjdKYVpOL2hOVUZsRGlW?=
 =?utf-8?B?Q0dIM0V3b1BDTWlhazRWWjZaS3BZdWZmZEVTUUtMd2lONURXVnRseUp3LytK?=
 =?utf-8?B?VkxFMDViMzBtcW4wZ2g1VGYrVDIrYXVXb1VtNEJPOXRiYXpkWGhJN0xKTTMr?=
 =?utf-8?B?b0xnRHR6MjZMMFpRWVpuVjVYTWJJSXZVREJZR1BwdWw3Q0ovWXN3dUtxZllr?=
 =?utf-8?B?bDlVeEU0Zk5JaXlkNmVsMGpzS2NCS3duUXJOb2crZVFINmFRUEhyRDd1UHgw?=
 =?utf-8?B?QkpDYWZXNG11SUpPN0piVXRvbWNwOW9DMVNNZElVTERtOVpGL1BXejF6U1pQ?=
 =?utf-8?B?eHVYZC9URGJxVG9uTDhlc1ZDVUlXa0RSbm1TRTZISHljUnZUQnNLc29Bc3pS?=
 =?utf-8?B?b0JkdkwrbHFYTXVRSFVHSkZLamlHNDRFRzZkeUJPQU9mRDVkamxSVDlyWHRO?=
 =?utf-8?B?cjlTUTFhTjNZblZJd3hKY2RTQUtoeC94dUZycE5yR2I3UFU4bFF6NmlsZ3py?=
 =?utf-8?B?VGROemN4NEJOMEhZOUVwNlkra1ZDSzdJanJtanlOdFdaSUVtZEhkM0Q5Z01U?=
 =?utf-8?B?ME5hcDFCcG40ZzdMOWUvREd5cTE1dDVyaEFYMHBKK0l6R0haaWxMTlUyOVFE?=
 =?utf-8?B?VGhrV2lWcmRFMmlhZERvQjlYdjJwN1dmQ2tlL283eTQzb2gwL0w0WVhGNU01?=
 =?utf-8?B?cVZqM3VuZlg1eGVMMTRSYVFJY3RTcHpiaWtGTkkxK1RRVldLQXlkVDNsK2pO?=
 =?utf-8?B?TXIyTkE5cVg4NkhTaGFmVlFxS0lEU3U3Z2ZKbnZqME5VZ0h3L05NdDZmdnpo?=
 =?utf-8?B?Q05UQld1N0Q2Z1k3SXY1VWdTWk1aVDJDNTBIWEtFbzdZVXlyUDV5aEV5a0g0?=
 =?utf-8?B?SXhqU0J0Y21qRGVaUHQ0TlZ5ZHFFRVBJMVhMRldtK1JDNDd6ZjQvNlg5NHp4?=
 =?utf-8?B?UFpGVlBsb2VGZGx2S0t2amtXVDBpV211d3llajczS1UwNktNaVArQkZQb0ZZ?=
 =?utf-8?B?L1V6WFZSOG90cmRVZ1BXVS9rMTFUektKUStrYVNRN2UwMnRzdHlQVTU2a1VU?=
 =?utf-8?B?MktqcDdJVWE1ODJFUjFaVmhCZWFIMWpybTcwNE5MeFBvc1orakNLUFcrM1hW?=
 =?utf-8?B?WUIwTzFiTWtyQUw5bitGVUJHa0Mxc1FKd29XdWxIUzlFbEc5a0VpcU1QT3lP?=
 =?utf-8?B?U3ZwS0FHS01qL1RhQ1NXZWJpSUh0WXJlbUE3R2FWaHMzTGZNNU9wTy92eDUw?=
 =?utf-8?B?OFpDKzdNWjJFNTdoZ1FqRyt1azNPRlI3NUhDMHlqK0dFYnVYUTVDMkwweXJQ?=
 =?utf-8?B?dm4vdXgxeGFHSmt4SzdsbU45dmRkTDA1eEs3VjhiSmJwU3lhRGVZNGNVcElC?=
 =?utf-8?B?SzVrRVZzRnhaNE4wMWRhRHRFT1Q3Zkl3SGpiQXhUeDdmMC81TVEwMTlvZVl6?=
 =?utf-8?B?cnlwYmtldlFTUWdocENuNGxJQ3J1czNTdG9Fc0d1K3RSWDhkZjN0WkZmYWFS?=
 =?utf-8?B?enJPNWxMaE14aFFyQmpoUDJRVGxrUDlvVWM0NE5WSjJsaWVoM1dObWpmSDdx?=
 =?utf-8?B?c1VjV2JJSE45MDIySDZZRG82MGthN2ZqZWd1TDZWL2VqTEVldkxRQUdjeGp6?=
 =?utf-8?B?RGxsQ1FaU0tRWEdNVmU5RlFvZXlkMkk1MTNtRWRLRHIzYW9aKzBKdzByY2Z5?=
 =?utf-8?B?T0tncVBNbm1vT0NnM09XV1dmdnVwY0FiclJnMWtVZHMxUEtkUGwraUd2NzBx?=
 =?utf-8?B?dkVoSDlrVkg3d01DUHJBTCtDSEpBZEdjb2tvOU1rYi81TVVzeHhEZmlsa01V?=
 =?utf-8?B?ckllcC9VbHMySXBzWnRjaWtuSzE3UEZiT0M3bDFmSVhiK1JicCtuOVdSd3JP?=
 =?utf-8?B?QnBsSDlaZzgwREdiK1NRRjgwZnRiY1dMWTZ4LzQ2WG5LczVZdE9kajk4MlY5?=
 =?utf-8?B?Z2tPaVdpc1IzZ3lRZUZPRXpicXpzNlI0cTIvaitvOEdXTmlwQXhxT1k0RHJi?=
 =?utf-8?Q?BYk2JoUmdszCmVaDwSALprEaV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3140947519AB984E9922C3E07F37F1C5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b8b19f-5b19-47d0-6002-08dbf5260c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 00:06:36.9826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PO1VeEqfZDwkznTsQDxZ53ggNxZ6PhqRe/07NBdjgya13CvTUAdV21+pc7JeRAidsDHiJ/iglrmZHAllbzxWbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9213
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEyLTA1IGF0IDEwOjAxICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
VGhlIGN1cnJlbnQgY29kZSBwcmludHMgYSBtZXNzYWdlIHdoZW4gd2UgZ2V0IGEgY2FsbGJhY2sg
d2UgZG9uJ3QNCj4gaGFuZGxlLCB0aGlzIHNpbGVuY2VzIHRob3NlLCBidXQgbWF5YmUgSSBzaG91
bGQganVzdCBzaWxlbmNlIHRoZW0uDQoNCkhvdyBhYm91dCB0aGlzOg0KDQpJbiByNTM1X2dzcF9t
c2dfcmVjdigpOg0KDQppZiAobnRmeS0+Zm4gJiYgKG50ZnktPmZuID09IG1zZy0+ZnVuY3Rpb24p
KSB7DQoJbnRmeS0+ZnVuYyhudGZ5LT5wcml2LCBudGZ5LT5mbiwgbXNnLT5kYXRhLCBtc2ctPmxl
bmd0aCAtDQpzaXplb2YoKm1zZykpOw0KCWJyZWFrOw0KfQ0KDQphbmQgdGhlbiBpbiByNTM1X2dz
cF9vbmVpbml0KCk6DQoNCnI1MzVfZ3NwX21zZ19udGZ5X2FkZChnc3AsIE5WX1ZHUFVfTVNHX0VW
RU5UX1BFUkZfQlJJREdFTEVTU19JTkZPX1VQREFURSwNCk5VTEwsIE5VTEwpOw0KLi4uDQoNCg0K
DQo=
