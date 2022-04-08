Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA04F99E3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3757F10E6A3;
	Fri,  8 Apr 2022 15:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4D310E4C6;
 Fri,  8 Apr 2022 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1649433048; x=1650037848;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a+p/4J/jJEq1bQVVDc79BMDUPJIV6y4mbuSid/lZXDA=;
 b=eg5dZbFyQLuicY80b/O+lOG67xDlDAlOtTV+lueiQ99dAzQT6YK27T1R
 T/ofHKDc/IryUb/uw1Dwecr2R1b/MFE2wT4oInECxAcmu2bEn8/ZSWDTF
 2VwYkQ3w4e0KDUUOy7b5qt9bR6Xmmjvg6CTsiCU2C+xSGD8eudSifVx4t E=;
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 15:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P53uOOcS2Xywx7vZ845GiMqA8W5az2BlTg8pcSigsT83i8YLXAoXCpymECD8w3cOmbtXGpdBAckm2fC7xqVUO8sIZKVyIsdQcloWhT8jtIxeadfja0ZjWpXt0lTUv/0BCn6PunsYjUjOGP5f+OolFEHudYGKFRNVn0z+rdLvYHGAES9iEEk6WgmVsQXnob1glsVq16eu/GdyfSgBkB162fgw3DhFbInAPaZx81strq277OnA7DXMysgRNRhDRrZvvyXt5o8oeLWfXChgxKqqHlg88/0VCF7RbqkgNt1TgI8x45XXd0khwAS0UmleLtb1czCTg8gmLdE3nmxv0lg0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+p/4J/jJEq1bQVVDc79BMDUPJIV6y4mbuSid/lZXDA=;
 b=Q+0Iku9eFy+jW7wj2ImrznwYaXUcQbSuobAJO6mLLF0TMQ+pdRKRCoDo2EwQ401n2U0+fMmTRFZk05UYMzamzBeGE+P/Wq1tv3/NhOSYz9mRT/P8It7mkS9d67hje8fJHNJJl6IuM/yft8orC/vbL6aDiidv/6mdnq/XQyP1RHIfEKsyxNQ2/hgxqcAlzQ/kCW4QWSrd8ChNotWtRMhpNPZbrQ52WAdxbS2nRsCPc+AlZciOf3qFdTGp2yxz0uKoKKY1WmWhX5ERGe56uq4LpRgK3FYmrpxf6nKme4RLhoI/YPHNsY+plSvydNVGWZ1SXvFWkoYdwaptIPsKIysaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by BL0PR02MB4420.namprd02.prod.outlook.com (2603:10b6:208:4c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 15:50:40 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 15:50:40 +0000
From: Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Sankeerth
 Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently from
 dp
Thread-Topic: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently
 from dp
Thread-Index: AQHYRE/UsJWR5XLNukW2wMYYKa9U06zYfJ8AgACEi0CAASMMgIAF9JqAgAA0tICABDr0AIABcYYAgAA2HwA=
Date: Fri, 8 Apr 2022 15:50:40 +0000
Message-ID: <MW4PR02MB7186577BFEEF3CCD8DED3D44E1E99@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
 <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com>
 <MW4PR02MB71865B8E17F3D194B05013EDE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJpqFh7c9ohDbR_0kG5t106-djE7TYfaoAbiT-W4-294jTw@mail.gmail.com>
 <MW4PR02MB71868617E96D59D659EFD87EE1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJpqd+JVHqjNrwZ4MHi+9JMdA5QPX2UwGpeM6RhUntv0brA@mail.gmail.com>
In-Reply-To: <CAA8EJpqd+JVHqjNrwZ4MHi+9JMdA5QPX2UwGpeM6RhUntv0brA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b47f9b2-5f57-4f42-2637-08da19778852
x-ms-traffictypediagnostic: BL0PR02MB4420:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR02MB44200F03D6D22A4E97555182E1E99@BL0PR02MB4420.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZXMYvW9qRpOZC6avxErbPTVpr8UGqhucZ+rpFDRHxv64WeanN+HFOMQsrJRhSmTRDDVKpkDX9CRQ2svBBmh7KuqKWcGUMYufpdyaZsG9lEH5/rB2D+5Uj6FFKCWE2FVnqfs/dwSfe42IqujOC5vxRk0si3/scm1nHT7TszROLSWwGfNdiHNCsFc5tFtgeewmaxs+fUl8NE6Jy5Q3cfa0SsaqKxX43nIwJtOtwyXYPGrVc5CRgpOYmTXFQtW+GWXH7CUuiuQ/nGYwoEHyifwOfxrZbAfS8jJ5s0FiqChYqFPArfJG3Xa21zwF/i6+OWjRV493c80Cpg/QUBBK8aSTcUgQokUqEsLQ8A/H4g70/HJnbh+7za/DNO/dgeoYRD6+TFYgVDxXwRMPn7qQZP5DRjDGuT6sFTLPD5m9LDZvHPmbHbtSWU/gfhnbZWgbzdqNhZpqMupkWULQqODJLjQxt4v7Uq9SdYKzCmwoM3VwHWGD1znqU9xpV7ZqmU/B5G2wm3N4L7+Gsb61Sip0qK7PX3klRPuW99tmIIX7gI7YPKcJ6GHk7h6ywvnK5q7NFbWNRWL31bbMb5gVtZYEFfJjFE9zdchc8vyUuKqJ5BjdfVFHmmnjYzdg/X7Tb+FBD9vUyK3YZWesNY7EnTpwqgeayzzDcbIhie6wlaPX2R2sp2B5VJV1KjC1UvxVmZftFeLYJI76FN4YmGQhAgIU8WwCCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(107886003)(38070700005)(38100700002)(6506007)(71200400001)(7696005)(122000001)(54906003)(508600001)(966005)(110136005)(9686003)(316002)(7416002)(2906002)(33656002)(186003)(86362001)(5660300002)(26005)(64756008)(66556008)(4326008)(66476007)(52536014)(66446008)(8936002)(66946007)(8676002)(83380400001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTB0emIwQXJ3Q0RBa1diV3hOTFErZUdic0JaTWJ5REp5WGh0bGJYN1BiUk1l?=
 =?utf-8?B?R1ZqbTlmNlBYUHRoWDJjN2I0YzRMc0ZzdTNyS3RGbitQMmQ4VG9UNm85MHpC?=
 =?utf-8?B?OFdRQkNUSnhYWmtNaUZKNDEyZktrQzhTbnkyR2VLQnlLRFh0OWd4VnltMHZt?=
 =?utf-8?B?UHRQRzhkUDJGM2RmTUJ6SFlXRm10RDNkM1VNUDJ0bXlqNE9zZGo4TmNHVjN4?=
 =?utf-8?B?YlhTNks1OWRGVmpKb2o1U1ZZREQ4K2tHL1paUS80bk5kQUxET0NocDZlczll?=
 =?utf-8?B?bWY2N1YxOU5kc09XcUNzejgyRENMUi9lbjh2azJNcUx0OEpkaU44MGk5VUh6?=
 =?utf-8?B?QXFCUWNtNVAwVjVEOUhZelNieTFyTC9RREpFZjQxL1EyQUh5UXAzMTBPWStr?=
 =?utf-8?B?SitqaXN2VTI4TmpYMTZERjgzQ21GYnpCczlQc0kvKzVBUVhRclZxWUIvTXZm?=
 =?utf-8?B?WEU1cXhtanAxQ3dwc21FdnQrMkNNbC9jNzlWUjJqTFg0MmgrWktMamZCc2NY?=
 =?utf-8?B?V215NXFpd2l0YVhjc0ZSTElPNjA4MElWeU9yaGNNQnlHclZJTkh1WVdVSmY4?=
 =?utf-8?B?VC81K1pzclh5SGdpZlk5SktBU1RNMWsvc1JDWnRiYkcvWFhJbmloZUdqamRp?=
 =?utf-8?B?T0tiVFRBMTFlZm1CNHZZL2w2YkJQelgwLzhJeEpMVnNqYTdSalpHLzljaXJ1?=
 =?utf-8?B?ZG5Bcis5d2xmRExkQUNxSWllOXJnVUwwZWxCMzI3OGhZYks4N0FTaU0xNUtz?=
 =?utf-8?B?YXd3MStuTEpZZHF1ZklrN0k5VlFVcS84N05wZUUveHhEMzhzRG94bnpVcGEy?=
 =?utf-8?B?b21LUWduSU8zQzUxblRmUFRRczZHTC9zRDI5czhtZm41YzUvaG5VSnI5bHE0?=
 =?utf-8?B?RFg5R3RIQlZWcVk3aHduMFNhUXYyN0xjM1NHTjhSOFU0aVVSRDFRRjcxWEJ2?=
 =?utf-8?B?UGFuWmpoWGVROTllLzNlZVQxMGFTaTNGa1dLNnlJWjF5SzB1OVZqeTdmU08w?=
 =?utf-8?B?UFdVN2puWXhvV1FQQ05mcS92cmRycENLalMzV0R4N29RbXpNYTZLNjBmZDk2?=
 =?utf-8?B?SGw1ZmpjY3hFZWR6L1labjVpdVhxSVRlRUVoOVNJZmRleHdieEowaWFLRHl5?=
 =?utf-8?B?Z25pc2lvMTZsYmMyNGhHVW5jcnhUQjZlWU5wN2RxVTJoNFdnbWdjbE1tbGtZ?=
 =?utf-8?B?SmNidjVYMElRTDhDMGtkRFlybXp6T3NzSk1LMytyTStETEM3LzZsZWl1clhG?=
 =?utf-8?B?TFRGRnNFR0dDWjQ1d1ZWbTZ6MmhQVGR0SDluVEFQaWNWTExJdkh2UzR0MVQ0?=
 =?utf-8?B?eTdwMzloajNwNHkyZFQwQnQ1QjdIcml4VWo1bng3aXBUb3VkdmNWaFdYZ0gx?=
 =?utf-8?B?Z2lWd1ZXdlNPcEdnY255eE5xc1dFYTBZUjFKZE5Lanl1YS9JQlUvcmcxem1V?=
 =?utf-8?B?bHpqdTlMUHhSeWtNeHZyNC9qWktMSEFwdHZQSEMvRnlyMHJiZ1kvUGxZWElM?=
 =?utf-8?B?dG11VHh0Tng0OXlLTkh5UDJBU2xPbGtQUDk5aWtEdTRYMkFUWnhZRXZtdzRv?=
 =?utf-8?B?V05QUFgzSWxhUmFpdTkrdGdkVUZSbW5hWGp2eE80SXBQMHBXVjZlWGtMblZZ?=
 =?utf-8?B?dGZpaFpQUWppQkVWaVAwR2RQUHRKQ2w1TzVDM3NWNGxDV1VQWGhCQndyMXJK?=
 =?utf-8?B?aU1kMmk3NzhCQnlmSFZPRkk3T2s2NXJVTG1zdEk4MHVQYXduYWtTREd0WW4r?=
 =?utf-8?B?bXNnSkgyMWF0N1N3dkJGaVhBUzd5NTNIejRaQ29VZnZNdHM1eGVHMFYwbmpS?=
 =?utf-8?B?T3E4bUNpTXFRaXZuNCtBbEFjOWxYQW1JU1pUQ1doZnRjdzFQQ2k4REZEWmpY?=
 =?utf-8?B?RU12RjNZQ290dXRIV0w4aVk4QUlJajBlM25NdVN4d3ZIMUgxczhUSkxXUTB2?=
 =?utf-8?B?OXFsSFJkb0dyZm9wY0tqQ3RDUDB0Qk15eWtwQVlFYXljY1hncjlaeFR5aVEx?=
 =?utf-8?B?QjZLL0R4YkxaUy8wODdOVkZxUkl0N2tUdWRrTUdaN29JQnlDejIvMXNYanoz?=
 =?utf-8?B?akM5bk41VVVVVjg1WEc2TEtiNUJSSkp5NlhKSTBZNStBMlBZblFOaWJDRGF3?=
 =?utf-8?B?Tnp1dW1lVjBLU0JmbDNtTm96U1llaHNxTFlJSUhiQmxmSlI4a2h0NjNkU21u?=
 =?utf-8?B?N0RzdG5WQTJBQVU1aDhOOGxTdnRYN082Rng0WHdJWENhbEkzcXhhS0E1a1dO?=
 =?utf-8?B?QTVhdnN5bUg4b3JkSWdYVEtINU8vemczR1lqb0U5bGRmL0lnUlVnN2thQTVN?=
 =?utf-8?B?VnIvNkJKdCs2ZWZKcUxrMHJNTVRwbTFmU0tTalFMenBFYzRKaTlkOTUyQjRE?=
 =?utf-8?Q?bIW89I0Zgsv1H5ek=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b47f9b2-5f57-4f42-2637-08da19778852
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 15:50:40.3947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i+Dz+pNpYvoixKgXk1sxxqKzF+11MUuT5gWXIriWa0WHEOL0Y8VMs2FxJmUU/JUQtavRSuUk4KTlch0sX9IelZksBSb9CQBdePnlrc2Zjss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4420
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
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "Abhinav
 Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Doug Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQo+ID4gPiA+ID4gPiA+IE9uIFdlZCwgMzAgTWFyIDIwMjIgYXQgMTk6MDQs
IFNhbmtlZXJ0aCBCaWxsYWthbnRpDQo+ID4gPiA+ID4gPiA+IDxxdWljX3NiaWxsYWthQHF1aWNp
bmMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFRoZSBwYW5l
bC1lZHAgZHJpdmVyIG1vZGVzIG5lZWRzIHRvIGJlIHZhbGlkYXRlZA0KPiA+ID4gPiA+ID4gPiA+
IGRpZmZlcmVudGx5IGZyb20gRFAgYmVjYXVzZSB0aGUgbGluayBjYXBhYmlsaXRpZXMgYXJlIG5v
dA0KPiA+ID4gPiA+ID4gPiA+IGF2YWlsYWJsZSBmb3IgRURQIGJ5DQo+ID4gPiB0aGF0IHRpbWUu
DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTYW5rZWVy
dGggQmlsbGFrYW50aQ0KPiA+ID4gPiA+ID4gPiA+IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29t
Pg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGlzIHNob3VsZCBub3QgYmUgbmVjZXNz
YXJ5IGFmdGVyDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+DQo+IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC80NzkyNjEvP3Nlcmllcz0xMDE2ODImcmV2PTEu
DQo+ID4gPiA+ID4gPiA+IENvdWxkIHlvdSBwbGVhc2UgY2hlY2s/DQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlIGNoZWNrIGZvciBEUF9NQVhfUElYRUxfQ0xLX0tI
WiBpcyBub3QgbmVjZXNzYXJ5IGFueW1vcmUNCj4gPiA+ID4gPiA+IGJ1dA0KPiA+ID4gd2UNCj4g
PiA+ID4gPiA+IG5lZWQgdG8gcmV0dXJuIGVhcmx5IGZvciBlRFAgYmVjYXVzZSB1bmxpa2UgRFAs
IGVEUCBjb250ZXh0DQo+ID4gPiA+ID4gPiB3aWxsIG5vdCBoYXZlIHRoZSBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgbnVtYmVyIG9mIGxhbmVzIGFuZCBsaW5rDQo+IGNsb2NrLg0KPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+IFNvLCBJIHdpbGwgbW9kaWZ5IHRoZSBwYXRjaCB0byByZXR1cm4gYWZ0ZXIg
dGhlDQo+ID4gPiA+ID4gPiBEUF9NQVhfUElYRUxfQ0xLX0tIWg0KPiA+ID4gPiA+IGNoZWNrIGlm
IGlzX2VEUCBpcyBzZXQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJIGhhdmVuJ3Qgd2Fsa2VkIHRo
cm91Z2ggYWxsIHRoZSByZWxldmFudCBjb2RlIGJ1dCBzb21ldGhpbmcgeW91DQo+ID4gPiA+ID4g
c2FpZCBhYm92ZSBzb3VuZHMgc3RyYW5nZS4gWW91IHNheSB0aGF0IGZvciBlRFAgd2UgZG9uJ3Qg
aGF2ZQ0KPiA+ID4gPiA+IGluZm8gYWJvdXQgdGhlIG51bWJlciBvZiBsYW5lcz8gV2UgX3Nob3Vs
ZF8uDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJdCdzIGNlcnRhaW5seSBwb3NzaWJsZSB0byBoYXZl
IGEgcGFuZWwgdGhhdCBzdXBwb3J0cyBfZWl0aGVyXyAxDQo+ID4gPiA+ID4gb3INCj4gPiA+ID4g
PiAyIGxhbmVzIGJ1dCB0aGVuIG9ubHkgcGh5c2ljYWxseSBjb25uZWN0IDEgbGFuZSB0byBpdC4g
Li4ub3IgeW91DQo+ID4gPiA+ID4gY291bGQgaGF2ZSBhIHBhbmVsIHRoYXQgc3VwcG9ydHMgMiBv
ciA0IGxhbmVzIGFuZCB5b3Ugb25seSBjb25uZWN0IDENCj4gbGFuZS4NCj4gPiA+ID4gPiBTZWUs
IGZvciBpbnN0YW5jZSwgdGlfc25fYnJpZGdlX3BhcnNlX2xhbmVzLiBUaGVyZSB3ZSBhc3N1bWUg
NA0KPiA+ID4gPiA+IGxhbmVzIGJ1dCBpZiBhICJkYXRhLWxhbmVzIiBwcm9wZXJ0eSBpcyBwcmVz
ZW50IHRoZW4gd2UgY2FuIHVzZQ0KPiA+ID4gPiA+IHRoYXQgdG8ga25vdyB0aGF0IGZld2VyIGxh
bmVzIGFyZSBwaHlzaWNhbGx5IGNvbm5lY3RlZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEl0J3Mg
YWxzbyBwb3NzaWJsZSB0byBjb25uZWN0IG1vcmUgbGFuZXMgdG8gYSBwYW5lbCB0aGFuIGl0IHN1
cHBvcnRzLg0KPiA+ID4gPiA+IFlvdSBjb3VsZCBjb25uZWN0IDIgbGFuZXMgdG8gaXQgYnV0IHRo
ZW4gaXQgb25seSBzdXBwb3J0cyAxLg0KPiA+ID4gPiA+IFRoaXMgY2FzZSBuZWVkcyB0byBiZSBo
YW5kbGVkIGFzIHdlbGwuLi4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJIHdhcyByZWZl
cnJpbmcgdG8gdGhlIGNoZWNrcyB3ZSBkbyBmb3IgRFAgaW4NCj4gPiA+ID4gZHBfYnJpZGdlX21v
ZGVfdmFsaWQuIFdlIGNoZWNrIGlmIHRoZSBMaW5rIGJhbmR3aWR0aCBjYW4gc3VwcG9ydA0KPiA+
ID4gPiB0aGUgcGl4ZWwgYmFuZHdpZHRoLiBGb3IgYW4gZXh0ZXJuYWwgRFAgY29ubmVjdGlvbiwg
dGhlIEluaXRpYWwNCj4gPiA+ID4gRFBDRC9FRElEIHJlYWQgYWZ0ZXIgY2FibGUgY29ubmVjdGlv
biB3aWxsIHJldHVybiB0aGUgc2luaw0KPiA+ID4gPiBjYXBhYmlsaXRpZXMgbGlrZSBsaW5rIHJh
dGUsIGxhbmUgY291bnQgYW5kIGJwcCBpbmZvcm1hdGlvbiB0aGF0DQo+ID4gPiA+IGFyZSB1c2Vk
IHRvIHdlIGZpbHRlciBvdXQgdGhlIHVuc3VwcG9ydGVkDQo+ID4gPiBtb2RlcyBmcm9tIHRoZSBs
aXN0IG9mIG1vZGVzIGZyb20gRURJRC4NCj4gPiA+ID4NCj4gPiA+ID4gRm9yIGVEUCBjYXNlLCB0
aGUgZHAgZHJpdmVyIHBlcmZvcm1zIHRoZSBmaXJzdCBkcGNkIHJlYWQgZHVyaW5nDQo+ID4gPiA+
IGJyaWRnZV9lbmFibGUuIFRoZSBkcF9icmlkZ2VfbW9kZV92YWxpZCBmdW5jdGlvbiBpcyBleGVj
dXRlZA0KPiA+ID4gPiBiZWZvcmUgYnJpZGdlX2VuYWJsZSBhbmQgaGVuY2UgZG9lcyBub3QgaGF2
ZSB0aGUgZnVsbCBsaW5rIG9yIHRoZQ0KPiA+ID4gPiBzaW5rIGNhcGFiaWxpdGllcyBpbmZvcm1h
dGlvbiBsaWtlIGV4dGVybmFsIERQIGNvbm5lY3Rpb24sIGJ5IHRoZW4uDQo+ID4gPg0KPiA+ID4g
SXQgc291bmRzIHRvIG1lIGxpa2Ugd2Ugc2hvdWxkIGVtdWxhdGUgdGhlIEhQRCBldmVudCBmb3Ig
ZURQIHRvIGJlDQo+ID4gPiBoYW5kbGVkIGVhcmxpZXIgdGhhbiB0aGUgZ2V0X21vZGVzKCkvcHJl
cGFyZSgpIGNhbGxzIGFyZSBhdHRlbXB0ZWQuDQo+ID4gPiBIb3dldmVyIHRoaXMgbWlnaHQgb3Bl
biBhbm90aGVyIGNhbiBvZiB3b3Jtcy4NCj4gPiA+DQo+ID4NCj4gPiBGb3IgRFAsIHRoZSBIUEQg
aGFuZGxlciBtYWlubHkgaW5pdGlhdGVzIGxpbmsgdHJhaW5pbmcgYW5kIGdldHMgdGhlIEVESUQu
DQo+ID4NCj4gPiBCZWZvcmUgYWRkaW5nIHN1cHBvcnQgZm9yIGEgc2VwYXJhdGUgZURQIHBhbmVs
LCB3ZSBoYWQgZGlzY3Vzc2VkIGFib3V0DQo+ID4gdGhpcyBpbnRlcm5hbGx5IGFuZCBkZWNpZGVk
IHRvIGVtdWxhdGUgZURQIEhQRCBkdXJpbmcgZW5hYmxlKCkuIE1haW4NCj4gPiByZWFzb24gYmVp
bmcsIGVEUCBwb3dlciBpcyBndWFyYW50ZWVkIHRvIGJlIG9uIG9ubHkgYWZ0ZXINCj4gYnJpZGdl
X2VuYWJsZSgpLg0KPiA+IFNvLCBlRFAgbGluayB0cmFpbmluZyBjYW4gaGFwcGVuIGFuZCBzdXN0
YWluIG9ubHkgYWZ0ZXIgYnJpZGdlX2VuYWJsZSgpLg0KPiA+DQo+ID4gRW11bGF0aW5nIEhQRCBi
ZWZvcmUvZHVyaW5nIGdldF9tb2RlcyB3aWxsIG5vdCBoYXZlIGFueSBlZmZlY3QgYmVjYXVzZToN
Cj4gDQo+IEFzIHdlIGhhdmUgc2VlbiwgdGhlIHRlcm0gSFBEIGlzIHNpZ25pZmljYW50bHkgb3Zl
cmxvYWRlZC4gV2hhdCBkbyB5b3UNCj4gd2FudCB0byBlbXVsYXRlPw0KPiANCg0KT24gRFAsIHdl
IHVzZSBIUEQgZXZlbnQgZm9yIGxpbmsgdHJhaW5pbmcgYW5kIEVESUQgcmVhZC4NCg0KSSB1bmRl
cnN0b29kIHRoYXQgeW91IHdhbnRlZCBtZSB0byBlbXVsYXRlIEhQRCBldmVudCBiZWZvcmUgZ2V0
X21vZGVzKCkNCmJ1dCBiZWNhdXNlIHRoZSBwYW5lbCBwb3dlciBpcyBjb250cm9sbGVkIGJ5IHBh
bmVsLWVkcCwgd2hhdGV2ZXIgcHJvZ3JhbW1pbmcNCndlIGRvIG9uIHRoZSBzaW5rIHNpZGUgd2ls
bCBiZSByZXNldCB3aGVuIHBhbmVsIHBvd2VyIHdpbGwgYmUgdHVybmVkIG9mZiBieQ0KdGhlIHBt
X3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgb2YgdGhlIHBhbmVsLWVkcCBpbiBwYW5lbF9lZHBf
Z2V0X21vZGVzKCkuDQoNCj4gPg0KPiA+IDEuIGdldF9tb2RlcygpIHdpbGwgZ28gdG8gcGFuZWwn
cyBnZXRfbW9kZXMoKSBmdW5jdGlvbiB0byBwb3dlciBvbg0KPiA+IHJlYWQgRURJRA0KPiA+DQo+
ID4gMi4gcGFuZWwgcG93ZXIgd2lsbCBiZSB0dXJuZWQgb2ZmIGFmdGVyIGdldF9tb2RlcygpLiBQ
YW5lbCBwb3dlciBvZmYNCj4gPiB3aWxsIHJlc2V0IGV2ZXJ5IHdyaXRlIHRyYW5zYWN0aW9uIGlu
IERQQ0QuIGFueXdheSBpbnZhbGlkYXRpbmcgbGluaw0KPiA+IHRyYWluaW5nDQo+IA0KPiBJIHRl
bmQgdG8gYWdyZWUgd2l0aCBEb3VnIGhlcmUuIGVEUCBsaW5rIHBvd2VyIHN0YXR1cyBzaG91bGQg
YmUgaGFuZGxlZCBieQ0KPiB0aGUgcG1fcnVudGltZV9hdXRvc3VzcGVuZCB3aXRoIGdyYWNlIHBl
cmlvZCBiZWluZyBoaWdoIGVub3VnaCB0byBjb3Zlcg0KPiB0aGUgdGltZXNsb3QgYmV0d2VlbiBn
ZXRfbW9kZSgpIGFuZCBlbmFibGUoKS4NCj4gDQo+IHBhbmVsLWVkcCBhbHJlYWR5IGRvZXMgbW9z
dCBvZiByZXF1aXJlZCB3b3JrLg0KPiANCg0KVGhlIGVEUCBjb250cm9sbGVyIHJlc291cmNlcyBh
cmUgZW5hYmxlZCB0aHJvdWdoIHRoZSBob3N0X2luaXQoKSBhbmQgdGhlIGxpbmsNCnJlc291cmNl
cyBuZWVkIHRvIGJlIHBvd2VyZWQgb24gZm9yIGRvaW5nIGxpbmsgdHJhaW5pbmcsIHdoaWNoIG5l
ZWRzIHRvIGhhcHBlbg0KaW4gdGhlIGVuYWJsZSgpIHdpdGggZ2VuZXJpYyBwYW5lbC1lZHAuDQoN
Cj4gPg0KPiA+IDMuIG1vZGVfdmFsaWQgd2lsbCBsYW5kIGluIGRwIGRyaXZlciBidXQgcGFuZWwg
d2lsbCBub3QgYmUgcG93ZXJlZCBvbg0KPiA+IGF0IHRoYXQgdGltZSBhbmQgd2UgY2Fubm90IGRv
IGF1eCB0cmFuc2ZlcnMgb3IgRFBDRCByZWFkIHdyaXRlcy4NCj4gDQo+IFdoeSBkbyB3ZSBuZWVk
IHRvIHBlcmZvcm0gQVVYIHdyaXRlcyBpbiBtb2RlX3ZhbGlkPw0KPiANCg0KSSBhbSB0cnlpbmcg
dG8ganVzdGlmeSB3aHkgd2UgY2Fubm90IGhhdmUgbW9kZV92YWxpZCgpIGltcGxlbWVudGF0aW9u
IHNpbWlsYXIgdG8gRFAgZm9yIGVEUC4NClRoZSBkZXRlY3QoKSBhbmQgZ2V0X21vZGVzKCkgYXJl
IGNhbGxlZCBmcm9tIHBhbmVsIGJyaWRnZSBhbmQgcGFuZWwtZWRwLmMgcmVzcGVjdGl2ZWx5Lg0K
VGhlIGZpcnN0IGVEUCBzcGVjaWZpYyBjYWxsIHdoaWNoIHdpbGwgbGFuZCBpbiB0aGUgZHBfZHJp
dmVyIGlzIG1vZGVfdmFsaWQoKSwgaW4gd2hpY2ggdGhlDQpjb250cm9sbGVyIGNhbm5vdCBwZXJm
b3JtIGF1eCBhY2Nlc3MgYmVjYXVzZSB0aGUgcGFuZWwgd2lsbCBub3QgYmUgcG93ZXJlZC1vbi4N
Cg0KQXMgdGhlIHBhbmVsLXBvd2VyIGFuZCBiYWNrbGlnaHQgYXJlIHBhbmVsIHJlc291cmNlcywg
d2UgYXJlIG5vdCBlbmFibGluZy92b3RpbmcgZm9yIHRoZW0NCmZyb20gdGhlIERQL2VEUCBjb250
cm9sbGVyIGRyaXZlci4NCg0KPiA+DQo+ID4gPiA+IFNvLCB3ZSBuZWVkIHRvIHByb2NlZWQgd2l0
aCB0aGUgcmVwb3J0ZWQgbW9kZSBmb3IgZURQLg0KPiA+ID4NCj4gPiA+IFdlbGwuLi4gRXZlbiBp
ZiBkdXJpbmcgdGhlIGZpcnN0IGNhbGwgdG8gZ2V0X21vZGVzKCkgdGhlIERQQ0QgaXMgbm90DQo+
ID4gPiByZWFkLCBkdXJpbmcgc3Vic2VxdWVudCBjYWxscyB0aGUgZHJpdmVyIGhhcyBuZWNlc3Nh
cnkgaW5mb3JtYXRpb24sDQo+ID4gPiBzbyBpdCBjYW4gcHJvY2VlZCB3aXRoIGFsbCB0aGUgY2hl
Y2tzLCBjYW4ndCBpdD8NCj4gPiA+DQo+ID4NCj4gPiBnZXRfbW9kZXMoKSBjdXJyZW50bHkgZG9l
cyBub3QgbGFuZCBpbiBEUCBkcml2ZXIuIEl0IGdldHMgZXhlY3V0ZWQgaW4NCj4gPiBwYW5lbCBi
cmlkZ2UuIEJ1dCB0aGUgbW9kZV92YWxpZCgpIGNvbWVzIHRvIERQIGRyaXZlciB0byBjaGVjayB0
aGUNCj4gPiBjb250cm9sbGVyIGNvbXBhdGliaWxpdHkuDQo+IA0KPiBZZXMsIHRoaXMgaXMgY29y
cmVjdC4gdGhlIERQJ3MgbW9kZV92YWxpZCgpIGtub3dzIHRoZSBoYXJkd2FyZSBsaW1pdGF0aW9u
cw0KPiAobWF4IGNsb2NrIHNwZWVkLCBhbW91bnQgb2YgbGFuZXMsIGV0YykgYW5kIHRodXMgaXQg
Y2FuIGRlY2lkZSB3aGV0aGVyIHRoZQ0KPiBtb2RlIGlzIHN1cHBvcnRlZCBieSB0aGUgd2hvbGUg
Y2hhaW4gb3Igbm90Lg0KPiBXZSBzaG91bGQgbm90IHNraXAgc3VjaCBjaGVja3MgZm9yIHRoZSBl
RFAuDQo+IA0KPiANCg0KRm9yIGVEUCwgd2UgaGF2ZSBubyBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
bnVtYmVyIG9mIGxhbmVzIG9yIHRoZSBsaW5rIHJhdGUgc3VwcG9ydGVkDQpXZSBvbmx5IGtub3cg
dGhlIG1heCBsYW5lcyBmcm9tIHRoZSBkYXRhLWxhbmVzIERUIHByb3BlcnR5Lg0KDQo+IC0tDQo+
IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQo=
