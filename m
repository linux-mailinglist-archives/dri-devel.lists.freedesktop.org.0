Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282AD4983F6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5E110E175;
	Mon, 24 Jan 2022 15:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2078.outbound.protection.outlook.com [40.107.102.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE8010E175
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 15:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRtx852ORZe2riY0LrqZY9TFZp4BZW6d98VtMI5ohTX9yqLGOaIaCAQKOLKFVoK0ahgAoICx1NPMF8F0tQPdQD+uOaEyWESs47FfeBu3qBHQvMGaUwEI2Y++4c9zlNHQdqfRVIqroM5KSkxcFwd76bZR14JZ/c/PM/osGLnkuqTspbGOZ2gdoAKczxYEwiKJxHmdw+H9CtxdPq0QRqOW++G4u9Rzrc324ie/4e7OrEAH9nZMcw5wD+ewu3a8qJ5u5dA000g21oiSymt9fjP98MrH/+19EFOKI3Slj4IG3DkQc6u0lqnUKyfHJEW7wrqqoyLRHQji0OFMa6xLrjwxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eb1hFcO5CTJNuWZv8E26wNhba/KW9z+pdt+EOeP/IQ0=;
 b=IkJH43vE1RsNVbTiU7cW2KnrPE9Te7Hv+C5wI0aGRugFCfTmDTQ6SgqJGhv+c5Lb/Whed/S611OMBdhkgWF2qhODf0wf3AKC3VoQMxY7oHtucsq0iLI9MbfJKf0O3Kq2krdk69jW4Hr2Mp4Vhp7FJ5VARX9iBtk6cgPZFmudPzm4XUNvR9YR4m77RUzB5fOZn1Bp7wVgmkUeKYWuiAfoX+Zr2W/8/WoVWJxCFtA1rhgyeCCZJJOnMLeDqh2wxYXBF/hm8cSZaX1JDWOiIu8RUnjcqKoIRZDsFCcemXjlqNfGW+Art8449zdGcLcEd2yivID+eEuW8prJFcISBj31gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eb1hFcO5CTJNuWZv8E26wNhba/KW9z+pdt+EOeP/IQ0=;
 b=KgnradHIvvuUEb0atlT4XigAOs+cb0qZAJS5aKsgyHoL/8io4u5hE+9uUL+/otwC+/lEVlhb+U+t9lcITCAxpnkwT2wFpdWudY7wjdbEVMOOpgyDZFmK5icgYNDZSlm4YUiVfYMk+rwCvJiEonWvrXk9LsdCAZGcpzh6A28ORLY=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MWHPR05MB3039.namprd05.prod.outlook.com (2603:10b6:300:61::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.14; Mon, 24 Jan
 2022 15:59:40 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c5b8:e9c7:1cc6:4622]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c5b8:e9c7:1cc6:4622%3]) with mapi id 15.20.4930.014; Mon, 24 Jan 2022
 15:59:40 +0000
From: Zack Rusin <zackr@vmware.com>
To: "airlied@linux.ie" <airlied@linux.ie>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "javierm@redhat.com" <javierm@redhat.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "deller@gmx.de" <deller@gmx.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH 2/5] drivers/firmware: Don't mark as busy the
 simple-framebuffer IO resource
Thread-Topic: [PATCH 2/5] drivers/firmware: Don't mark as busy the
 simple-framebuffer IO resource
Thread-Index: AQHYER8c2SrqtWWgjEC1DUC7K/B8C6xyVIqA
Date: Mon, 24 Jan 2022 15:59:40 +0000
Message-ID: <4298232b6b02a3ebfe2989de396bf13bc190ce8f.camel@vmware.com>
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-3-tzimmermann@suse.de>
In-Reply-To: <20220124123659.4692-3-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fcbeaba-3bdd-4a55-81e4-08d9df5287a1
x-ms-traffictypediagnostic: MWHPR05MB3039:EE_
x-microsoft-antispam-prvs: <MWHPR05MB3039039BD41D75C63E1FF8F0CE5E9@MWHPR05MB3039.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /0/3fQLSICMkNixWDmJjcuUaBW91VTbg/kvaAMOR2/lPv4T024wTkScUQniC47mJFJTY9JCP5gUEErAd8YgSYHwIm8jQTlvwmJm863FdYnbNoTWIqA1wNiNHZu5+9ps4gWmtLE52M8yDBRv2o3Tz1UyNXGTp7DlwTf9rCSGKakv+oNP/XPNnSbb5Ww2Kt3CjOiKwkGNdksvx9I6pE/Y+cWKQ15Hz9powWd1uaybzrJNBciSnSKWTDRMwP+0LaY+l37RL8QKE4LoYNBAL8JbxSmaxlCOu2/Hm1mXeaRJqxDSQNo0Th93RIKqwt6NJaWEdseBTJhjld3wy7Tex7xKDXKy/sLbEVY5uI7jC3MrJ8B7O1uPXci/JdApaAfqie3qb8XMOsw6DhubzDm8b/jxY4SJHeeaJ292xzY4SHjbrkl+kOuEcmpikyZEFNwwmJs4HlsvSHUY3sZqx1WGkOcd4OOf8ixPZp3x4KXOs3EhHX3YZUEKXGMSFXr2BxZCAzL8ex4kacgPkDByJUQSM9AbSFu72XxbCRGxdD0cSvv+YTjywAI1YY3AM5+5wKdeyhYsG4z0pfaJ66EiSgIkV9tJzN8rT5D41cStWgn1/eAUDvxbOzRPUFRSEjjS6JBSmPCh3W+xX8r0I8qoAHOhtXIJC2fYnemx+73wWZi7/jDj2MqsLjoawMwxK9aahlpFO4GdCta3Bk+JUO+iLcxzM66CclA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(110136005)(6486002)(76116006)(508600001)(66946007)(6512007)(66476007)(7416002)(66556008)(36756003)(8936002)(2906002)(86362001)(6506007)(316002)(64756008)(66446008)(4326008)(91956017)(38070700005)(8676002)(38100700002)(5660300002)(83380400001)(4744005)(2616005)(186003)(122000001)(26005)(71200400001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTZKZUpOYnV4TlB2bXZSL3VjcjNHU1c4ZnJKN0w2TjFaK1VvZm0yYWxQRWd0?=
 =?utf-8?B?V2xJZkhYaUZTdTdZaFdSa0FOMC8valIySEh6d0ZORjhKWGJXeHBTMDRsS2My?=
 =?utf-8?B?d21PREhiU3QzTjc2YkdHS25GWFI4MmNVVjFtUFQzT2g1cEV3OWtiU1lmVDRp?=
 =?utf-8?B?QVhxVlpMTzZxUUErK1pHRmxvdXU0ZUQyQ1ZDbXl2MU55SCtmc2FnejdHQkph?=
 =?utf-8?B?MWtRalBtZFYwQWRPZk9VSGNFQTg1UFFKcXJLVUNLNW1lTDNlQVpoNkRDNWsw?=
 =?utf-8?B?VVRmNHJiNGhjcmdKR2V6UVBZQnRJOFE5M2kwVWVQWjVPQjFiMW55WDZlNWk1?=
 =?utf-8?B?SHVVM2xDbldTcmlhVngwZSs4Tzl3eHdtOWFZNE1EN2JEOGppd1J4eGtqaXla?=
 =?utf-8?B?RDFxclF3MjRyaitIeGdEMUliNGFwejdHZVA5SUJ2clZlbUdVV0xZY1hKelo2?=
 =?utf-8?B?V1VKOEZmSk40amdrbnlOOTducUgzdWwwdFI2SXFkSnZZdnJISStxZTQreGhl?=
 =?utf-8?B?REh0blRseDU2TVhmWGpjWHhjWm5BMnRXQzR5ZGNFVXJTNXEwajAzOTM0a0oy?=
 =?utf-8?B?MGxBVnVvUW9ZWjR2eld0YTRnQmFGOWR5am5zejZ4b1RoQmhLckgzOEJNTG5G?=
 =?utf-8?B?M1NKYjZMdzU4bDNrR3hnQ3pjSWVIekdzWklnUVdUY1ZxWHpuVXRmT2VUODNV?=
 =?utf-8?B?ZDJvMndXaGpiS243amsrcTYzS3AzSzJhUUx2ZXNDZlpOSEkvQzVGcTByN2s1?=
 =?utf-8?B?RFFjSTcwNjVScHkxUysvRGdlRDM3Mjg4OEc3MXFHb21CdXVXMzRxVllEZWZ3?=
 =?utf-8?B?MGVaZUtOcjVtUExFMXl0cFlhampVRVNRNFI5Qm1ldnB0VnRNSVF2QTBsNS8v?=
 =?utf-8?B?Qkx4TlQ0aGJYUDBGWm1YOWJ4OTNxSzh0Mit4Q3V0cFB4R3ZjN25PL281V1dt?=
 =?utf-8?B?UmpkeVZUS29EcXpJbjNQNkIwSmcvTWhaRlo1MUlUMlBPdjhMTGR1VndTYnAz?=
 =?utf-8?B?Q3ByVzdmdWp0ZmE3QVUzRWh2eTVPc1gzOU9wQ2JxNXcrbkQ0TTQzMlNSbzY0?=
 =?utf-8?B?RTFWQkZ4eTdlSExHNGtFMUJZTk90RHhFcnBQYzdEOFZBdngzN1IzYW4wcEQ5?=
 =?utf-8?B?NnZSbEpKNGlySmNNYjdvRXhXMG9aYkcwelV3WjJZWGVvMHRBMUFYM1kraE9W?=
 =?utf-8?B?ZTAvT0grM01CWHNkN01Day9URnc4amkydDY0Q2lvRVljY05UUFdRQUw1NnBk?=
 =?utf-8?B?STJBTGUvL0IyUmJvSkxtRUlOVWVCSVRTQjFidjNnQU5XblZjRWJ4UGI2OExQ?=
 =?utf-8?B?SUVFVkE5MVVtU01JVVBNaExVUHI4ZGJWV09tL3dudjVqRGkwZmJkL1h0K2Y4?=
 =?utf-8?B?eUtTeEdiUytQbkh6MDVLejZNVTFZWTAyM2RTeGhqa0VseW44L3ZlWFJ2TzJM?=
 =?utf-8?B?ZWxjRk9QREFUaFhJd2QvVEIrbTgyZTVyUVJwWk9KWXFSd1R1aVNRSkhQaDRQ?=
 =?utf-8?B?R1ZwUFhiOWI1UjBoaFhja2RySmlJaTZOV3FrM0N2eUEzanp4bjdHandHbHVu?=
 =?utf-8?B?WjgwWi9XNzlWNHFFVkNPeENWaWRaS3p0VnE5RVYrRHRGRDVrZTNDZUlwSmcx?=
 =?utf-8?B?YkY5cDMzZi9RZ2ZadFhNcmV2NWFxVGpFK3RqSElrMlViTVFZRmZKd2Z3SUkx?=
 =?utf-8?B?UVFpNFVOaVQwUG1ETlcwKzNFcGVTU3h5aHRPWDJBSlVZZncyYVBPdlZwdHNo?=
 =?utf-8?B?L0U4djlWcGZmOUpSNWJrSUtMOXNORFJ6eWt5Q05vSUJHTzdYZUt2MklPdkNH?=
 =?utf-8?B?eEVKK0tSYTV0RnhrVDlPMTNVdDFOalEzellGZGpwTWgyeFY0a3BlVGJvb2lu?=
 =?utf-8?B?QW8vUkwrbUgxRlZWdmw5cnVVL1Y2aXNTWjRqQjJxVkRVNmtzVjNBNmdhRVlu?=
 =?utf-8?B?YXhVWFgwSUp3d3FoenZ0UkQ2cUY0VE1Tb2dtcTNDU2NGWVF0NXlVTndBa1lv?=
 =?utf-8?B?a3J6ejRxUkxFTzdJNjN3RTNWU1hNcWJIRjNRVmU4UEZuVVRsLzMzSEFUUkd5?=
 =?utf-8?B?NzRpdVlnTTN4djBrVDkzQjdOd1R5VG02Z0YxSTRvc2NrVythK2ZxYXpkaXRK?=
 =?utf-8?B?bE1qSGRpNGQzL1NRT0lxc1BRVGJiYTAyR2o1T3hGT3N1NjhFNVp5SzRtVTAr?=
 =?utf-8?Q?szhj2hhX7Pgq0a0/77Blbps=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCFD72E47B72B54EB2BEF5227D0633C6@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcbeaba-3bdd-4a55-81e4-08d9df5287a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 15:59:40.4363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TWQ9BeyTc3JXrSF9rKOh7pRt40GvFTZ5y13E/DLuFGXzPZB3yBgJGyJNsW9NhuM6Z9D9BHlRVt/LL7681MF8og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB3039
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAxLTI0IGF0IDEzOjM2ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gRnJvbTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+
DQo+IA0KPiBUaGUgc3lzZmJfY3JlYXRlX3NpbXBsZWZiKCkgZnVuY3Rpb24gcmVxdWVzdHMgYSBJ
TyBtZW1vcnkgcmVzb3VyY2UgZm9yDQo+IHRoZQ0KPiBzaW1wbGUtZnJhbWVidWZmZXIgcGxhdGZv
cm0gZGV2aWNlLCBidXQgaXQgYWxzbyBtYXJrcyBpdCBhcyBidXN5IHdoaWNoDQo+IGNhbg0KPiBs
ZWFkIHRvIGRyaXZlcnMgcmVxdWVzdGluZyB0aGUgc2FtZSBtZW1vcnkgcmVzb3VyY2UgdG8gZmFp
bC4NCj4gDQo+IExldCdzIGRyb3AgdGhlIElPUkVTT1VSQ0VfQlVTWSBmbGFnIGFuZCBsZXQgZHJp
dmVycyB0byByZXF1ZXN0IGl0IGFzDQo+IGJ1c3kNCj4gaW5zdGVhZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KDQpS
ZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCg==
