Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5474F8172
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 16:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B356C10EA5C;
	Thu,  7 Apr 2022 14:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8193F10EA60;
 Thu,  7 Apr 2022 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649341179; x=1649945979;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eU/zp7ABwhP3hTkDiaG5edzO4/gp9SuNU0nuoR4MQm0=;
 b=Yt68ReIAW0S/mH2q0g/S3Sb+jSYY2UlsfC2qaZOHPOshhIkz0SbYrMjO
 YkRlXVIvrLXpB/n6ki3sSpCJFwg2t9hj/dfDtThoWPrsxB1yaNRUKS4EZ
 dqJzyDNLkpgEFLSLH+Klc+WEzjzx1EeKPVgfYE3lpG0n0FD9TN5Ej8ac1 s=;
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 14:19:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6UKuZIs9HePIMUiulSBdMO0Uty39VYAO80rGTxZpc1yxjiL0xn4s99lgz70QxXBxk4sp9Phc6ceeyfINoKgX2N+g/5tHk5t2+n0ixQwMNYrPkGQx4iAs2YfOyX2vO+i3w3h8qardP1/E4q+FwFNqR1CKZJtRrd5LPBT5ougFDH0VaKCOy+ZicJ8xtwLyYNubAHUo60r2b/vk7F82myMtngMMoO+4YDNQaLJTUoYJA9KxxVjUWvujDH55eGi6v6kkTE7mQnLBHIdev17dy5H58DkjpnEy/Kh8dkQV8ABfkAFII/DAKGifC1NMRia76npGpqkCv3wq7pdIrIjeYcu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eU/zp7ABwhP3hTkDiaG5edzO4/gp9SuNU0nuoR4MQm0=;
 b=cf5QTU0oOEogJTeaC1MeO8HApE4Cw/ib6Gtdh5yzjCiALvU51anHGBvw12xEJ6h7mHyep0tSugXpDeXpOl8ym5gWDGivrbj6aeLwWiKoLnH6NR1DD2ATBYJ6hy2AAmyx8EkfwGfwvgDRr3Cc44aN+i3rSJ5pRoisPdkeqO9OWAppo7Rz4MUskuLZffnxKvXxemOzJcZuGZNTFTnl7RO398dPsfUs8kCvIjpdA5DCET/2YhepeL6J8KNLprC0RFs0ZAnbDmAZ28wrBUZD7VkiMtpmxVDUdX1y/hR2L5HBbHWu3blgDWCfmIRUIey/wl4MdMkDdIMIbdXECQGdwKyaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by MW4PR02MB7204.namprd02.prod.outlook.com (2603:10b6:303:7a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 14:19:32 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%7]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 14:19:32 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
Thread-Topic: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
Thread-Index: AQHYRE+1+KMNz76x10es+Ckf6s/Ci6zaI54AgAJPIQCAAGyYAIAAN98AgAMsKoCAAQxrgIAARYIAgAAJUACAAAn1AIAC48tA
Date: Thu, 7 Apr 2022 14:19:32 +0000
Message-ID: <MW4PR02MB7186245772DAC3E04FA8D1C0E1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
 <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
 <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
 <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
 <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
 <3e5fa57f-d636-879a-b98f-77323d07c156@linaro.org>
 <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
In-Reply-To: <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f36240ed-f305-4e56-ea4f-08da18a1a2b8
x-ms-traffictypediagnostic: MW4PR02MB7204:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <MW4PR02MB72043CD9C902864D1D0791909DE69@MW4PR02MB7204.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: khBE+rfeyX3E+CHBRwCVZOkVkb4x6TtRlCw98V4yAizcRaRQwtyd3zY80P5Y3IjwnZ8k6AIiNHyenzg2OUnblRt96NPm6RoJKiSkWDU5jCLQwWfzfnxT3MS7O8cFLiwmLCAttagdIFAvyGqhnxX61DFNNAtHT/JR/Q0cXIN9bldl2YyXvNla3XErfTTY5PeW7okMVbJbz7mqDwYyAG23fqneTLZAHr4/b0QdTGcDuEB6mNhHkKVo1k7O6EYwa7Byw+J6ca/IQeD2db4RlYniIMEfsY6zGp3yeujxWYwBk4OJsihGACfmz81Km3pab2V073WHHdqd3YsvK+YWNr1fB6MbD2NNiX7OQo+ID9JuOfddJBfnuksx/bz5EBEzLG7DD7fh+BYtmqBU3WjWOZbizfcbR0jaS60jgMCe3h1PYkYQAn1dcu3yxPW0wCXBux9J90ri8xrMWpU7EQdqNSUiDD2cW2MgQXqA6Nbr4RyXUhmBcGZXHVMQ0le8jbEHdDFQP2Dh2e0yxAmeg8Lz4tZ8NAB0n76Vp5h4/SdaOTelPbLC6QsZ38iwIyXv0AL9aGrDB6myr77ZqQb6yHydyRZLCeJirc2IdE+2wKvlWXxKk2sS1jgybQRHgMHxHpDKRi9XBFOxQSDJUfIzu8PnpxtJd/H1o1PxObggzuF05G2Jf8P4deNghvknLVP+O4JUD9P9QqBmdhLy8oP8K8TFFL58uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66446008)(316002)(66556008)(6506007)(64756008)(66946007)(2906002)(71200400001)(9686003)(110136005)(54906003)(53546011)(76116006)(5660300002)(38070700005)(4326008)(7696005)(33656002)(186003)(107886003)(26005)(122000001)(83380400001)(8936002)(7416002)(508600001)(55016003)(86362001)(8676002)(38100700002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STh0RC9mcWpiUjFvK1B5NWZMWkwxY1RDK25HZDJKeWJjRmYzcThEWjVNbDdT?=
 =?utf-8?B?QWI1ZGtONXpjUDY3eE91RkpCZWRLZ1dDZ3dOQm9VNTJiK3BSWmtSa3Q4aC94?=
 =?utf-8?B?QWhPejVXV2ZtTWdJV3NQbWdCUWRiby95UHR1OUlzMU1mTng0MWpabDZ2OGlS?=
 =?utf-8?B?UHNRU2RMU24zdkYxMll3L1lscE0vdzdhbXp0UXFXdGFyRi9iRzB6bVpuQUsz?=
 =?utf-8?B?clp1cjNaYlJOeS8wZmVBd3JidEduUEtCUWxTSXF4bTN6UndCLzlaR3BHR0Qy?=
 =?utf-8?B?QTg5aTdPSjF1WU5COTVNZjFGNHc3RlJjaGQ2T1dROHhjdVBKam16UXR2NFMv?=
 =?utf-8?B?dWJGankrTWYzRmxVU2tZaDllLzJIYmtQYy9LaXo1TlBQeTkyT2o2K0R4cWVF?=
 =?utf-8?B?VEJOUnNuUllISldXa2l4dnU2ZWlFVlczZXMzWW5qazU1R1VIUEFwemU1dGxU?=
 =?utf-8?B?T25NTVJCOGhQbWFPNFF1cFREQi9ZWDI4RVVEMXpuL3FQekRTQ24yTFoxZkh4?=
 =?utf-8?B?NzNJOWVwaU1DRU44RTREUGFZbjRKbGhQOUhKWUtGeVFMU1RFekhYZlo5TzhL?=
 =?utf-8?B?bUJXSTdXdVhTRkRicCtISXVCYXpRMm1MRUwxY1E4V3RlREJocTU1QXNHWWl5?=
 =?utf-8?B?SkdnY2FBSEZyQWcvb0pyTDRNV2l2SGJ5VFhnU0lPS05oRlREa0dISFk0d3pW?=
 =?utf-8?B?SHBhQlBBbVg2WnIwM2s3R0dMMm5kZlgrZDZEL1RHMzJDczY3WU44bk4yUHAw?=
 =?utf-8?B?UjUzQlJ1VHJGOEFmZmQ5YS9VVW9zVlk5eWZQVUlvTUNkSzdudEVoc0Jubmtu?=
 =?utf-8?B?S1lXTGVOWnkrT29tM1BMUzQ4UmFZR2NIRnNWTlQrRUFvUU92eE9LSFhaWWNz?=
 =?utf-8?B?MnlvcnpiTEI3aGo4NVZwMTB0MjhsbWxMNXdkQWlRc204dnFQcE8wb2xNbVRh?=
 =?utf-8?B?YjZTYXN5ZHkwemE0cFh2UjdGSDhUUDIwTmRPNkJ2QXZReklaQW03c3FkdzZw?=
 =?utf-8?B?aklaTDB6bnNqT1BQVDVTNG9OT2twTHFqelJpNUN0Vm5COWl4UE9HcUxTT0N1?=
 =?utf-8?B?Y0NrMkVPQzZSVGlLL2N5SGF0KzU4U2VtcnBPTmtUdk5Mb3RXQ0JjUlNrc0lO?=
 =?utf-8?B?cWFvVFltNUptM0JoaFEvdVhMUjFoeXZNOVZHVjFsL1hNTVViM3NUR0pYOVMv?=
 =?utf-8?B?S0RqQnFqT2pRUDQxZG5lb0d2OTJ1bDJEeTFNb2NGSUpVYnlyV0ZOa2Y2UXcw?=
 =?utf-8?B?aThEWVNNcXlSc0tjdzdad3NMSkE0aW5IUlhtVW9BTW5yZzYrdWZnNUpwZE9E?=
 =?utf-8?B?eFQ5MGoyLzYwVW80Nm14QkVYUGRqNVlmbGFrdlFVTTM0Y0lxeVBNOHFUZE9i?=
 =?utf-8?B?RkdlMXlGSDFYTkp3MXcvK1E0ZCt4RVk0aFRWemhtWWxmMktNWWI4YVBzTTJm?=
 =?utf-8?B?NUs2akhCRUlLaFR4ZXA5NEhDUlYzQU5qOG5uZWRjTzVQeGpaem1Oa0JqR1c3?=
 =?utf-8?B?blR6T210VzlzUm1lWnB6SEhJRlZDKzdNVEQvbEpGL1JYZGJQL1hJelJUR1dk?=
 =?utf-8?B?aE9qdXZ5SDZ0MTFSOC96YjlmVG1nM3FUQ3Qrb21nUW1wYlBTKzhIcFVmWU1w?=
 =?utf-8?B?bWNhY292RXNrakNQTThIUE5KSktXNDlnVFZCdDJVNHl6ekNVOG9VMFdFRlZq?=
 =?utf-8?B?WldwVTgrNFN6Q004L3hhY3JZMXZDemlNbVdkeUd5eUxRRElmMll0NXIydk5K?=
 =?utf-8?B?bmlkc1djc0RkVlNEeGZjWkpOQkFqelk5QnI5VEFya3oyMERuVmtaa0NHOFNv?=
 =?utf-8?B?UkZ1czZ5SkdSa1A1Z0RxRittQUVIU1VnYTRGdW4yc2lFTk5SMUtiN1hvZXN6?=
 =?utf-8?B?V1BCZEZEWU5DbXV0aW94Yk1UYTBKWm95cEhFNzRFT08zU0gyRlpLc05IUHBO?=
 =?utf-8?B?azMzemRJNnBwUWdsZjZ3WnVLZVdQc3d5RDBBNnppbEZyYnJtVUlJcHpGUmh2?=
 =?utf-8?B?SjliZEQyd3NYa3J0OG5RaU9ucDc5dVlTYlJKV2FnekRkUzQ2L1RxcUY3L0s5?=
 =?utf-8?B?U0JzQlpMZVkwdkJkYkhsMDh3YVYxN1N1QWg4QVBoSVlFRnpsTnpaWkNGV1Z4?=
 =?utf-8?B?Ly9oOHhKdGRvT1FsdXZ6cEFWd1phWmxiYTFLcG4xcnFpQ1pGRzFGQnZVRE9w?=
 =?utf-8?B?Z1QvQlg3TXU5SWpGZFJTUFdYMmxSNGphQU5GRU9TZWhER1ZlQ0xPWkk1TFNR?=
 =?utf-8?B?L2NPQUIxMjlQZW1XQ05BUXlCSkZOQ0ZHRVpCc2wwOHlnNDVGcVIvTWlwNnRX?=
 =?utf-8?B?M0tSUFZteFBkRUN5RWZ1SHJOV3RQNGd2SFZoUWw3Q2l0dzd1ZEtvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f36240ed-f305-4e56-ea4f-08da18a1a2b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 14:19:32.3144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FXe+YJ1oJ+17+DX9EeL90T/M1XUVIur4CKHhU2iH9WUfekE58EAIPCFNxXswrveUD8GE6IVfyCNkz7e8qWDUbMb0jXsghVpGOEOAqEi7amM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7204
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
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>, "Abhinav
 Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5IGFuZCBEb3VnLA0KDQo+IEhpLA0KPiANCj4gT24gVHVlLCBBcHIgNSwgMjAyMiBh
dCAxMDozNiBBTSBEbWl0cnkgQmFyeXNoa292DQo+IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5v
cmc+IHdyb3RlOg0KPiA+DQo+ID4gT24gMDUvMDQvMjAyMiAyMDowMiwgRG91ZyBBbmRlcnNvbiB3
cm90ZToNCj4gPiA+IEhpLA0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgQXByIDUsIDIwMjIgYXQgNTo1
NCBBTSBEbWl0cnkgQmFyeXNoa292DQo+ID4gPiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3Jn
PiB3cm90ZToNCj4gPiA+Pj4gMy4gRm9yIERQIGFuZCBlRFAgSFBEIG1lYW5zIHNvbWV0aGluZyBh
IGxpdHRsZSBkaWZmZXJlbnQuDQo+ID4gPj4+IEVzc2VudGlhbGx5IHRoZXJlIGFyZSB0d28gY29u
Y2VwdHM6IGEpIGlzIGEgZGlzcGxheSBwaHlzaWNhbGx5DQo+ID4gPj4+IGNvbm5lY3RlZCBhbmQg
YikgaXMgdGhlIGRpc3BsYXkgcG93ZXJlZCB1cCBhbmQgcmVhZHkuIEZvciBEUCwgdGhlDQo+ID4g
Pj4+IHR3byBhcmUgcmVhbGx5IHRpZWQgdG9nZXRoZXIuIEZyb20gdGhlIGtlcm5lbCdzIHBvaW50
IG9mIHZpZXcgeW91DQo+ID4gPj4+IG5ldmVyICJwb3dlciBkb3duIiBhIERQIGRpc3BsYXkgYW5k
IHlvdSBjYW4ndCBkZXRlY3QgdGhhdCBpdCdzDQo+ID4gPj4+IHBoeXNpY2FsbHkgY29ubmVjdGVk
IHVudGlsIGl0J3MgcmVhZHkuIFNhaWQgYW5vdGhlciB3YXksIG9uIHlvdQ0KPiA+ID4+PiB0aWUg
ImlzIGEgZGlzcGxheSB0aGVyZSIgdG8gdGhlIEhQRCBsaW5lIGFuZCB0aGUgbW9tZW50IGEgZGlz
cGxheQ0KPiA+ID4+PiBpcyB0aGVyZSBpdCdzIHJlYWR5IGZvciB5b3UgdG8gZG8gQVVYIHRyYW5z
ZmVycy4gRm9yIGVEUCwgaW4gdGhlDQo+ID4gPj4+IGxvd2VzdCBwb3dlciBzdGF0ZSBvZiBhIGRp
c3BsYXkgaXQgX3dvbid0XyBhc3NlcnQgaXRzICJIUEQiDQo+ID4gPj4+IHNpZ25hbC4gSG93ZXZl
ciwgaXQncyBzdGlsbCBwaHlzaWNhbGx5IHByZXNlbnQuIEZvciBlRFAgeW91IHNpbXBseQ0KPiA+
ID4+PiBoYXZlIHRvIF9hc3N1bWVfIGl0J3MgcHJlc2VudCB3aXRob3V0IGFueSBhY3R1YWwgcHJv
b2Ygc2luY2UgeW91DQo+ID4gPj4+IGNhbid0IGdldCBwcm9vZiB1bnRpbCB5b3UgcG93ZXIgaXQg
dXAuIFRodXMgZm9yIGVEUCwgeW91IHJlcG9ydA0KPiA+ID4+PiB0aGF0IHRoZSBkaXNwbGF5IGlz
IHRoZXJlIGFzIHNvb24gYXMgd2UncmUgYXNrZWQuIFdlIGNhbid0IF90YWxrXw0KPiA+ID4+PiB0
byB0aGUgZGlzcGxheSB5ZXQsIHRob3VnaC4gU28gaW4gZ2V0X21vZGVzKCkgd2UgbmVlZCB0byBi
ZSBhYmxlDQo+ID4gPj4+IHRvIHBvd2VyIHRoZSBkaXNwbGF5IG9uIGVub3VnaCB0byB0YWxrIG92
ZXIgdGhlIEFVWCBjaGFubmVsIHRvIGl0Lg0KPiA+ID4+PiBBcyBwYXJ0IG9mIHRoaXMsIHdlIHdh
aXQgZm9yIHRoZSBzaWduYWwgbmFtZWQgIkhQRCIgd2hpY2ggcmVhbGx5IG1lYW5zDQo+ICJwYW5l
bCBmaW5pc2hlZCBwb3dlcmluZyBvbiIgaW4gdGhpcyBjb250ZXh0Lg0KPiA+ID4+Pg0KPiA+ID4+
PiBOT1RFOiBmb3IgYXV4IHRyYW5zZmVyLCB3ZSBkb24ndCBoYXZlIHRoZSBfZGlzcGxheV8gcGlw
ZSBhbmQNCj4gPiA+Pj4gY2xvY2tzIHJ1bm5pbmcuIFdlIG9ubHkgaGF2ZSBlbm91Z2ggc3R1ZmYg
cnVubmluZyB0byBkbyB0aGUgQVVYDQo+IHRyYW5zZmVyLg0KPiA+ID4+PiBXZSdyZSBub3QgY2xv
Y2tpbmcgb3V0IHBpeGVscy4gV2UgaGF2ZW4ndCBmdWxseSBwb3dlcmVkIG9uIHRoZQ0KPiA+ID4+
PiBkaXNwbGF5LiBUaGUgQVVYIHRyYW5zZmVyIGlzIGRlc2lnbmVkIHRvIGJlIHNvbWV0aGluZyB0
aGF0IGNhbiBiZQ0KPiA+ID4+PiBkb25lIGVhcmx5IF9iZWZvcmVfIHlvdSB0dXJuIG9uIHRoZSBk
aXNwbGF5Lg0KPiA+ID4+Pg0KPiA+ID4+Pg0KPiA+ID4+PiBPSywgc28gYmFzaWNhbGx5IHRoYXQg
d2FzIGEgbG9uZ3dpbmRlZCB3YXkgb2Ygc2F5aW5nOiB5ZXMsIHdlDQo+ID4gPj4+IGNvdWxkIGF2
b2lkIHRoZSBBVVggdHJhbnNmZXIgaW4gcHJvYmUsIGJ1dCB3ZSBjYW4ndCB3YWl0IGFsbCB0aGUN
Cj4gPiA+Pj4gd2F5IHRvIGVuYWJsZS4gV2UgaGF2ZSB0byBiZSBhYmxlIHRvIHRyYW5zZmVyIGlu
IGdldF9tb2RlcygpLiBJZg0KPiA+ID4+PiB5b3UgdGhpbmsgdGhhdCdzIGhlbHBmdWwgSSB0aGlu
ayBpdCdkIGJlIGEgcHJldHR5IGVhc3kgcGF0Y2ggdG8NCj4gPiA+Pj4gd3JpdGUgZXZlbiBpZiBp
dCB3b3VsZCBsb29rIGEgdGFkIGJpdCBhd2t3YXJkIElNTy4gTGV0IG1lIGtub3cgaWYNCj4gPiA+
Pj4geW91IHdhbnQgbWUgdG8gcG9zdCBpdCB1cC4NCj4gPiA+Pg0KPiA+ID4+IEkgdGhpbmsgaXQg
d291bGQgYmUgYSBnb29kIGlkZWEuIEF0IGxlYXN0IGl0IHdpbGwgYWxsb3cgdXMgdG8NCj4gPiA+
PiBqdWRnZSwgd2hpY2ggaXMgdGhlIG1vcmUgY29ycmVjdCB3YXkuDQo+ID4gPg0KPiA+ID4gSSdt
IHN0aWxsIGhhcHB5IHRvIHByb3RvdHlwZSB0aGlzLCBidXQgdGhlIG1vcmUgSSB0aGluayBhYm91
dCBpdCB0aGUNCj4gPiA+IG1vcmUgaXQgZmVlbHMgbGlrZSBhIHdvcmthcm91bmQgZm9yIHRoZSBR
dWFsY29tbSBkcml2ZXIuIFRoZSBlRFANCj4gPiA+IHBhbmVsIGRyaXZlciBpcyBhY3R1YWxseSBn
aXZlbiBhIHBvaW50ZXIgdG8gdGhlIEFVWCBidXMgYXQgcHJvYmUNCj4gPiA+IHRpbWUuIEl0J3Mg
cmVhbGx5IHdlaXJkIHRvIHNheSB0aGF0IHdlIGNhbid0IGRvIGEgdHJhbnNmZXIgb24gaXQNCj4g
PiA+IHlldC4uLiBBcyB5b3Ugc2FpZCwgdGhpcyBpcyBhIGxpdHRsZSBzaWRlYmFuZCBidXMuIEl0
IHNob3VsZCBiZSBhYmxlDQo+ID4gPiB0byBiZSB1c2VkIHdpdGhvdXQgYWxsIHRoZSBmdWxsIGJs
b3duIGluZnJhIG9mIHRoZSByZXN0IG9mIHRoZSBkcml2ZXIuDQo+ID4NCj4gPiBZZXMsIEkgaGF2
ZSB0aGF0IGZlZWxpbmcgdG9vLiBIb3dldmVyIEkgYWxzbyBoYXZlIGEgZmVlbGluZyB0aGF0IGp1
c3QNCj4gPiBwb3dlcmluZyB1cCB0aGUgUEhZIGJlZm9yZSB0aGUgYnVzIHByb2JlIGlzIC4uLiBh
IGhhY2suIFRoZXJlIGFyZSBubw0KPiA+IG9idmlvdXMgc3RvcGdhcHMgZm9yIHRoZSBkcml2ZXIg
bm90IHRvIHBvd2VyIGl0IGRvd24gbGF0ZXIuDQo+IA0KPiBUaGlzIGlzIHdoeSBJIHRoaW5rIHdl
IG5lZWQgdG8gbW92ZSB0byBSdW50aW1lIFBNIHRvIG1hbmFnZSB0aGlzLiBCYXNpY2FsbHk6DQo+
IA0KPiAxLiBXaGVuIGFuIEFVWCB0cmFuc2ZlciBoYXBwZW5zLCB5b3UgZ3JhYiBhIFBNIHJ1bnRp
bWUgcmVmZXJlbmNlIHRoYXQNCj4gX3RoYXRfIHBvd2VycyB1cCB0aGUgUEhZLg0KPiANCj4gMi4g
QXQgdGhlIGVuZCBvZiB0aGUgQVVYIHRyYW5zZmVyIGZ1bmN0aW9uLCB5b3UgZG8gYSAicHV0X2F1
dG9zdXNwZW5kIi4NCj4gDQo+IFRoZW4gaXQgYmVjb21lcyBub3QgYSBoYWNrLCByaWdodD8NCj4g
DQo+IA0KDQpwbSBydW50aW1lIG9wcyBuZWVkcyB0byBiZSBpbXBsZW1lbnRlZCBmb3IgYm90aCBl
RFAgYW5kIERQLiBUaGlzIGNoYW5nZQ0KdGFrZSBnb29kIGFtb3VudCBvZiBwbGFubmluZyBhbmQg
Y29kZSBjaGFuZ2VzIGFzIGl0IGFmZmVjdHMgRFAgYWxzby4NCg0KQmVjYXVzZSB0aGlzIHBhdGNo
IHNlcmllcyBjb25zaXN0IG9mIGJhc2ljIGVEUCBjaGFuZ2VzIGZvciBTQzcyODAgYm9vdHVwLA0K
c2hhbGwgd2UgdGFrZSB0aGlzIHBtX3J1bnRpbWUgaW1wbGVtZW50YXRpb24gaW4gc3Vic2VxdWVu
dCBwYXRjaCBzZXJpZXM/DQoNCj4gPiBBIGNsZWFuZXIgZGVzaWduIG1pZ2h0IGJlIHRvIHNwbGl0
IGFsbCBob3RwbHVnIGV2ZW50IGhhbmRsaW5nIGZyb20gdGhlDQo+ID4gZHBfZGlzcGxheSwgcHJv
dmlkZSBhIGxpZ2h0d2VpZ2h0IHN0YXRlIG1hY2hpbmUgZm9yIHRoZSBlRFAgYW5kIHNlbGVjdA0K
PiA+IHdoaWNoIHN0YXRlIG1hY2hpbmUgdG8gdXNlIGRlcGVuZGluZyBvbiB0aGUgaGFyZHdhcmUg
Y29ubmVjdG9yIHR5cGUuDQo+ID4gVGhlIGRwX2Rpc3BsYXlfYmluZC91bmJpbmQgd291bGQgcHJv
YmFibHkgYWxzbyBiZSBkdXBsaWNhdGVkIGFuZA0KPiA+IHJlY2VpdmUgY29ycmVjdCBjb2RlIGZs
b3dzIGZvciBjYWxsaW5nIGRwX3BhcnNlcl9nZXRfbmV4dF9icmlkZ2UsIGV0Yy4NCj4gPiBCYXNp
Y2FsbHkgdGhhdCBtZWFucyB0aGF0IGRlcGVuZGluZyBvbiB0aGUgZGV2aWNlIGRhdGEgd2UnZCB1
c2UgZWl0aGVyDQo+ID4gZHBfZGlzcGxheV9jb21wX29wcyBvciAobmV3KSBlZHBfY29tcF9vcHMu
DQo+ID4NCj4gPiBXRFlUPw0KPiANCj4gSSBkb24ndCB0aGluayBJIGtub3cgdGhlIHN0cnVjdHVy
ZSBvZiB0aGUgTVNNIERQIGNvZGUgdG8gbWFrZSBhIGRlZmluaXRpdmUNCj4gYW5zd2VyIGhlcmUu
IEkgdGhpbmsgSSdkIGhhdmUgdG8gc2VlIGEgcGF0Y2guIEhvd2V2ZXIgSSdkIGFncmVlIGluIGdl
bmVyYWwNCj4gdGVybXMgdGhhdCB3ZSBuZWVkIHNvbWUgZGlmZmVyZW50IGZsb3dzIGZvciB0aGUg
dHdvLg0KPiA7LSkgV2UgZGVmaW5pdGVseSB3YW50IHRvIGxpbWl0IHRoZSBkaWZmZXJlbmNlcyBi
dXQgc29tZSBvZiB0aGVtIHdpbGwgYmUNCj4gdW5hdm9pZGFibGUuLi4NCj4gDQo+IA0KPiAtRG91
Zw0KDQpUaGFuayB5b3UsDQpTYW5rZWVydGgNCg==
