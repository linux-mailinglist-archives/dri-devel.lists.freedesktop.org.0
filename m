Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62034F7F50
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 14:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E723C10E147;
	Thu,  7 Apr 2022 12:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCFE10E147;
 Thu,  7 Apr 2022 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649335254; x=1649940054;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mv+4Fa7+1Nlk9usasmDsW/XkTub0KVYb+OMh4mHZUy4=;
 b=WM8pUhgHD8CjAyR/WcIDekRhHLyaUApEYu0HieRaCvm9Z5rbBa3u2hwh
 V56B7eN6gzQ8wsY56TI5kmxoh8o2xBEDjC2DSM8h4KZE7gjgdVWbpf5ak
 6aeL7LgzW+y73lMurSvl+9SRElrAxI2hWufW4+2ZZH8R3wyyPXmN7P9lC c=;
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 12:40:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxXbg8uUASuTtVfF15X8nzYsBTQHDQ1sXvUjctSAH4YsEwdX1S9VFobSlBXYNWvoLs95pZWkzQEJnMYwnB7CFeBHGQjtWooGpU+/d15CYEW8VWuvc4mpIKpYEPommWcxGl7EOE9GCtRDDwI4PqgIYib9VKO0IFyglvudM1cpl4KFoBeq2wYL9FUe38GqH9QKRXvRZh1WBj4i887lhReLU3g0jTmNdKTaufktXYh03isYdrA0Fm/VVsNBm4mCi+tdrxr7bRrZwmGF5zXeAyP7Cg8/sRcRgsR6Q1ExKpQ7tk5heXwaC/uwwFU08wAwINC13l/hjL4KWI+7N5tau+iNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv+4Fa7+1Nlk9usasmDsW/XkTub0KVYb+OMh4mHZUy4=;
 b=MucB3k0LpcO0B44P0hkb2dXzm+XzR77w9GPzua5XUr83nOeDN+WhgQYVCVt3E0pHebtxTt/7mBKS6+CHCWYmwWjC9VaC3PWswLE1z7qO9LiGrDtWQMyvaovQxslOv3gFQtLFytprPsuBHWa2fT6mlRIyhSaXYeRfv1fg17n4GtDHdRNiIu/FR022RtiKZapdaJ7PZBYOASDAx2E5ttVEPl338TyAJdXTONbS+DEA3c7Br1zy22foxmua6uJxEKUkeFAhgD+rgyXE3ATYjqK80IutFag4N8Y9cKjtLecEVG8kHFd1pSi+py2PQc63DG6qD8iv0VsBZQv/Uj9m3UYDZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by MN2PR02MB6320.namprd02.prod.outlook.com (2603:10b6:208:1ba::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 12:40:41 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%7]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 12:40:41 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Sankeerth
 Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 6/8] drm/msm/dp: remove unnecessary delay during boot
Thread-Topic: [PATCH v6 6/8] drm/msm/dp: remove unnecessary delay during boot
Thread-Index: AQHYRE/OalQb15tWkU6TQa4mr1tu5azaJAGAgAWp7UCAAHr8gIAEJ9QA
Date: Thu, 7 Apr 2022 12:40:41 +0000
Message-ID: <MW4PR02MB7186384CBE46A8DF338E49CFE1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=UX9Mg71EKvgNp_wNG5q7_ugBgVPbcFWFX5XBG+cQCi8Q@mail.gmail.com>
 <MW4PR02MB718631182DC72076DC794C1DE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJpqOzn4xh1N9GhEbH6YY5uHPdeqhiDnSNMM+ZQ3GdaWFrA@mail.gmail.com>
In-Reply-To: <CAA8EJpqOzn4xh1N9GhEbH6YY5uHPdeqhiDnSNMM+ZQ3GdaWFrA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5208e493-b1dd-4a35-b07c-08da1893d3c7
x-ms-traffictypediagnostic: MN2PR02MB6320:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR02MB63201A24115659DCDA671D909DE69@MN2PR02MB6320.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BakVUUfH+8EiRQuZ2XOHeNutIiXsA40DPKLorA2Qa5elV9V84sd5D8T5i13j2ClDleCvCr8rackRbuQWq+u4L+jwRHb8ty77ZQjB+Lk6yiG6mWmlP2bW3J/dBqSA/hjGZPEZKh9XYVkk0zOOf/YIavK71WYE9y9kZpD9uLfKxDAyW/PrVyAnPUTx324sL5y1ugrem8XLy5tfJ4ArVlPIUi1s92+uRayg7Xd5tF/WLzvxlrDewmDHEK9v1Ie1QX8AlN1kBGZFKA47MOWIakrQXiDy3OevAHCr42SySwYcr6Uv2HUtPNma0jSkG90n0Dm6hxDLbHaGnhLEoEi8aT+GIqhB2kF1lsCGHhO/2AYHt+7fEe6uZrSPciZnT5Uctaiwnszk7IipTX7xFpT1h1Ck7HLYEmrPwMEOxqqMni8Jq+CUjGgIoJgN5NZYLP8jWRHajthWqAwlv7+zMCJz+MZfo9O8+xr4RIAJuYeORPSBVEBxIbxY24xHsjum3GMmviubciGdjC8TQZVKsVHd2e/yjZG+1bpbUKALwjXOTkjx0Pepmexxhx6Yjd5dkLYB+fmWI6hsygoJx29KiPulYGl7KioiK63yqC7hOYjw03I90zLToqGbkI1VRofaqFDqw/RdCQTMwhRLGzpBrVgF7vL59EtLuJfVwoIDqJ+XVe7GkPB0htxVNr2aBnSaMO8X4mzxx/L6H/3rMs9UsUb0xCygshRlzayK9D8aSY7lNhYHnaPyHFL4XWtI52LUPzrqwlTVq/sZGd7MXz41lx904v+QtmLNGpy6RgxkuPGCxJpkGC8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(33656002)(76116006)(64756008)(66476007)(66446008)(4326008)(66946007)(8676002)(186003)(53546011)(66556008)(9686003)(7696005)(6506007)(316002)(26005)(508600001)(38100700002)(2906002)(52536014)(5660300002)(107886003)(83380400001)(122000001)(8936002)(55016003)(71200400001)(7416002)(38070700005)(966005)(110136005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkI1V3FUYkVyU0FDdDIvN0NrUVA0aDVwZGNiSWNtcXF3TXE3RGc4TGlGM3J2?=
 =?utf-8?B?U0NDR1pDVmJFV2lwS1p5TGZpMUVYMSttb3RRWHZ2SC9NMnMwd2xSZHU0M0o3?=
 =?utf-8?B?cTJRZitRN1JIM1ZheHk1UGl2dk53QWdnZXJOY3F6ODRMUkdLN1JpVW5BRDhh?=
 =?utf-8?B?YVBBeTlqYVNUcVdBa0RSV29kRlZ5NjV0b0V6N3JPa0ZVeG5TUzhxTTRCektj?=
 =?utf-8?B?czM5SDk4SWR3QmNCUFBaQWE0UjRDenZzSzVwT01YRVJ6NUhIbk1WSGVLWUpR?=
 =?utf-8?B?alRERDJBZEwvSFk2dVhkN1krS2J4QS9WeE5IOExQNWdDbnMzRlpBc25iTWZW?=
 =?utf-8?B?QWg5RWI3L0h2SWg3U3hJTnBDT3p3ZnNHY2g2QjkwMHZreXcvdFltUUoxNFl0?=
 =?utf-8?B?eU9QdEl5NDV6NmYrNEx0VVMxQlk4YkxjQ0RvTDZBNHdGUm9zbTVtaDhBTXZp?=
 =?utf-8?B?VmdPaXdPeXU0aDRJTk9ZcWhjaFRqTHlpNmo2REJqRnFsNmYxRmVZNVhwTVJQ?=
 =?utf-8?B?SEVUcVovdmQ4bGV2TTFzM1M5SktiTzQ2Nk9QaFkvZnRITlhJVm1MK280WG1w?=
 =?utf-8?B?MkZsaWkzLzR2K2xpTE1NN2lGVG00Tmx6MDcvMk1vRlRkSUNBV3hjSXN5d1VM?=
 =?utf-8?B?ckNCeFZSVWNZUWhKb0lQRWJUQWxnVkk1RlVFYktUS2trckNjMVhTWEJjQnM0?=
 =?utf-8?B?aTlOTkFZWWdFNnMyVWNnOTd4TGNPVno5WlNROUZZVDl5bWdGamtSRTRyWFdp?=
 =?utf-8?B?NHBLaDNLVUJWL3JQM0NhUjZ6bWhYY05LbFd5ay9pSndiOUVpbFoyUHZXN1Vi?=
 =?utf-8?B?MUx3elJSM1U3dUlrY0lVTWZLcUpqd0hjeE1BTVRjNW8xOW1Ja3I1YlRZcHJ2?=
 =?utf-8?B?M2gxL21EZkUrdDd4SlNoK04wZEtBUmlVTko2R0trNHpaQnZNaFlpUEZKVUhz?=
 =?utf-8?B?NzVwMncxU1JXc3NNaGphQitXT0VzUXlKV0Zra0FteDJYemUzb0Z2cHR4bHM4?=
 =?utf-8?B?a2N1UTVSTCtpTzN1bW5MV3ZjbDdsQno4OHBNdXhRL1FWMlVjUitiZEFvSVFG?=
 =?utf-8?B?emxGOVZ4aUpoaUNLL2t0UmJ0aE5reWloaHZBTWcxbDFHMG9ZRlBPaG42eEQ4?=
 =?utf-8?B?Wm9ZQTlBTHUyWHAzb2xMWE1RWVJuWDBmcUltLys5WlV2a3YybEhZZ21JOXJo?=
 =?utf-8?B?OXh5RkJSc1hIS2JzeEpFN3ZnNzlFMWVycWRRUG4wV25CUXc3d3Y2cE5HVytE?=
 =?utf-8?B?em1GcWlXVTNaYlI1TUZLMFc1cUNnYS9XL0ZpU1YxVjZpVEFtZUNSdktTcWh6?=
 =?utf-8?B?N3oveFpsendnVEZvYjJMbUljSHJPMDJyNktiVDBEWUE0ZEN5dlA4NzArTHVl?=
 =?utf-8?B?S0o1WVQ4NEYwTjFxQmh5WHlPZVVtR25lNlJLaUJ5ZTdyYk8ycmtneWNpa1hV?=
 =?utf-8?B?L1dtTFoyVTFNVkZZZTlQZjhoNkNnckY3OEJLcEhJUDYrTG04TUhBU3ZjZFNv?=
 =?utf-8?B?cHVJeE1haUFhZ1psbDVrRWpLK0xwMk1pSmJnRzRJRnlGLzRGSC9HWXVLWDBY?=
 =?utf-8?B?MjhsWWZkb0dFVFZpbTZHS3FpRlhEbVJsMkdwaWI4RmY0U1J5ZW1wSWtySnFv?=
 =?utf-8?B?dWZFazZ3cHNoMXJNUFN4NkcrWlBGaWdkT3llUlZndllMVFhxSldmbk1pbmRG?=
 =?utf-8?B?VTJiNzErdkV3NE9jcXg4Nld1TEpSRVFxVUlwUVhsS0RyeCtJbDdqbHZwYjlh?=
 =?utf-8?B?SFZ6V0FaVDRzcVV0SFcySXg3Z2lMY0pQTEtSZGdGR3BzWUNHRHpFTFU3Qncy?=
 =?utf-8?B?V0JaV3FaUG9tUzBSWG1ibUVPRHdSRnhZcTY2dDFNSld3Mlp4K05OVERBY2ho?=
 =?utf-8?B?WFViNjlGaDh5VUhvK04xNFBSYXlqdVRtS05XcVdQK3R6VkMvblBlSFlkYzlZ?=
 =?utf-8?B?T3Jwbys3eXU5aDFuZ2kzYXh3RXFKOE5PdVVZcW91RHpSdGlidXc3VlRUN3pz?=
 =?utf-8?B?aFQ4U1Z3TlR2bjRrMjFoV2dBVWVMeHI2MEU3ZlZEbDVDVjZFVFY4V2NKMHlz?=
 =?utf-8?B?QVFsM3ZlK3huYmVpT2R6OGhwb3loK2laOWI5aTFtZW5GamVGZ0swakRKbThq?=
 =?utf-8?B?VUZhM2FtcnJsZWljeUZrejR1SHg4YlZTMVJHeGhtZkdITERGWjJpTFdSeDV6?=
 =?utf-8?B?YjcxcmFYL3RxTVNRdXE5dWE5MmdHVWEvaENqVm5HTTZ4WnZsS0hONkpRdW9G?=
 =?utf-8?B?UTRCbko4WnMrWVV3THNQN1N2NEF6YWpJZmFyWW5MdUR1NEN4VDI1QkdXTnhV?=
 =?utf-8?B?UHA3NFAvYUJaOHoraFQ1eVRFcCt0SHAwVXJoSHIydUtmZDVuN2l6UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5208e493-b1dd-4a35-b07c-08da1893d3c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 12:40:41.7904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uqEYKelSpOUuCRh8+KHTb88N6tq6VWU2qjmocKMPk81KAm7W7UkfC8ARwJS03NcVYciaYKHoCsdwt8UZQYe8s0RWFS+pUwKhLVRPO69wN1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6320
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
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "Abhinav
 Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQo+ID4gPiBPbiBXZWQsIE1hciAzMCwgMjAyMiBhdCA5OjA0IEFNIFNhbmtl
ZXJ0aCBCaWxsYWthbnRpDQo+ID4gPiA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4gd3JvdGU6
DQo+ID4gPiA+DQo+ID4gPiA+IFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgZGVsYXkgaW4gZXhlY3V0
aW5nIHRoZSBFVl9IUERfSU5JVF9TRVRVUA0KPiA+ID4gZXZlbnQuDQo+ID4gPg0KPiA+ID4gVGVs
bCBtZSBtb3JlIGFuZCBwdXQgaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlISBXaHkgZGlkIGl0IHVz
ZWQgdG8gYmUNCj4gPiA+IG5lY2Vzc2FyeSBhbmQgd2h5IGlzIGl0IG5vIGxvbmdlciBuZWNlc3Nh
cnk/IElucXVpcmluZyBtaW5kcyB3YW50IHRvDQo+IGtub3cuDQo+ID4gPg0KPiA+DQo+ID4gT2th
eS4gSSB3aWxsIGFkZCBwcm9wZXIgZGVzY3JpcHRpb24uIFRoZSBEUCBwaHkgaXMgc2hhcmVkIHdp
dGggdXNiIGFuZA0KPiA+IGV4ZWN1dGluZyB0aGUgZHAgcGh5X2luaXQgYmVmb3JlIHRoZSB1c2Ig
cGh5X2luaXQgd2FzIGNhdXNpbmcgdXNiIGRldmljZXMNCj4gdG8gbm90IGZ1bmN0aW9uLg0KPiAN
Cj4gSSBhbHdheXMgd29uZGVyZWQsIGhvdyBkb2VzIHRoaXMgd29yayBmb3IgdGhlIDQtbGFuZSBE
UCBkb25nbGVzLCB3aGVyZQ0KPiB0aGVyZSBpcyBubyBVU0IgbW9kZS9sYW5lcz8NCj4gDQoNCkZv
ciA0IGxhbmUgRFAsIHRoZSBEUCBkcml2ZXIgb3ZlcnJpZGVzIHRoZSBwaHkgcHJvZ3JhbW1pbmcu
IEZvciAyIGxhbmVzDQpEUCwgdGhlIHVzYiBwaHkgcHJvZ3JhbW1pbmcgaXMgbGV2ZXJhZ2VkLg0K
DQpJIGJlbGlldmUgdGhlIHVzYiBjb250cm9sbGVyIG5lZWRzIHRvIGVuYWJsZSBib3RoIHVzYjMg
KHFtcCBwaHkpIGFuZCB1c2IyDQooaHMgcGh5KSBiZWZvcmUgRFAgcGh5X2luaXQuIElmIG9uZSBv
ZiB0aGUgdXNiIHBoeSBpbml0IGZhaWxzLCB0aGUgdXNiIGNvbnRyb2xsZXINCndpbGwgbm90IGVu
dW1lcmF0ZSBhbmQgd2lsbCBjYXVzZSB1c2IyIGRldmljZXMgKGxpa2Uga2V5Ym9hcmQgb3IgbW91
c2UpIHRvDQpub3Qgd29yay4gVGhlIHVzYiBjb250cm9sbGVyIHByb2JlIHdhcyBmYWlsaW5nIGJl
Y2F1c2UgRFAgd2FzIHR1cm5pbmcgb24NCih2b3RpbmcpIGEgY2xvY2sgd2hpY2ggd2FzIHN1cHBv
c2VkIHRvIGJlIGluaXRpYWxpemVkIGJ5IHRoZSB1c2IgZHJpdmVyLg0KDQpXZSBkaWQgbm90IHNl
ZSBhbnkgaXNzdWUgd2l0aCBEUCBiZWNhdXNlIHRoZSBwcm9ncmFtbWluZyBhbnl3YXkgZ2V0cw0K
b3ZlcndyaXR0ZW4gYnV0IGR1ZSB0byB1c2IgY29udHJvbGxlciBmYWlsdXJlLCB1c2IgZGV2aWNl
cyBkaWQgbm90IHdvcmsuDQoNCj4gPiBFYXJsaWVyLCBlbmFibGluZyBwaHlfaW5pdCB3YXMgZG9u
ZSB3aGVuIHRoZSBFVl9IUERfSU5JVF9TRVRVUCBldmVudA0KPiB3YXMgZXhlY3V0ZWQuDQo+ID4g
U28sIHdlIGhhZCBzY2hlZHVsZWQgaXQgdG8gZXhlY3V0ZSBhZnRlciAxMCBzZWNvbmQgdG8gbGV0
IHRoZSB1c2IgZHJpdmVyDQo+IGNvbXBsZXRlIHRoZSBwaHlfaW5pdCBmaXJzdC4NCj4gPg0KPiA+
IEt1b2dlZSBtYWRlIHRoZSBiZWxvdyBjaGFuZ2UgdG8gbW92ZSB0aGUgRFAgcGh5X2luaXQgdG8g
ZXhlY3V0ZSBhZnRlcg0KPiA+IHRoZSBEUCBpcyBjb25uZWN0ZWQNCj4gPiBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYXJtLW1zbS9wYXRjaC8xNjQyNTMxNjQ4LQ0K
PiA4NA0KPiA+IDQ4LTItZ2l0LXNlbmQtZW1haWwtcXVpY19raHNpZWhAcXVpY2luYy5jb20vDQo+
ID4NCj4gPiBTbywgdGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhlIERQIGRyaXZlciB0byB3YWl0IDEw
IHNlY29uZHMgZm9yIHRoZSBwaHkNCj4gaW5pdGlhbGl6YXRpb24gYW55bW9yZS4NCj4gPg0KPiA+
IGVEUCBQSFkgaXMgbm90IHNoYXJlZCB3aXRoIHVzYi4gU28sIGl0IGNhbiBiZSBwcm9ncmFtbWVk
IGFueXRpbWUsIGhlbmNlDQo+IG5vdCBuZWVkaW5nIGFueSBkZWxheS4NCj4gDQo+IA0KPiANCj4g
LS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg==
