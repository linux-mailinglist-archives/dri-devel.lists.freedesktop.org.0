Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3BE6E1B1F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 06:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FD810E198;
	Fri, 14 Apr 2023 04:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FEB10E198
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 04:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI4XhWgsJvSggpjpLfVRUsQQPtz8s4+aflLDHMLq+erfoVF8+kO8V82lAQxVIr6B+JhexfxOwQDww2s4g/IDECg1k1L7IHIR0gl2RiWUJmHFDs4tDCifZ+GjrjtK7W0blmczYfAPgIjB3B7V24BZHhqXrPbuIv1FK8igAN9zgyGMAMv2QbVde/bCf/z4g4n2vWz5ESHmFtXNa/9kSj5cKnlejaYGbbPP11DFn/Y5ue0GXGVPzRCXtRhs7anqJef/Unyr2zySOiAY4epQtj0S2sqytc8USSIA4zjKAUYmKx4w0Y5w+1PEsgiKEGOzpWFDr8UKj4wduaC1OysftUpDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsrCh960FXiKzoXaewQO4rgjHCqIGU5/t723Mq0xH5I=;
 b=TfMEoPBe+bZsNYgXqx0UABOcZthjPICHvFVd/zJX94W/+xoWxdoHgK1Ri+BtlHEp6vJ0auFBG+9N/SkkNnYzHyqXJ486+/Zz4li9OTRcyf5XITpbj7u1I8eJJB4O7yzGm/GKTjerQytSDn8X8Z82pr/ysckrJCpzPjIjcTai+ASOsgsoCUdMVWABP+ZOZzN04Ru8hDyhHDvkcWl8J2fX3c6vQ42poy03+WWQcMoy57lJhNNdgdbwImjlaHoVVb70CaM6Ovo/mVuKmnkq99HUpY9LiVGPWRFpcz3YxQ8HMRmU1I0LcfQ9n7/JDCCMqBx36Nx1QKnUiOAiBES2SjDqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsrCh960FXiKzoXaewQO4rgjHCqIGU5/t723Mq0xH5I=;
 b=4kA5WrN3svcvsLyF+ln3uBvvSBw0nKGCT+y6hAvc4rCSXvKxcHV4yIovZniSNF+q6VgrnKkt8vJSBT8nFx4Tihu75VTVjpFDrLO5ebxzHWyEfhzyj+5BHnZplS0NxafjKqWc3hasMYGsr1uUr+jfF9FQM6ywnHsfkdJ36h4yo3I=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 04:40:06 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::2dba:b4a2:1765:9eb7]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::2dba:b4a2:1765:9eb7%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 04:40:05 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle NULL
 state pointer
Thread-Topic: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle
 NULL state pointer
Thread-Index: AQHZbgevOkIvuDaCukWSs5CyyZSFR68qOfSg
Date: Fri, 14 Apr 2023 04:40:05 +0000
Message-ID: <CO6PR12MB5489044012B2A96639470F38FC999@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230413111254.22458-1-jlayton@kernel.org>
 <87edooarpq.fsf@intel.com>
 <CADnq5_PVnYMSiKO77+cfg_V-tDKYkVJYN3qGNb1vhQO3QtXskA@mail.gmail.com>
In-Reply-To: <CADnq5_PVnYMSiKO77+cfg_V-tDKYkVJYN3qGNb1vhQO3QtXskA@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-14T04:39:26Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=a7c91c52-7b4c-42b5-87d1-a3c5cacb981c;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|SJ0PR12MB6989:EE_
x-ms-office365-filtering-correlation-id: 3bfc59bc-5cd2-46ff-2b11-08db3ca251cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6aGZTWd/Rphv7+ITaudmQTbvlPwjHMM//0XCZPNElAruXZhO8S98eRQC441vvFonp9L0D8AyC7cEa8H0wEpRZ+mNVjUNgSeNutxapg+XvGJemgmPfFClIRSHOuIfwIuJVCsyYf8FqZjxVSDhoxiLDFuQP35sO+aU6+01teJlhc5oQ+e5YnfVI9ak/DiQimPODWulBTGuQawWzKeZAGBazvN7oOyEn+15S1mvoEq7gUv27MI+5xThl/Hf7AsxuyP23edVFJmfRVXBhWNFPcDlprd7gvv1aUHQOQ04iLZBOTU9/ZBwJpkdbD5/fjygKx6d4lisLHedDBtwMHpqLAT4EwwoXf6gL9Njmd2tvS0YF/vFeOH1yAHRg10u4XRgyaXCZ86aX8uS08XuoL6sE7fNQpyUg6BU21IwuU1R1lJXQY6QyLJYPaMtwTSYEXj3dB9jvUGgH/25fIXrLeE75f75+iImSslIryK3MOasEbcIceQldmKO5Uj++4uaJGTwlMgdQ/f75A2TvkTQu+G8qibt/D56pzowxGb/H7vcYNKNKWzF2n0Rm1EhfNIJ0akIlGa9bpf1hX6seqte6M5KVdGLF8iQIEuOlFbw5igFu1ntMq0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199021)(33656002)(83380400001)(26005)(6506007)(186003)(53546011)(9686003)(5660300002)(55236004)(86362001)(966005)(7696005)(71200400001)(110136005)(316002)(478600001)(54906003)(4326008)(76116006)(66556008)(64756008)(66476007)(66946007)(66446008)(122000001)(41300700001)(8936002)(8676002)(52536014)(38070700005)(38100700002)(55016003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnA5YlExOWU2WmR2cjNrcXlzbHdKWFFkbHYyenh3eFJ3YlZxaEdVRHdTbmZO?=
 =?utf-8?B?aHhIaEJKNlIyaXdvVWR3N1hocitzbHdBdVN6OEpmc0xkejBzV1FhUmFFRnZY?=
 =?utf-8?B?VzNFZVU5ZlU4Q0xmVHh5SnZsbUtLVHBNTVdGU2FGWmZLdVN0Q00wRXVBMGNF?=
 =?utf-8?B?OW1JbHQwLzdVQ1ZPUDJZTk8zekZKY0hkdFVNdGM0enVHa0ptMzFlYTRqVW1n?=
 =?utf-8?B?QWZ1TkZtSjFDMEM3SDVoQjhocmpKYTRUd2NZSTczd0s4aURuZEhIOVRtWURo?=
 =?utf-8?B?SWdXQUovTFQ3bUJYWnhZcm9sZnVmcmNTWmlDMUFnYmFHYVJ1aDZzRjhzbzNl?=
 =?utf-8?B?ajNzYVFKclBnR1lIOFhtYWo2bjE3cUxEcUgrYWxkaGNSbVduSy9QUTRXd0ZD?=
 =?utf-8?B?ZGhOSTFkOUhSSTVjMXdHZTJBblQxTVBZNkZuNW13S09yL2ZNNmUrRHdqQ3VH?=
 =?utf-8?B?UWV4R0xIREpWSmQ1bHhYam51WmszSXM4STROTmowUXhRd2R3TnFYUUFUQTVV?=
 =?utf-8?B?ZWhCN2xhWnZkKzVsSTdidTl6U2h3QUlPZkVWNHJ2NzF1Rlhvek1SRTJBdDlV?=
 =?utf-8?B?Y01iQXhJcEFqTzhoMEJQdURlN29PT3F5cFZtSXRrZ201cnhSSjg1M0JwZEpv?=
 =?utf-8?B?N2MxSmNJdzZ0aWNvQVB2WFYwWXlVTlJXY3NxME0wWTZSdkcvbmpVdk40Zndq?=
 =?utf-8?B?WEYybFE0Qlg5TUlSYnhPaFo0NkJXdVpKangzVW1zSFlnQ1hzS2M0M2RPd05z?=
 =?utf-8?B?YkoxcG03KzcxWXNyMUliM1krUHh2emRmZ0N6Q3V0K01KVGRGeldKY2ZmcVpt?=
 =?utf-8?B?ODV6Wjl2WCtydUdZdkx5eFp0eFR3SzBvZ3p1Q0MzYkw3enFiQzJka3lRMUl4?=
 =?utf-8?B?VHBJZW92WDVQQllENnUzZEhJZis2dzdvV05kOHJxTStFZysvUmt6Z3dNSGoy?=
 =?utf-8?B?VGYwb2FZbXFJdHNjYXMzSVdpL2xaVDFxTmhLeXJhMXdTWVQ1T3JRRkYyOCt3?=
 =?utf-8?B?ZTRKM0J4SE9NZGZZaHlKLzB2UHJxUmdNQWtVL2dpeEY4T3ZsMGRYc2NhRFA5?=
 =?utf-8?B?Yjl4WDVidmhxK1hYS0pUUS9taFhqMnNDMEZleG5NSGdSVGtKSTl6ak0rVHVv?=
 =?utf-8?B?UUNsZ0RqVWNtb0VsM3RheGpHV2U3ZXMvM2d3UUo1YlJ6WWplK3lRd2dlUXRt?=
 =?utf-8?B?NDl5Q3FNN2FFUDIweDdQTDBFaUxDUm01OUkzQjJPbkFhRldQYXhDYVVodTgz?=
 =?utf-8?B?Z0NZUjhzZ0tNbDlEc0JVQkI3cTFVRmZENzRqMGdIUFhiRG9wbmR2dG1BeVBx?=
 =?utf-8?B?RXRuZ09uWU9kaENlN214L2ZWVXM1K2MrRy9iS2NBSHVDZ1Y4YnNlMlZXTElG?=
 =?utf-8?B?U0V1cGdHOEpVSUgxcTJzN1NoNkQzSU1QeGpCZHJlVjRqYTFUTWpCNThnMDZi?=
 =?utf-8?B?aGdXSlp1ZmJYVFJMaWE2Y2VyaHRqdDlTWHJ5MktMQit0MCsvcU1aU0lLa2JP?=
 =?utf-8?B?Qi9KMnNkWTYrZXJPcWpuUk0zQTdxVThabXJrQkNsdi9kVzlibkJQcUk1OHRo?=
 =?utf-8?B?MkpWdVRZSHRvbkcxS2VjRm5zSGVyUnlTZ0NBWWNqczkwNy9Cc3hUbmw4UHhs?=
 =?utf-8?B?MVJaNjd1SW8yQktNZDYyRVQ2T3pDMzhNVmZya0NQaUxKVVBzTWc4eEVabW1F?=
 =?utf-8?B?Rld6WEJTckg2OUVSNkJVVTBnZnJHQ0F0a0k0ZEFublU2MkprdFcvTzlONXZJ?=
 =?utf-8?B?Ujh0dEUwM3lJOEpQc1dGL1BnYk9CUmkyQkY1RlhzaEpScXZScVBCWjBESk5u?=
 =?utf-8?B?aTgyc25LTldpblg5UFFTYVVqK2pDMlpUWjFBTmlVZHpLa3Y0MnZOZGNua3d1?=
 =?utf-8?B?Z0hxeHZIVGZHRG4wbm9nbzFzYU4vVlBhN20xSGhycnV0L1RWRGgra1NrbVMr?=
 =?utf-8?B?ZFE5eWxrWnBUcmV3TEtXaDF4TG4vK08wTk9LczJFMzN6T2lROWI2VHBva1l2?=
 =?utf-8?B?a0pvRmJFdEljZktrU0dKamNLL1NNSjdGWW9XUTRMN0tHNC9Gd1EvcHorZlJJ?=
 =?utf-8?B?cUZOMXpqdTFtdWNBR3BKaFJpRVRjUytYZ0FOdVVSQmh6NTVhQjhERzhVWnFB?=
 =?utf-8?Q?HvyY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfc59bc-5cd2-46ff-2b11-08db3ca251cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 04:40:05.7576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7JXr4b43Z51Vw2K5Milcmf8Hg3mt06aaT1cT1E0jAP/fQjFb8v95oPaCNOXKG105d73fwzFGZjR9euA7cezgtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
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
Cc: Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KSGkgSmVmZiwNCg0KVGhhbmtzLiBJIG1pZ2h0IG5lZWQgbW9yZSBpbmZvcm1h
dGlvbiB0byB1bmRlcnN0YW5kIHdoeSB3ZSBjYW4ndCByZXRyaWV2ZQ0KdGhlIGRybSBhdG9taWMg
c3RhdGUuIEFsc28gLCAiRmFpbGVkIHRvIGNyZWF0ZSBNU1QgcGF5bG9hZCBmb3IgcG9ydCIgaW5k
aWNhdGVzDQplcnJvciB3aGlsZSBjb25maWd1cmluZyBEUENEIHBheWxvYWQgSUQgdGFibGUuIENv
dWxkIHlvdSBoZWxwIHRvIHByb3ZpZGUgbG9nDQp3aXRoIEtNUyArIEFUT01JQyArIERQIGRlYnVn
IG9uIHBsZWFzZT8gVGhhbmtzIGluIGFkdmFuY2UhDQoNClJlZ2FyZHMsDQpXYXluZQ0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTMsIDIwMjMgODo1OSBQTQ0K
PiBUbzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT47IExpbiwgV2F5
bmUNCj4gPFdheW5lLkxpbkBhbWQuY29tPg0KPiBDYzogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz47IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+Ow0KPiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBEZXVjaGVyLCBBbGV4YW5kZXINCj4gPEFsZXhhbmRlci5E
ZXVjaGVyQGFtZC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkcmktDQo+IGRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm06IG1h
a2UgZHJtX2RwX2FkZF9wYXlsb2FkX3BhcnQyIGdyYWNlZnVsbHkNCj4gaGFuZGxlIE5VTEwgc3Rh
dGUgcG9pbnRlcg0KPiANCj4gKyBXYXluZQ0KPiANCj4gT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQg
ODozMeKAr0FNIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+IHdy
b3RlOg0KPiA+DQo+ID4gT24gVGh1LCAxMyBBcHIgMjAyMywgSmVmZiBMYXl0b24gPGpsYXl0b25A
a2VybmVsLm9yZz4gd3JvdGU6DQo+ID4gPiBJJ3ZlIGJlZW4gZXhwZXJpZW5jaW5nIHNvbWUgaW50
ZXJtaXR0ZW50IGNyYXNoZXMgZG93biBpbiB0aGUgZGlzcGxheQ0KPiA+ID4gZHJpdmVyIGNvZGUu
IFRoZSBzeW1wdG9tcyBhcmUgdXN1c2FsbHkgYSBsaW5lIGxpa2UgdGhpcyBpbiBkbWVzZzoNCj4g
PiA+DQo+ID4gPiAgICAgYW1kZ3B1IDAwMDA6MzA6MDAuMDogW2RybV0gRmFpbGVkIHRvIGNyZWF0
ZSBNU1QgcGF5bG9hZCBmb3IgcG9ydA0KPiA+ID4gMDAwMDAwMDA2ZDNhMzg4NTogLTUNCj4gPiA+
DQo+ID4gPiAuLi5mb2xsb3dlZCBieSBhbiBPb3BzIGR1ZSB0byBhIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZS4NCj4gPiA+DQo+ID4gPiBUaGUgcmVhbCBidWcgaXMgcHJvYmFibHkgaW4gdGhlIGNh
bGxlciBvZiB0aGlzIGZ1bmN0aW9uLCB3aGljaCBpcw0KPiA+ID4gcGFzc2luZyBpdCBhIE5VTEwg
c3RhdGUgcG9pbnRlciwgYnV0IHRoaXMgcGF0Y2ggYXQgbGVhc3Qga2VlcHMgbXkNCj4gPiA+IG1h
Y2hpbmUgZnJvbSBvb3BzaW5nIHdoZW4gdGhpcyBvY2N1cnMuDQo+ID4NCj4gPiBNeSBmZWFyIGlz
IHRoYXQgcGFwZXJpbmcgb3ZlciB0aGlzIG1ha2VzIHRoZSByb290IGNhdXNlIGhhcmRlciB0byBm
aW5kLg0KPiA+DQo+ID4gQ2M6IEhhcnJ5LCBBbGV4DQo+ID4NCj4gPg0KPiA+IEJSLA0KPiA+IEph
bmkuDQo+ID4NCj4gPg0KPiA+ID4NCj4gPiA+IExpbms6IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0
LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MjE4NDg1NQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmVmZiBM
YXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDMgKystDQo+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4NCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMN
Cj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90b3BvbG9neS5jDQo+
ID4gPiBpbmRleCAzOGRhYjc2YWU2OWUuLjg3YWQ0MDZjNTBmOSAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90b3BvbG9neS5jDQo+ID4gPiBA
QCAtMzQwNCw3ICszNDA0LDggQEAgaW50IGRybV9kcF9hZGRfcGF5bG9hZF9wYXJ0MihzdHJ1Y3QN
Cj4gPiA+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsDQo+ID4gPg0KPiA+ID4gICAgICAg
LyogU2tpcCBmYWlsZWQgcGF5bG9hZHMgKi8NCj4gPiA+ICAgICAgIGlmIChwYXlsb2FkLT52Y19z
dGFydF9zbG90ID09IC0xKSB7DQo+ID4gPiAtICAgICAgICAgICAgIGRybV9kYmdfa21zKHN0YXRl
LT5kZXYsICJQYXJ0IDEgb2YgcGF5bG9hZCBjcmVhdGlvbiBmb3IgJXMNCj4gZmFpbGVkLCBza2lw
cGluZyBwYXJ0IDJcbiIsDQo+ID4gPiArICAgICAgICAgICAgIGRybV9kYmdfa21zKHN0YXRlID8g
c3RhdGUtPmRldiA6IE5VTEwsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICJQYXJ0
IDEgb2YgcGF5bG9hZCBjcmVhdGlvbiBmb3IgJXMgZmFpbGVkLA0KPiA+ID4gKyBza2lwcGluZyBw
YXJ0IDJcbiIsDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHBheWxvYWQtPnBvcnQt
PmNvbm5lY3Rvci0+bmFtZSk7DQo+ID4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlPOw0KPiA+
ID4gICAgICAgfQ0KPiA+DQo+ID4gLS0NCj4gPiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3Vy
Y2UgR3JhcGhpY3MgQ2VudGVyDQo=
