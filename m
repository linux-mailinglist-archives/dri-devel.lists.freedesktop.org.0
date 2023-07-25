Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7DD76110F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 12:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124F310E0B1;
	Tue, 25 Jul 2023 10:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789F710E092;
 Tue, 25 Jul 2023 10:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9pdrumiZHQQMnQNLv1gl64bSU8TzAC1I73680YrLI85Fly4XDGiGSacjhk1eWt7+DdE5EhemKM5wXpKM7C8gV3koSTUdFo4SZ8HHu/gAMI+5bblWkZ5vD2BzgztYbB7raO+g2eEvYIFn6EvFmcqXRlVy4lVHteyNWqmHZ464pVpA7Uio1ZhpCPpFJrBBq69NF/sYsgmyQQyH6OQgei1FoqHeW/nCZWmIErPlJgIlixbcrSOCsMWpX+1U0i87RuvrFHPdrLIw0sVEL7xiIU4y18Z561EOmagg4/6O5QD3FBs1CrRbvqonL/+nsDeLtwbHKb2rj8t95Edb2AAz+ltZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCmRvgvIJH+kn0KMY9tCmra963evi2vVYZB/qrEBShM=;
 b=aM9aiTUdRUT/a8/ouWnUw6cv+/o6iclyK/ZPyRZwyA3s4XmWeWQb8kIp32vwgYD50ClJ6Ag80k0QEIdLVqYkNWSt2a19/prbAPIEDWQpV5P6yBk5QXK0DM4nOsYV0n4mwQEC8R1oVx2v0swDdQnn58a34sgqugpicwGAqLwaauICnbz4chba2XrLrQuHi7Adfgf+4qmLwKTR32AIbJnVU4GxL6l9jzKXFFUnfM84nP26Jc+grrtSY6He4pMzfbeu+O4BPCdPd4rPEv9kS7E45HQImhxoPzaCYwuN9b6NS/3aWjT3QuMQag/XnPYCqSHVEkS25XJe20Gc/qod8jgAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCmRvgvIJH+kn0KMY9tCmra963evi2vVYZB/qrEBShM=;
 b=33CK8TrlO7dxmMwYw7XEyt+LRmhvqmTDdX0E0G/YoXrrH6YM0MDoTWD7v2lCHPHGdhS/A/PHcgEAO46iaDQansmq0QVioclkJGzebQjY6+or7qSfg1G6UCEwQJqLEY4CHJut8A+IYLYHxv/gU2yqbaODk1Und3dPvPj3tp7+n5o=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Tue, 25 Jul 2023 10:38:22 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 10:38:22 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>, Andrew Lunn
 <andrew@lunn.ch>
Subject: RE: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
Thread-Topic: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
Thread-Index: AQHZuh/Adomejh8HzEmC1hUCKrjgYa/IrJMAgABIA4CAAV6KwA==
Date: Tue, 25 Jul 2023 10:38:22 +0000
Message-ID: <DM6PR12MB26196A993B3BA93392AA0FEDE403A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230719090020.2716892-1-evan.quan@amd.com>
 <20230719090020.2716892-5-evan.quan@amd.com>
 <9b1f45f9-02a3-4c03-b9d5-cc3b9ab3a058@lunn.ch>
 <7d059aed-fac0-cdcd-63d5-58185bb345db@amd.com>
In-Reply-To: <7d059aed-fac0-cdcd-63d5-58185bb345db@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=50bc59d1-04ed-49c2-9700-bbdd77121999;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-25T10:35:10Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|DS7PR12MB6093:EE_
x-ms-office365-filtering-correlation-id: d5ab774c-b2ac-42e6-0766-08db8cfb44fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iTDWDsKqjLXP1VCAnNdE9iMH+GwwMsvzIqgRoQz03wuPy0YPC5iNGIvlfOLocw/pbTxGdYmWrPXoxki08z+WDRiOJlpbwL1UzKB6GTJR4uOCVj66APyypbgCAtev1XSRhDyonY6042o0yuW+7r9aTueg+EmB4vLdLcuV5sNF6JYqr85soZo3ycftXp1922HfiCq3LPJIHC0y+EHboqUN/4jB05q7J7aGLsd4JFymkS0GsYCKmtviKH6xzfQwSqStseixTNQlpitoUGMzp2keb7QqfOmKxk30VkzjRL5NdjzO2gsFNr1a/YvUP3sXWZs0iVmMRghPmSIPDYJsf+4lhCV3REBUTI95mWrcraeqSMQrAfh3aBPoCH8/rIE2HOGKFCNlmQVcgEgdeB9t8klApeGL8dR5l2iMi+f8xiXGsYXPFtpYTH5MCZw/fap464OF5PttWKT/3ruxzPBV50XuAwx437ybWQKIqVG6C1jpOiPQiHeWKVKWmqK890GY+/U7GZN+k/jVs9BzoDmVKw3zIcOsVwV/+keOeZHvhlHY9MMnegcLLV5V6mCqz1KNL9hxfGzbbHHzoHUEww4USaeM/Fc+UFQJIOGl0pP7YTwHZY60hnbLCHWfz9Prn3uGx6p3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199021)(55016003)(122000001)(38100700002)(83380400001)(53546011)(186003)(33656002)(26005)(52536014)(7416002)(8676002)(5660300002)(41300700001)(8936002)(2906002)(6506007)(7696005)(66556008)(66446008)(71200400001)(38070700005)(64756008)(76116006)(66946007)(66476007)(4326008)(478600001)(86362001)(110136005)(54906003)(316002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXVTZEVaTlRBMktoMEd6OUxRd3o3T0oyamZEbXg5NW9wVEt2SWZ2ejRsTFNG?=
 =?utf-8?B?S28yWWZTaUVkMkVLTDlHZmtkbjhxMTIySDE4RjlTYjZxdzQ5ME82Z1IydElM?=
 =?utf-8?B?c0o4bms5ckJLQ3hLSkhVV21MKzY1S2IzMGJJNDBBbGJEYzBsNEdDQWdhWVRk?=
 =?utf-8?B?NmFScTY3SGI3VndCTXVJT0pJMXJlWVlPVStYUUVDemJVeVZhaVR5cDZJeUNr?=
 =?utf-8?B?Qnc3YlZGaDdoL1RGRTNuTEprN20zVUVVMVNPa1djTjQ3bHhDSnlNN3AzcG15?=
 =?utf-8?B?d2ZtVldxSzBuSWwxSUtMQjVUa0wrMlBvYmxyRE5mcmxWcU1EOGV0N05ZTHdq?=
 =?utf-8?B?MS9mOVVkNmZTdTRYcFFvdURqWTNWNWRCRVNxTW9qT1U5T0dvcHYxbnU1cmlD?=
 =?utf-8?B?cVE4cTJhRDczYkh5djZhUGdtajY5TGJkSysrY25RcGkzUGhKd0V5d3BYYVdU?=
 =?utf-8?B?SFpWUmhtYUgwa21RbG1aQ21IT2tqSE9uaWRNQVZkWlg3ZkhIc2VudXhLWmNG?=
 =?utf-8?B?V3AxS2o3WjRFMlZFNC90YXF2OHp5VVhHVjFYaDhLOWxGak1RTmVtTUE0KzRI?=
 =?utf-8?B?eTVyUk5aeGZlNklqT2VBYUlKWFQ5RTdLZUlaL0hneG15dFQ4WklmWlFETGxK?=
 =?utf-8?B?ZkViU21SdVpCMW5tK01Sc1Z4Wjl4RGJYOVl1SUdPVGVFTS91Z3EyNGdFRUdG?=
 =?utf-8?B?cStpc3h4RHQxSmMrb0hFcElzMEluK055ZFF5cVBUVVViNGpCQWV6UTg3SkNK?=
 =?utf-8?B?MXhTcHU0MjNFRlV1cnlsdUNjR1d2UVZNNkM5cVNIeVdzNEZtdmQ4dERMbGFa?=
 =?utf-8?B?azlKRXlsMVZ3cUIyNGpLYXdmZHFBakh6SG1NYVRQOW1tOC9kcjhNRXIrTHRT?=
 =?utf-8?B?ZUxTaGxMV0tNb2lwbTdjcnkrTlFQSlU3VDRtYWVlVnBkampZekpLdW1OeXlT?=
 =?utf-8?B?OEl1MHBTSVBIN04vd1JUUFBnUHdoRHNWMEc0a296SkFrcHN6Ulc3anBBWW4x?=
 =?utf-8?B?cGh5eExtTDlMREdBVGZrTmhsQWxzdlBRQXFRc1ZWMERpM3RHY2hrNWdiaDY1?=
 =?utf-8?B?SUpJbTQ1MXJGMDMrSVFlTnN4ejhqYnNNa3JGR0Q1UGJNNGlkaTRCQjB6VUY2?=
 =?utf-8?B?U1c0Z0E5U3lOQzRaSC8xYmtUS2dEN1U3MnVKMVBjcjdVdk5DUUR1VHNGVFFV?=
 =?utf-8?B?MWlsY2tPTWF3MGRvbk5XMUNkMmZuM3JvSFo1TCt2cDRUUEt2cFBqRGdUekpS?=
 =?utf-8?B?REs4dnJJTkVHNUpNSVpEZm1IQzI5dTEzS29pZVdXaDZ3eFBlVFZQbVRvaGpD?=
 =?utf-8?B?anVyeUpvSjFnM2Vyd2UxNHgrZDZvMitnVlVxdUYrTTRBc1JMTUVZRGtqMCty?=
 =?utf-8?B?L2RMSEcyMzRqWFhJcmRadCtBL0xLMmcwMUkvSzlvK0JBbEUzSGxPNGcrSkVF?=
 =?utf-8?B?Y3pyRTVVcFl2eThYVGE2T0hFSkpYOXBNNDJrYk0xcFphWWh3OVMwQlVzRUcy?=
 =?utf-8?B?ajdWTnd6Q0ZTd2xHMjQ3cmZvakVaV0E4dXBpeUxObWVmZGNWNXFqMWpXSGxS?=
 =?utf-8?B?aGpPcmNvcjBFd3ZGYktOTUw5ejJqVG1JVUJycmxQc04xc1dXNUl2NWROcEww?=
 =?utf-8?B?RkNnZnBSV1IvbXVIUnVCK2J1bXN3QmZBSHZnblV6Nks4RUhzbVp1a3krVGJN?=
 =?utf-8?B?Snc4VmlzM013NWszMG11Y1lnUnZsbVg1YzBWanlESmxPVVRpdElaaGVjZlNC?=
 =?utf-8?B?THlwY1I3eFZEY0pjOGlhMFg1SlAxQUpGWENqN09hSkJydFB4T1psM2xrWlU2?=
 =?utf-8?B?a2Eyd1RyZnpCektZbndLY3IxR2kzS1h5Ymk0aGsxNnArK2R6OWVvVy9mYkNz?=
 =?utf-8?B?RlRhbzRodFdwNjcyTlNRak4vcy8zTmRNeExLK3Q5WVNzZlNPd0x0dWNmRWpF?=
 =?utf-8?B?RGFVbGYyblhhUGQ2ZEVBa0trRUd2UXY0cGJ5TEhKTGlMa2RyS1ZqbFk4Tlcr?=
 =?utf-8?B?RC9QUlNXdTJJTzgwYmxQTHR2dXlCaFFId3NNWEE0UHZmdCtTYWcwOGRKdXhl?=
 =?utf-8?B?MTZXSWU4dlRmRFRTSy9DNHV5akNxWExGS0U0Rm5nRURFUDVhME9tbHVVNlJI?=
 =?utf-8?Q?uqtc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ab774c-b2ac-42e6-0766-08db8cfb44fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 10:38:22.4560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXuB4DKJQe81wMbUcx+4zPfl3C4b63aXTEsmaJplJscVC+x+XLNDHvFD/OhBUu9b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093
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
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxsb0Bh
bWQuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMjQsIDIwMjMgOTo0MSBQTQ0KPiBUbzogQW5k
cmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+
DQo+IENjOiByYWZhZWxAa2VybmVsLm9yZzsgbGVuYkBrZXJuZWwub3JnOyBEZXVjaGVyLCBBbGV4
YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbg0K
PiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1k
LmNvbT47DQo+IGFpcmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwuY2g7IGpvaGFubmVzQHNp
cHNvbHV0aW9ucy5uZXQ7DQo+IGRhdmVtQGRhdmVtbG9mdC5uZXQ7IGVkdW1hemV0QGdvb2dsZS5j
b207IGt1YmFAa2VybmVsLm9yZzsNCj4gcGFiZW5pQHJlZGhhdC5jb207IG1kYWVuemVyQHJlZGhh
dC5jb207DQo+IG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgdHppbW1lcm1hbm5A
c3VzZS5kZTsNCj4gaGRlZ29lZGVAcmVkaGF0LmNvbTsgamluZ3l1d2FuZ192aXBAMTYzLmNvbTsg
TGF6YXIsIExpam8NCj4gPExpam8uTGF6YXJAYW1kLmNvbT47IGppbS5jcm9taWVAZ21haWwuY29t
OyBiZWxsb3NpbGljaW9AZ21haWwuY29tOw0KPiBhbmRyZWFsbWVpZEBpZ2FsaWEuY29tOyB0cml4
QHJlZGhhdC5jb207IGpzZ0Bqc2cuaWQuYXU7IGFybmRAYXJuZGIuZGU7DQo+IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFjcGlAdmdlci5rZXJuZWwub3JnOyBhbWQtDQo+IGdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGxpbnV4LQ0KPiB3aXJlbGVzc0B2Z2VyLmtlcm5lbC5vcmc7IG5ldGRldkB2Z2VyLmtlcm5lbC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNyA0LzldIHdpZmk6IG1hYzgwMjExOiBBZGQgc3Vw
cG9ydCBmb3IgQUNQSSBXQlJGDQo+DQo+IE9uIDcvMjQvMjAyMyAwNDoyMiwgQW5kcmV3IEx1bm4g
d3JvdGU6DQo+ID4+IEBAIC0xMzk1LDYgKzEzOTUsOCBAQCBpbnQgaWVlZTgwMjExX3JlZ2lzdGVy
X2h3KHN0cnVjdA0KPiBpZWVlODAyMTFfaHcgKmh3KQ0KPiA+PiAgICBkZWJ1Z2ZzX2h3X2FkZChs
b2NhbCk7DQo+ID4+ICAgIHJhdGVfY29udHJvbF9hZGRfZGVidWdmcyhsb2NhbCk7DQo+ID4+DQo+
ID4+ICsgIGllZWU4MDIxMV9jaGVja193YnJmX3N1cHBvcnQobG9jYWwpOw0KPiA+PiArDQo+ID4+
ICAgIHJ0bmxfbG9jaygpOw0KPiA+PiAgICB3aXBoeV9sb2NrKGh3LT53aXBoeSk7DQo+ID4+DQo+
ID4NCj4gPj4gK3ZvaWQgaWVlZTgwMjExX2NoZWNrX3dicmZfc3VwcG9ydChzdHJ1Y3QgaWVlZTgw
MjExX2xvY2FsICpsb2NhbCkgew0KPiA+PiArICBzdHJ1Y3Qgd2lwaHkgKndpcGh5ID0gbG9jYWwt
Pmh3LndpcGh5Ow0KPiA+PiArICBzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ID4+ICsNCj4gPj4gKyAg
aWYgKCF3aXBoeSkNCj4gPj4gKyAgICAgICAgICByZXR1cm47DQo+ID4+ICsNCj4gPj4gKyAgZGV2
ID0gd2lwaHktPmRldi5wYXJlbnQ7DQo+ID4+ICsgIGlmICghZGV2KQ0KPiA+PiArICAgICAgICAg
IHJldHVybjsNCj4gPj4gKw0KPiA+PiArICBsb2NhbC0+d2JyZl9zdXBwb3J0ZWQgPSB3YnJmX3N1
cHBvcnRlZF9wcm9kdWNlcihkZXYpOw0KPiA+PiArICBkZXZfZGJnKGRldiwgIldCUkYgaXMgJXMg
c3VwcG9ydGVkXG4iLA0KPiA+PiArICAgICAgICAgIGxvY2FsLT53YnJmX3N1cHBvcnRlZCA/ICIi
IDogIm5vdCIpOyB9DQo+ID4NCj4gPiBUaGlzIHNlZW1zIHdyb25nLiB3YnJmX3N1cHBvcnRlZF9w
cm9kdWNlcigpIGlzIGFib3V0ICJTaG91bGQgdGhpcw0KPiA+IGRldmljZSByZXBvcnQgdGhlIGZy
ZXF1ZW5jaWVzIGl0IGlzIHVzaW5nPyIgVGhlIGFuc3dlciB0byB0aGF0IGRlcGVuZHMNCj4gPiBv
biBhIGNvbWJpbmF0aW9uIG9mOiBBcmUgdGhlcmUgY29uc3VtZXJzIHJlZ2lzdGVyZWQgd2l0aCB0
aGUgY29yZSwgYW5kDQo+ID4gaXMgdGhlIHBvbGljeSBzZXQgc28gV0JSRiBzaG91bGQgdGFrZSBh
Y3Rpb25zLiA+IFRoZSBwcm9ibGVtIGhlcmUgaXMsDQo+ID4geW91IGhhdmUgbm8gaWRlYSBvZiB0
aGUgcHJvYmUgb3JkZXIuIEl0IGNvdWxkIGJlIHRoaXMgZGV2aWNlIHByb2Jlcw0KPiA+IGJlZm9y
ZSBvdGhlcnMsIHNvIHdicmZfc3VwcG9ydGVkX3Byb2R1Y2VyKCkgcmVwb3J0cyBmYWxzZSwgYnV0
IGEgZmV3DQo+ID4gc2Vjb25kIGxhdGVyIHdvdWxkIHJlcG9ydCB0cnVlLCBvbmNlIG90aGVyIGRl
dmljZXMgaGF2ZSBwcm9iZWQuDQo+ID4NCj4gPiBJdCBzaG91bGQgYmUgYW4gaW5leHBlbnNpdmUg
Y2FsbCBpbnRvIHRoZSBjb3JlLCBzbyBjYW4gYmUgbWFkZSBldmVyeQ0KPiA+IHRpbWUgdGhlIGNo
YW5uZWwgY2hhbmdlcy4gQWxsIHRoZSBjb3JlIG5lZWRzIHRvIGRvIGlzIGNoZWNrIGlmIHRoZQ0K
PiA+IGxpc3Qgb2YgY29uc3VtZXJzIGlzIGVtcHR5LCBhbmQgaWYgbm90LCBjaGVjayBhIEJvb2xl
YW4gcG9saWN5IHZhbHVlLg0KPiA+DQo+ID4gICAgICAgQW5kcmV3DQo+DQo+IE5vLCBpdCdzIG5v
dCBhIGNvbWJpbmF0aW9uIG9mIHdoZXRoZXIgY29uc3VtZXJzIGFyZSByZWdpc3RlcmVkIHdpdGgg
dGhlIGNvcmUuDQo+IElmIGEgY29uc3VtZXIgcHJvYmVzIGxhdGVyIGl0IG5lZWRzIHRvIGtub3cg
dGhlIGN1cnJlbnQgaW4gdXNlIGZyZXF1ZW5jaWVzIHRvby4NCj4NCj4gVGhlIHJlYXNvbiBpcyBi
ZWNhdXNlIG9mIHRoaXMgc2VxdWVuY2Ugb2YgZXZlbnRzOg0KPiAxKSBQcm9kdWNlciBwcm9iZXMu
DQo+IDIpIFByb2R1Y2VyIHNlbGVjdHMgYSBmcmVxdWVuY3kuDQo+IDMpIENvbnN1bWVyIHByb2Jl
cy4NCj4gNCkgUHJvZHVjZXIgc3RheXMgYXQgc2FtZSBmcmVxdWVuY3kuDQo+DQo+IElmIHRoZSBw
cm9kdWNlciBkb2Vzbid0IG5vdGlmeSB0aGUgZnJlcXVlbmN5IGJlY2F1c2UgYSBjb25zdW1lciBp
c24ndCB5ZXQNCj4gbG9hZGVkIHRoZW4gdGhlIGNvbnN1bWVyIHdvbid0IGJlIGFibGUgdG8gZ2V0
IHRoZSBjdXJyZW50IGZyZXF1ZW5jeS4NClllcywgZXhhY3RseS4NCg==
