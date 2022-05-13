Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1CD52657A
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 17:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F95610ED2E;
	Fri, 13 May 2022 15:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2067.outbound.protection.outlook.com [40.107.102.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2046310ED2E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 15:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwPEIzToiREC1KM2SZwTipsZU6jLoedcl8hzBNBGwi4PPK4exv+Wrf70b747w478Iiq9kfTdOV0+1eezpcyPOzl1Je1SG/LUzQVWjembtjSmlZbljH5OnOilTdy4VpS1T8a9CpqN07hwDvF/KD9p1NTHDkaybd0ztbrqM3wde39ZzAsou8/Ue4p9zC07jZYNfoWsLv1FDwL4fNe4z44viudppnGzusOhjDOU8/E+qN4iurVjnr1jq0zKWfiTZgdsV3IMHl7wjBo1XW0uPX2LBt4jCdJkyhGieKtJBcq3Peq+Ewj/Rbz4riJlQFBTT2rDuKEzOg4oGkf4HKeJ7Mjejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t04Vtfbft27rktKxdBZYH/A5I7H5UDxsqvyH6hfzHU=;
 b=dyFiuNjN1R0Cbz160Z8UcGGzqtAqmj3wkOro2egg+6tDBV34HhNx5Gb5vp9VMZMDTutqkLL+gnE1h/Nzlx3W9CoT5gixea5Sv3uZ41r1pibK/rxEjuerP+1yDyPyMUJvcgHbECf3o4yUIuJuGnwbfNOL/HStpLHhQtgPDpfCvL0KgCEHZngsirMyLxajGRd1bcLzfw9bALv1T10/NQ0EHhJu5wuKhUMjY4paFOvV+6fHeQJA9F+LFTwr75Y7vd4J9pZgLWAfikB42+WK9w4+xmYX1+zV1c9AwdvSa2ZKhgzrWVo6nYc2GU3h4uEc+d/CwsGNJq1WP9nQrvxhOG/Q0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t04Vtfbft27rktKxdBZYH/A5I7H5UDxsqvyH6hfzHU=;
 b=vX3kvKPunuJNPjq+yVhrK5oecTq/e+MdoPVAEADt7xRu35L9jYmDKj0NkEmssw0LmFatd+wAZVCxQFJJHdyvtkN2APaKnd9WoSF5hqIVhLH0DHNNI/m8Lr976LpVA7iMrCEaqYQjgYdwCfCJut3kmcS0w6ljwUJCORmkr4CaD18=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by DM5PR05MB2987.namprd05.prod.outlook.com (2603:10b6:3:55::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.5; Fri, 13 May 2022 15:01:00 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430%4]) with mapi id 15.20.5273.005; Fri, 13 May 2022
 15:01:00 +0000
From: Zack Rusin <zackr@vmware.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>, "regressions@leemhuis.info"
 <regressions@leemhuis.info>
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
Thread-Topic: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
Thread-Index: AQHYY5SQcPv2wXAocUGVFDo1UyV0Wa0Wb0OAgAAA/YCAAAICAIAGAP6AgABfWACAAA71AIAAC8yA
Date: Fri, 13 May 2022 15:00:59 +0000
Message-ID: <e12c3bd5d4324195520fed1706de6e20e6c56e99.camel@vmware.com>
References: <20220509110425.165537-1-hdegoede@redhat.com>
 <6eea44ce-4057-7267-8a0b-096cdc61dd94@redhat.com>
 <aa4c0305-c99b-050b-80a5-d13e8e10b78c@redhat.com>
 <f460b87a-a53c-0570-9c87-9997519ebb97@redhat.com>
 <8719f148-7e28-c5a6-08c4-3fbb28138b1c@leemhuis.info>
 <D060DAC5-4F3A-4268-8E20-24A56DF3AAB1@vmware.com>
 <0ee6bbce-f652-507c-902d-aa483f4880b5@redhat.com>
In-Reply-To: <0ee6bbce-f652-507c-902d-aa483f4880b5@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.0-1ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e26bd62d-b06c-45d9-15e0-08da34f1643c
x-ms-traffictypediagnostic: DM5PR05MB2987:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <DM5PR05MB2987D5E3C6BA894E2F514C7FCECA9@DM5PR05MB2987.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 92Jd9TdWwQv4XpPEV/RhOb5MnTyeM9YXMvY0S5ZtbJcOZuxE3r2i0bAF6NdRbO1hW9Gi+YoTUdRAN7tD0xnNsicLe0hq8QP+FRtTje88LZ55BYFdSY7uzqKDO1CjX84WgbDRL3AbrO33nIxpwerwm66sKz7ho4H+R+80TNUtO+r16F+KHn96+6mCUCChHzCVDJpsQENu63uGmvA8u7GU4mvuzqjCOjEgrU1LXUG63rz4AK17MvzeUfMw3lxbSadE8RKeokHpGlmvs4oosAP6Ct+Ygzk1bRqQ6a70gUg2CpgXURagUX499nvo42eAkURRDRWz4dxMQUMmQhcSUL6VcJynYs6w3S5aMqx7chjdgnOeZwweISxIlrokaLIk+XNostOjSdstPVlL9Md1gj78gEQu7Mr+Czvq64lNul8uBF+GlZXKdTV19bUba+z6vpHcirFBNRjy4zD/kSylqVvaTxDrEdwF4IqBC+ZepYP4weaiVT3p2fRKGy3EhSauyFDmTms440M6SKWTxeoVoYS6SJdhLFyVUDKJGVBlbnMDqC091T9t/l13sI4rO2s7oOWo0pjtLaPhQ5FFAucgkmqd4tYgZ/r8rPYGv0aoFI54pTA/3JWTO9lFotYnXO/HK980dGU50Uu1il55dX1j0xaz/CxMUg+FEmO3fG0wzCmSJWpSUsYYeYvU/HRaT8c5f9PfG8h5eHxIbqpcmWGbdReAYRLfFuU7GkA4KYMf4X8HI1Dv5xFUjmqrkjdkxzyEheM1vXc6eCC8Roq7Jz7qZvuYtfUAfQ9jG7OVhNBSTj8RsdU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66476007)(316002)(66556008)(91956017)(64756008)(76116006)(66446008)(8936002)(6512007)(26005)(5660300002)(8676002)(122000001)(2906002)(4326008)(38100700002)(38070700005)(45080400002)(2616005)(186003)(6506007)(83380400001)(53546011)(71200400001)(110136005)(54906003)(86362001)(508600001)(36756003)(966005)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHFsajJQSUZ3MkZCZFNucUFtZjJDSG5WMU02YmNRRGY2S3FQNGFGdlBYaGhi?=
 =?utf-8?B?REpTRXBzRWg3UVF3Qnk1Znh5UGRlNCt3clhhcDMzNllocC9uckFIeGVVTVZP?=
 =?utf-8?B?WjIveGxkWjh3R2R2TGs2dTZjUHJDalpENkdSZzUrQVgvdVhIUmFNNVJjYlhx?=
 =?utf-8?B?VkY5U1NJbkNuMDdYN2RwVFhvRTdhR0dqMm5UemRmVW1jeFR2K0QwVFYvNmdZ?=
 =?utf-8?B?YVZzTlZwSGY2SW1sc2RPdE1rMGpxSUFCNUhRc1AxL3hRa3JrNFFqTUhTVFox?=
 =?utf-8?B?NWFTUmszZXVOMkRCU3FCZG5QUlg3SERQemR1dmcwQ0dvNmNoZ1k0UWFvKzJx?=
 =?utf-8?B?OEZUTEozelZEd2c2U3E5NlNIQ3VPblUxdGRabzdidWdwVmZnZDc4YU4yMlFr?=
 =?utf-8?B?eE5meXNSTXgrZ2pQbFVuTDlRNEdEd2xuQ3h1bk51UWlVdEtFdnA0dDBVSGhw?=
 =?utf-8?B?YktZWXFveWhqQlhqamtXRXZxdVk5RmhoYjNUVERoZFAyRkVTSnNNV3ZmUmhP?=
 =?utf-8?B?MFdhbm9qQ2cyaG4rMWVwMlZIMWROL1FwT3FudUpOR0o5OGhjdjM0dzh5V2pL?=
 =?utf-8?B?Y24rMDE2RlBkL0plTHdsWHgza29md0JBNmxHNnl2V0Y3NzRGTTRIdU1YM1Rn?=
 =?utf-8?B?c1I2K3J5Rk4wQm1UZjF2S1hTODN5SGlCbGFPVW1FcjRML1M2MmFnNTNiV2Vk?=
 =?utf-8?B?YllHa2RiKzhiZm9keUVpN2paanZucTZTQmtYZU9BTXVMK3ZxamdpaU56cmM0?=
 =?utf-8?B?T3A3VFo1Unp2SXh0MVhDeHd3enUraFlGU0JDbGppMGFoZVNIUGZwT054RnNR?=
 =?utf-8?B?Y3ltOUUxTDJGOVltdnNEOFpveTZRWDFSMExxd1J4YnFMRXRqc0VrTkwzc0dp?=
 =?utf-8?B?c2FiUUQ2Z3ZMcWNSdTlTS1ZvY1JtYW9CbjBFWGsvN0FhK2pFeFVoVlRVQk1B?=
 =?utf-8?B?RGNPSlNhQ2JZVkRDd2loTVRDSzJzUXlhVHE4Vnp6aGFCQzB3UWZrZkV1SmpR?=
 =?utf-8?B?VEdYOGltSTRKMDRheThhSjllT2d1em5oZzR2MUxpSWdnbTcyQVlrbmJSSG9y?=
 =?utf-8?B?Q2ZtbGFlS3JFMUF2bHhBZXhtYVRMcTQ2WXEvNERUNmV1d0tJTU9MUE12NmtP?=
 =?utf-8?B?VkFxTkJ6SDZGU1dsWjIxc3c0RlhpY2gzT3BndWIveUVwcEtOVGViYzVVc3JT?=
 =?utf-8?B?SHdrN1J6cm5OSFJXS3RYUHRSTlhyT2ZIWktaOVdVeldJdEhvejYvSUVSRldx?=
 =?utf-8?B?WnpDV3ZJUFJiSlpEbDZ4SHZGS2FkNmJhUUU0QTQwa09VS0dNQWl5enBSN0sr?=
 =?utf-8?B?UjdEZTR2Ti9aT0VGRldGQTcybUJsRWpRNUNPVTU3UUY3ejJTTVRGUVRlTVlx?=
 =?utf-8?B?MGlCck05cytFN0xJWk9sUEJtWjlOSkcrczRKczZCMmJRY1NYTjRlUTFmdC9X?=
 =?utf-8?B?V2RHN3dxbVRNUXJGbXpXRDVHN0JXSVRGUnZkSWora29qT3RzV0psK29IVDZB?=
 =?utf-8?B?bmZTVUVGSkN6Sll3dTBBeHN5UVNSQ09BWTk5MXIxUldLSmYzNGpqanVqZTBR?=
 =?utf-8?B?VHI4N3lBanlNaFFDN2Mwb1pSY3UwamNnd2tYM0J5R2dnMGZabXhpeUd2SUhK?=
 =?utf-8?B?MVBMSERjZEpOS3VGZ28xb1pwSFFNZHlJSy9YUFVMQzk3aVkxL05iUGNSOVRo?=
 =?utf-8?B?UWFjdFlBbXM3WHB4TDJZbnhpVXNFZXRYMVVzd2ZFTWIrc2xLMmZKa010OXIy?=
 =?utf-8?B?WVVLN3BZRytnR0pEVUtNV25ObDFMU1JXZUNOTTl0WG5DUHhyVXRlbFh3WHpW?=
 =?utf-8?B?MTd3LzE5RXNRY1R3Y2JmYkk1Z1dFWVFSU0hRVDdKcHJvdFJKMDZiUVZaSDk0?=
 =?utf-8?B?R2Z4QkpFV2lkd2RSRi9ueUdUcEZKUkJPQkVJaGt5OFQ2b01rNW10eVkyaHFW?=
 =?utf-8?B?UjV1dFc4bHRZRzBNemE5dEJKQTJGL3lCWU9xN2ZBRzhNcXpGOG83dUp0cFly?=
 =?utf-8?B?bXgyZGx1eFZYZUZxTHJ0SE1PS1FmK25jcXJrQ0lFamdTdEJWNk5GaG15QWdw?=
 =?utf-8?B?Q09iQm9NSUdMMGo2cnh1OGtIaDlkRXJXaFYwMXBYVHh2SVdpMUh1VWpCQzdO?=
 =?utf-8?B?bjkxdm81VWlBQkNlbGZ3WXVETFYxNTFiS2t2WmZLNm9BeklENmJLSVBmQUtE?=
 =?utf-8?B?ODY3eWx5cnN0bVBobTJoSFIxQjhnS2JsYVZQZnlDQU1MVVpLb3JVK3RjRjFX?=
 =?utf-8?B?dnJHN3NtZG5OWFlOcVFMNU1YTkFEVFBsUldUTFczaUZGQmJEbGZpMklCZHJh?=
 =?utf-8?B?UUJpTW1PeUgxZXJpZjBqWk15M1NqN0JMd3hySmNmN0MrNXBjWlArUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <722EA27AFCD5E247824B83D3EE572749@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26bd62d-b06c-45d9-15e0-08da34f1643c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 15:00:59.9456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3WTGK4LnbctSfp4WtwNeUY6Fv0gGb+TV9JIpKS+3GlBvmUXyMbmee11iVPgiVy0D4I4yjL7vv/PZaREWnrLhPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2987
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "javierm@redhat.com" <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA1LTEzIGF0IDE2OjE4ICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0K
PiBIaSwNCj4gDQo+IE9uIDUvMTMvMjIgMTU6MjUsIFphY2sgUnVzaW4gd3JvdGU6DQo+ID4gDQo+
ID4gDQo+ID4gPiBPbiBNYXkgMTMsIDIwMjIsIGF0IDM6NDMgQU0sIFRob3JzdGVuIExlZW1odWlz
DQo+ID4gPiA8cmVncmVzc2lvbnNAbGVlbWh1aXMuaW5mb8KgPG1haWx0bzpyZWdyZXNzaW9uc0Bs
ZWVtaHVpcy5pbmZvPj4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IENDaW5nIGFpcmxpZWQNCj4gPiA+
IA0KPiA+ID4gT24gMDkuMDUuMjIgMTQ6MDIsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90
ZToNCj4gPiA+ID4gT24gNS85LzIyIDEzOjU1LCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0KPiA+ID4g
PiBbc25pcF0NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IEZpeGVzOiBkYWJkY2RjOTgy
MmEgKCJkcm0vdm13Z2Z4OiBTd2l0Y2ggdG8gbW9kZV9jbWQyIikNCj4gPiA+ID4gPiA+ID4gQnVn
TGluazoNCj4gPiA+ID4gPiA+ID4gaHR0cHM6Ly9uYW0wNC5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGYnVnemlsbGEucmVkaGF0LmNvbSUyRnNob3df
YnVnLmNnaSUzRmlkJTNEMjA3MjU1NiZhbXA7ZGF0YT0wNSU3QzAxJTdDemFja3IlNDB2bXdhcmUu
Y29tJTdDMGFkOWVlNTUwM2JmNDgxZDkxMDQwOGRhMzRlYjgyODQlN0NiMzkxMzhjYTNjZWU0YjRh
YTRkNmNkODNkOWRkNjJmMCU3QzAlN0MwJTdDNjM3ODgwNDgzMzU3Mjg3NjU1JTdDVW5rbm93biU3
Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2
SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0MmYW1wO3NkYXRhPTBNcnUwNVNL
NWQ3cDZmWWZJYnNLeklNcU1lRmJhQzhIWjgxbHM0N3RLaWMlM0QmYW1wO3Jlc2VydmVkPTANCj4g
PiA+ID4gPiA+ID4gwqA8DQo+ID4gPiA+ID4gPiA+IGh0dHBzOi8vbmFtMDQuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmJ1Z3ppbGxhLnJlZGhhdC5j
b20lMkZzaG93X2J1Zy5jZ2klM0ZpZCUzRDIwNzI1NTYmYW1wO2RhdGE9MDUlN0MwMSU3Q3phY2ty
JTQwdm13YXJlLmNvbSU3QzBhZDllZTU1MDNiZjQ4MWQ5MTA0MDhkYTM0ZWI4Mjg0JTdDYjM5MTM4
Y2EzY2VlNGI0YWE0ZDZjZDgzZDlkZDYyZjAlN0MwJTdDMCU3QzYzNzg4MDQ4MzM1NzI4NzY1NSU3
Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16
SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFtcDtzZGF0
YT0wTXJ1MDVTSzVkN3A2ZllmSWJzS3pJTXFNZUZiYUM4SFo4MWxzNDd0S2ljJTNEJmFtcDtyZXNl
cnZlZD0wDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGFu
cyBkZSBHb2VkZQ0KPiA+ID4gPiA+ID4gPiA8aGRlZ29lZGVAcmVkaGF0LmNvbcKgPG1haWx0bzpo
ZGVnb2VkZUByZWRoYXQuY29tPj4NCj4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IFphY2sgZml4ZWQgdGhpcyBhbHJlYWR5Og0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiBodHRwczovL25hbTA0LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZjZ2l0LmZyZWVkZXNrdG9wLm9yZyUyRmRybSUyRmRybS1taXNjJTJGY29t
bWl0JTJGJTNGaWQlM0Q1NDA1ZDI1YjllOGU2JmFtcDtkYXRhPTA1JTdDMDElN0N6YWNrciU0MHZt
d2FyZS5jb20lN0MwYWQ5ZWU1NTAzYmY0ODFkOTEwNDA4ZGEzNGViODI4NCU3Q2IzOTEzOGNhM2Nl
ZTRiNGFhNGQ2Y2Q4M2Q5ZGQ2MmYwJTdDMCU3QzAlN0M2Mzc4ODA0ODMzNTcyODc2NTUlN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9dVNU
MzBGZ1pqdVklMkJtWFAlMkY2SGhOc1I5QVd4QUVzTzVpdEolMkZMUmRLa1JOQSUzRCZhbXA7cmVz
ZXJ2ZWQ9MA0KPiA+ID4gPiA+ID4gwqA8DQo+ID4gPiA+ID4gPiBodHRwczovL25hbTA0LnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZjZ2l0LmZyZWVk
ZXNrdG9wLm9yZyUyRmRybSUyRmRybS1taXNjJTJGY29tbWl0JTJGJTNGaWQlM0Q1NDA1ZDI1Yjll
OGU2JmFtcDtkYXRhPTA1JTdDMDElN0N6YWNrciU0MHZtd2FyZS5jb20lN0MwYWQ5ZWU1NTAzYmY0
ODFkOTEwNDA4ZGEzNGViODI4NCU3Q2IzOTEzOGNhM2NlZTRiNGFhNGQ2Y2Q4M2Q5ZGQ2MmYwJTdD
MCU3QzAlN0M2Mzc4ODA0ODMzNTcyODc2NTUlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9dVNUMzBGZ1pqdVklMkJtWFAlMkY2SGhOc1I5
QVd4QUVzTzVpdEolMkZMUmRLa1JOQSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IEkgc2VlLCBidXQgaXQgc2VlbXMgdGhhdCB0aGlzIHdhcyBu
ZXZlciBwdXNoZWQgdG8gZHJtLW1pc2MtZml4ZXMsDQo+ID4gPiA+ID4gc28gdGhpcyBpcyBzdGls
bCBicm9rZW4gaW4gNS4xOC1yYyMNCj4gPiA+ID4gDQo+ID4gPiA+IEluZGVlZC4gQWdyZWVkIHRo
YXQgc2hvdWxkIGJlIGNoZXJyeS1waWNrZWQgaW4gLWZpeGVzIGFzIHdlbGwuDQo+ID4gPiANCj4g
PiA+IExvb2tzIHRvIG1lIGxpa2Ugbm9ib2R5IGRpZCB0aGF0IGFuZCB0aGlzIHJlZ3Jlc3Npb24g
Zml4IGlzIG1pc3NpbmcgaW4NCj4gPiANCj4gPiBObywgaXQgaGFzIGJlZW4gZG9uZS4gSXTigJlz
IGFmdGVyIHJjNiBzbyB0aGUgcGF0Y2ggaXMgaW4gZHJtLW1pc2MtbmV4dC1maXhlcw0KPiA+IHlv
dSBjYW4gc2VlIGl0IGF0Og0KPiA+IGh0dHBzOi8vbmFtMDQuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmNnaXQuZnJlZWRlc2t0b3Aub3JnJTJGZHJt
JTJGZHJtLW1pc2MlMkZjb21taXQlMkZkcml2ZXJzJTJGZ3B1JTJGZHJtJTJGdm13Z2Z4JTNGaCUz
RGRybS1taXNjLW5leHQtZml4ZXMlMjZpZCUzRDU0MDVkMjViOWU4ZTZlMGQzYmRiMDQ4MzNkNTI4
YTliYjM1ZmU3Y2UmYW1wO2RhdGE9MDUlN0MwMSU3Q3phY2tyJTQwdm13YXJlLmNvbSU3QzBhZDll
ZTU1MDNiZjQ4MWQ5MTA0MDhkYTM0ZWI4Mjg0JTdDYjM5MTM4Y2EzY2VlNGI0YWE0ZDZjZDgzZDlk
ZDYyZjAlN0MwJTdDMCU3QzYzNzg4MDQ4MzM1NzI4NzY1NSU3Q1Vua25vd24lN0NUV0ZwYkdac2Iz
ZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENK
WFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFtcDtzZGF0YT1jcTdPWGYxJTJGUDFJbUdIJTJC
QWpUUmRkRHhGOVpuUXRhaXQ2d1FYM05WcGRCUSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+IMKgPA0K
PiA+IGh0dHBzOi8vbmFtMDQuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRmNnaXQuZnJlZWRlc2t0b3Aub3JnJTJGZHJtJTJGZHJtLW1pc2MlMkZjb21t
aXQlMkZkcml2ZXJzJTJGZ3B1JTJGZHJtJTJGdm13Z2Z4JTNGaCUzRGRybS1taXNjLW5leHQtZml4
ZXMlMjZpZCUzRDU0MDVkMjViOWU4ZTZlMGQzYmRiMDQ4MzNkNTI4YTliYjM1ZmU3Y2UmYW1wO2Rh
dGE9MDUlN0MwMSU3Q3phY2tyJTQwdm13YXJlLmNvbSU3QzBhZDllZTU1MDNiZjQ4MWQ5MTA0MDhk
YTM0ZWI4Mjg0JTdDYjM5MTM4Y2EzY2VlNGI0YWE0ZDZjZDgzZDlkZDYyZjAlN0MwJTdDMCU3QzYz
Nzg4MDQ4MzM1NzI4NzY1NSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3
TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAw
JTdDJTdDJTdDJmFtcDtzZGF0YT1jcTdPWGYxJTJGUDFJbUdIJTJCQWpUUmRkRHhGOVpuUXRhaXQ2
d1FYM05WcGRCUSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ID4NCj4gDQo+IEVybSwgdGhlIGFmdGVy
IHJjNiBydWxlIGlzIGZvciBmaXhlcyBmb3IgdGhlIG5leHQgY3ljbGUsIGlmIHdlIHdhbnQgdG8N
Cj4gZ2V0IHRoaXMgaW4gdGhpcyBjeWNsZSAod2hpY2ggSU1ITyB3ZSB3YW50KSBpdCBzaG91bGQg
aGF2ZSBiZWVuIGluDQo+IGRybS1taXNjLWZpeGVzIGJlZm9yZSB0aGUgUFIgd2hpY2ggd2FzIHNl
bmQgdG8gTGludXMgdG9kYXkuDQo+IA0KPiBBdCB0aGlzIHBvaW50IGluIHRoZSBjeWNsZSB0aGUg
YmVzdCB0aGluZyBpcyBwcm9iYWJseSB0byBqdXN0DQo+IHNlbmQgaXQgZGlyZWN0bHkgdG8gTGlu
dXMuIFRoYXQgb3Igd2FpdCB0aWxsIDUuMTksIGJ1dCBpdCBzZWVtcw0KPiB0aGF0IGZvciBzb21l
IHJlYXNvbiAobGlrZWx5IGNoYW5nZXMgZWxzZXdoZXJlIGNoYW5naW5nIHRoZSBzdGFjaykNCj4g
dGhpcyBsb25nIHN0YW5kaW5nIGJ1Z3MgaXMgaGl0IDEwMCUgd2l0aCA1LjE4LCB3aGVyZSBhcyBi
ZWZvcmUNCj4gd2Ugc2VlbWVkIHRvIGJlIGx1Y2t5IGFuZCBub3QgaGl0IGl0Lg0KDQpIbW0sIHll
cywgYWdyZWVkLiBKdXN0IGluIGNhc2UgRGF2ZSB3YXMgcGxhbm5pbmcgdG8gcXVldWUgdXAgc29t
ZXRoaW5nIGVsc2UgSSd2ZQ0Kc2VudCBhIHB1bGwgcmVxdWVzdCB0byBEYXZlIGFuZCBEYW5pZWwg
Zm9yIHRob3NlIGNoYW5nZXMuIElmIHRoZXknbGwgc2F5IHdlDQpzaG91bGQgc2VuZCBpdCB0byBM
aW51cyBkaXJlY3RseSB0aGVuIEknbGwgZG8gdGhhdC4NCg0Keg0K
