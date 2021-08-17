Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D731D3EE9F1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045F66E13A;
	Tue, 17 Aug 2021 09:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282666E128;
 Tue, 17 Aug 2021 09:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3i5SDknPNcoirZgjhgaZ6rC1K8PkZ6zV4GlrTTjJgL8jWkSN5vYpv8ob23eiQBTVBaAvH7L7dAiy6XIWHtSltlVNLJUtpr1Ds2FIgTjmFcvGVrF0KZdL7lS35ccL5pa4nSY0Lhe9AGq274arPQxpaPJoyAFYmCUmRGp2ZPW0ezH/A5gJKzsSRA3OehgSmyUSJz3BYohiwax+mbKC4+k3uqQK9gld8OfanGqIKwjIZohOoZqm6KiVr7jV7piKKbFYCtZT3yiE7MFvDEuQTSZcboSfHAcUzg3SctFYYz9mrVuJ6uWsyH5V2DieX/RqMSPiMAHtJ5ZWNWChSXg7lfA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGvOQNVjsaKvPUqSTw2+UGRaObSg+ZnL6JZ3IM6VaLE=;
 b=Q6QUWyVN5coROXsyw0sNgEtcCeCBJjelsl4BAnnuLKiusPMZO7bDMmVEOV+j2ZdbjSYqK7syV0CB5FsnaY4sQYX3CO5WNRp+8ifyphqZjGUxabjnD9cdEljgPvPfZQlaefZtuwg7delld7cZ9mayrUONloLj0q0v/y4ddero5u/IS+qbmwZ6Y1DLzSkFDel4Z3trL7FGNh8CehJMRVJK+YRzyoaYjBcVXBsS+bJIwSMOWx7/PUuX6VRMhdTHdeL/gUEV081ihgXEM/kOdGKHzb2C3/Ia6J7wsLkflEVswoqbUaZwFEa4rm8AsI9UKSPiIaRpl+OhVk85siRQwa/CrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGvOQNVjsaKvPUqSTw2+UGRaObSg+ZnL6JZ3IM6VaLE=;
 b=09VWW7AUanN0xaFbBlqB6MoQ9xWKVdYcXJvBi1TQwk5TMFIgww/le4Sr7moOX8flr8iPWRF/NsFZjsYKAUwRHqOOcth8shQQfnsIkipUXGhd3Fa0ya8gFhNpGvfFtn0+nD7xv4cnLaX1NsArzCepoztBznF2Ih+nqg6RVEeYHXM=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR1201MB0025.namprd12.prod.outlook.com (2603:10b6:4:53::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14; Tue, 17 Aug 2021 09:33:08 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6%7]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 09:33:08 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
CC: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
Thread-Topic: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
Thread-Index: AQHXk0EuXMCpBjd+/Eu0DtcnmeR9Y6t3bvZQ
Date: Tue, 17 Aug 2021 09:33:07 +0000
Message-ID: <DM6PR12MB2619ACEA57908373B986348BE4FE9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210816103506.2671-1-michel@daenzer.net>
 <20210817082325.2579-1-michel@daenzer.net>
In-Reply-To: <20210817082325.2579-1-michel@daenzer.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-17T09:33:03Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=e0224032-30ca-47be-8a22-492531679209;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac165650-b435-4032-3c87-08d9616205c2
x-ms-traffictypediagnostic: DM5PR1201MB0025:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB00250C8D32F8475ABB0EABE8E4FE9@DM5PR1201MB0025.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O4hg82M59+wqYvJnvN0tpy8frmtDdzndq/44ye2VoKREVV2PhA7rXu/GGog7sJNVqPcMRiktveKkaohJcgPxBMsyyRgW9CKjs7GPyGHMkU2EsLSNFMQmKIfp2tH8MxtYvclg2T/vnIrlufTohDR29OA3trJkJkySzs6suFMTt7Yhc7qEq+JDNohX67c/Prl6M2BZvC34NNGYImhFBD4dqJ7HasNUpgmE2IlSULXiboxGm0sF9uBw1N+D6AxS0GwnyzLM9AhElu1gyhEiuzNpyX1tMjGNvdRVuKt3tBPLwooHm8S07UY9ycHHKFhLQ9sPbvQDe3XI3szJdelBNkvBrqZJK/UC+UJ9msLDZLCPpPukOl5dM5Gmd7BuKimWS7/L2O0Mk6PWIDxbix12O1QKTHBIEp8Q2rv0aB8DcK+XDj2gZzmvOs7ryx/rGBmxQQDzA4q0hzsShjthMpYEXBCA2Lx4xsh/1ji1puCdoJZUxDcH5pEWR2ViicIclHQiK8NUxo/aD36zh0ygYFu3HO9PGBsn+fyHigTtBi5TJfbjcdD6TQUiw+JEr02KPdG2PQQc37uIfQ6fskd1B8Kf0X8YDtnrivhFSZ/w5j30KbOrgzL16eV/wGXV7m637rbmT0Jpt69cbo7fxUsz8oQ6zuNk3IYtHhA7L5GXHQ5J7Mp6IkNLlUtVzjD61A+g0ZGuI5Xzzsof8QWFjHKKIzi0+1NsLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(66574015)(2906002)(83380400001)(55016002)(6506007)(7696005)(478600001)(8676002)(54906003)(52536014)(122000001)(8936002)(26005)(5660300002)(110136005)(53546011)(9686003)(38070700005)(33656002)(86362001)(38100700002)(66556008)(66476007)(66946007)(6636002)(76116006)(4326008)(71200400001)(186003)(66446008)(64756008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFBFQnptdWFvUVNRMGVqSjI2bVd0NnZRall4bzdOTjZQT1ZRdmQxUS8zYkt1?=
 =?utf-8?B?bldQRUcwaXBZR2lBUWpoVytrbFNjR21XZzFsVGhyek54bGdVMzdNR1ZlM1dP?=
 =?utf-8?B?NGtGaEZIK0NRNVplRW00TEVrODVKbzBmZW1mYWplUkRlaGFYLzV3ZEdzbkg5?=
 =?utf-8?B?R1B5N29mMUd5Z1RGWTFrY1NkbVZFR3oxZmFMZnZLV0RDMUh2Q2lSeEpGRktC?=
 =?utf-8?B?ZmQ4MGJ4enMwbFg0S1h5ZGxicXRKTzdtZyt3eEFFWXUyQzE4NTQvTVdNcmtG?=
 =?utf-8?B?cm05bjhYeDl3TG40K0ZuUVA0cVA2TVI5cEoxWGoxRXBqVjRvaG1TUW9ZMGdC?=
 =?utf-8?B?Q0NpUzdUbVpDeGZ6RmZaa2U4SFI3Zyt4U0hMaVpVUXBpRG1WVHFGZ2lCKzJH?=
 =?utf-8?B?V3Bob3pBdmluT0haZTR5NU9nT0phZXkvTjVaSFVhSDR2UzM4SDZEQXFJU3lh?=
 =?utf-8?B?Vjl3YVpzbGh0UEgzSHRiYXNJdkI3cGl0U25ZcXUzTmsxSmpUcnQrSEY0QnNt?=
 =?utf-8?B?bXJ0QkNZQ29lS2IwZlBRWmNXWnhZVkxCOU5oOVFXNEFvUlFjVGFZY3I4MWRJ?=
 =?utf-8?B?b0hDSEJWdW5BeU1JVlNaVVVSNlVBYXJFUEFKSXlJTTRRczQ0NXFyRXR5RmhN?=
 =?utf-8?B?QUNVUUdHL24xdUxYMkNBYmVQQWZLckgzN0RNZ3k0RHlGVnJXdk5tUlRyMzZW?=
 =?utf-8?B?RWljdTlqMC82VHlhS2VHT3haeTBtQlprZnhkTHZDRGhpTHlZUDdlVElFL0pn?=
 =?utf-8?B?MTE0dVNPTVNWcHcvMFNHdGx1eWVtRG5VZDk4K0xvUkVYellrUjFxQzd1OS9u?=
 =?utf-8?B?QWtvZ3RRWHhXZld2bEdPM0ZUQ2RuSlJGbVBIWlFiZEpleFJEMG40dmQwT3cr?=
 =?utf-8?B?UzdqelBudU9pM3Rpd0xOeGhhMTJFSFp3UktEWHg5MWk0TGhIZFBnOCtadE1n?=
 =?utf-8?B?TEwrbUJXc3lTWUNMdS9aUlB6WTF3aGNnNWpVMllrSUhTc2NpU1NEaUk1N1NB?=
 =?utf-8?B?bUJ5WCtDSkpDUXVJaisweHB5bkxlN2psc0xYdUllN2JOOEJhbFhZNHk5NTAv?=
 =?utf-8?B?RkhkMk5COTZWUjRKNVVFdFE1NVJnaDdxZVBHdFBkeG1wTVdMZ041SU4vUmNs?=
 =?utf-8?B?cFNHZWpqcGo4VjJTL1RQN1VzSWtHc3BiRTZHYjVZOWN0VHlFYUFRVGZwMHRo?=
 =?utf-8?B?c2JtRUkxUE9qd0dweExkT3p2RVhZNVI5OVduK0ZVNmJLdVRRSnhwUzU2cjdx?=
 =?utf-8?B?b0lOc2hUeUFobERpVW1zaGlzSEY3dlNXUzNhZTBnNUt0aVBRaUFsalg2MGUw?=
 =?utf-8?B?aFl0RVBxMHVSQTJ5WTFDZEpSZ3BaNEFocFlJRS9CZmhPWkZqR3BUakJKOHgx?=
 =?utf-8?B?MUl4NjIyTDAxdDZjbEt6VXo3dGdMMlFYdG9adTZIMEVFaFVvdjMwTWtUNlF2?=
 =?utf-8?B?WjVyWVVHVkpBd2pMamV6MGxHdnJzRVU2Nk95Wk5lWGlZSWsxZElpSnNqVmxY?=
 =?utf-8?B?NE0wKzNXZWc1NjNaSGhXejY4MWhzSlk0dG1aeDkvV2RmN1FNai9BUDFxdGow?=
 =?utf-8?B?QmhXYVNFYWY4MDlZRU1QNS9YYmhPeXlzNnlHalBXL2tpYVl5cjhOb2I4TXor?=
 =?utf-8?B?cUswR0VPb2QvWDJJdVkvZEFHc0szMG5rRklrRldUUjhTL0JoNUIvT3dzd0Mz?=
 =?utf-8?B?bkw0RnNrTmJkYmxsL3dSNTZCbTdGZVRQb1lmTkhuaVViZXB1ME5pSjBvK3hh?=
 =?utf-8?Q?WkvGXINPL90ZXu3S+LJd6cvT883+MPW9YTRWX0e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac165650-b435-4032-3c87-08d9616205c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 09:33:07.6403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umWb7WUqW5aWvaTE6JvLD0OVotF9u4Q+1P3XWAwNigHcr2ke/4yj6EfCicezcM1T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0025
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KVGhhbmtzISBUaGlzIHNlZW1zIGZpbmUgdG8gbWUu
DQpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gTWljaGVsIETDpG56ZXINCj4gU2Vu
dDogVHVlc2RheSwgQXVndXN0IDE3LCAyMDIxIDQ6MjMgUE0NCj4gVG86IERldWNoZXIsIEFsZXhh
bmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxD
aHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+IENjOiBMaXUsIExlbyA8TGVvLkxpdUBhbWQuY29t
PjsgWmh1LCBKYW1lcyA8SmFtZXMuWmh1QGFtZC5jb20+OyBhbWQtDQo+IGdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDog
W1BBVENIXSBkcm0vYW1kZ3B1OiBDYW5jZWwgZGVsYXllZCB3b3JrIHdoZW4gR0ZYT0ZGIGlzDQo+
IGRpc2FibGVkDQo+IA0KPiBGcm9tOiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNv
bT4NCj4gDQo+IHNjaGVkdWxlX2RlbGF5ZWRfd29yayBkb2VzIG5vdCBwdXNoIGJhY2sgdGhlIHdv
cmsgaWYgaXQgd2FzIGFscmVhZHkNCj4gc2NoZWR1bGVkIGJlZm9yZSwgc28gYW1kZ3B1X2Rldmlj
ZV9kZWxheV9lbmFibGVfZ2Z4X29mZiByYW4gfjEwMCBtcw0KPiBhZnRlciB0aGUgZmlyc3QgdGlt
ZSBHRlhPRkYgd2FzIGRpc2FibGVkIGFuZCByZS1lbmFibGVkLCBldmVuIGlmIEdGWE9GRiB3YXMN
Cj4gZGlzYWJsZWQgYW5kIHJlLWVuYWJsZWQgYWdhaW4gZHVyaW5nIHRob3NlIDEwMCBtcy4NCj4g
DQo+IFRoaXMgcmVzdWx0ZWQgaW4gZnJhbWUgZHJvcHMgLyBzdHV0dGVyIHdpdGggdGhlIHVwY29t
aW5nIG11dHRlciA0MSByZWxlYXNlDQo+IG9uIE5hdmkgMTQsIGR1ZSB0byBjb25zdGFudGx5IGVu
YWJsaW5nIEdGWE9GRiBpbiB0aGUgSFcgYW5kIGRpc2FibGluZyBpdA0KPiBhZ2FpbiAoZm9yIGdl
dHRpbmcgdGhlIEdQVSBjbG9jayBjb3VudGVyKS4NCj4gDQo+IFRvIGZpeCB0aGlzLCBjYWxsIGNh
bmNlbF9kZWxheWVkX3dvcmtfc3luYyB3aGVuIHRoZSBkaXNhYmxlIGNvdW50IHRyYW5zaXRpb25z
DQo+IGZyb20gMCB0byAxLCBhbmQgb25seSBzY2hlZHVsZSB0aGUgZGVsYXllZCB3b3JrIG9uIHRo
ZSByZXZlcnNlIHRyYW5zaXRpb24sDQo+IG5vdCBpZiB0aGUgZGlzYWJsZSBjb3VudCB3YXMgYWxy
ZWFkeSAwLiBUaGlzIG1ha2VzIHN1cmUgdGhlIGRlbGF5ZWQgd29yaw0KPiBkb2Vzbid0IHJ1biBh
dCB1bmV4cGVjdGVkIHRpbWVzLCBhbmQgYWxsb3dzIGl0IHRvIGJlIGxvY2stZnJlZS4NCj4gDQo+
IHYyOg0KPiAqIFVzZSBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMgJiBtdXRleF90cnlsb2NrIGlu
c3RlYWQgb2YNCj4gICBtb2RfZGVsYXllZF93b3JrLg0KPiB2MzoNCj4gKiBNYWtlIGFtZGdwdV9k
ZXZpY2VfZGVsYXlfZW5hYmxlX2dmeF9vZmYgbG9jay1mcmVlIChDaHJpc3RpYW4gS8O2bmlnKQ0K
PiB2NDoNCj4gKiBGaXggcmFjZSBjb25kaXRpb24gYmV0d2VlbiBhbWRncHVfZ2Z4X29mZl9jdHJs
IGluY3JlbWVudGluZw0KPiAgIGFkZXYtPmdmeC5nZnhfb2ZmX3JlcV9jb3VudCBhbmQgYW1kZ3B1
X2RldmljZV9kZWxheV9lbmFibGVfZ2Z4X29mZg0KPiAgIGNoZWNraW5nIGZvciBpdCB0byBiZSAw
IChFdmFuIFF1YW4pDQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBSZXZpZXdl
ZC1ieTogTGlqbyBMYXphciA8bGlqby5sYXphckBhbWQuY29tPiAjIHYzDQo+IEFja2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ICMgdjMNCj4gU2lnbmVk
LW9mZi1ieTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAN
Cj4gQWxleCwgcHJvYmFibHkgYmVzdCB0byB3YWl0IGEgYml0IGxvbmdlciBiZWZvcmUgcGlja2lu
ZyB0aGlzIHVwLiA6KQ0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYyB8IDExICsrKy0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZnguYyAgICB8IDM2ICsrKysrKysrKysrKysrKy0tLS0NCj4gLS0tDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBpbmRleCBmM2ZkNWVjNzEw
YjYuLmY5NDRlZDg1OGYzZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYw0KPiBAQCAtMjc3NywxMiArMjc3NywxMSBAQCBzdGF0aWMgdm9pZA0KPiBh
bWRncHVfZGV2aWNlX2RlbGF5X2VuYWJsZV9nZnhfb2ZmKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykNCj4gIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9DQo+ICAJCWNvbnRhaW5lcl9vZih3
b3JrLCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSwNCj4gZ2Z4LmdmeF9vZmZfZGVsYXlfd29yay53b3Jr
KTsNCj4gDQo+IC0JbXV0ZXhfbG9jaygmYWRldi0+Z2Z4LmdmeF9vZmZfbXV0ZXgpOw0KPiAtCWlm
ICghYWRldi0+Z2Z4LmdmeF9vZmZfc3RhdGUgJiYgIWFkZXYtPmdmeC5nZnhfb2ZmX3JlcV9jb3Vu
dCkgew0KPiAtCQlpZiAoIWFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdShhZGV2LA0K
PiBBTURfSVBfQkxPQ0tfVFlQRV9HRlgsIHRydWUpKQ0KPiAtCQkJYWRldi0+Z2Z4LmdmeF9vZmZf
c3RhdGUgPSB0cnVlOw0KPiAtCX0NCj4gLQltdXRleF91bmxvY2soJmFkZXYtPmdmeC5nZnhfb2Zm
X211dGV4KTsNCj4gKwlXQVJOX09OX09OQ0UoYWRldi0+Z2Z4LmdmeF9vZmZfc3RhdGUpOw0KPiAr
CVdBUk5fT05fT05DRShhZGV2LT5nZnguZ2Z4X29mZl9yZXFfY291bnQpOw0KPiArDQo+ICsJaWYg
KCFhbWRncHVfZHBtX3NldF9wb3dlcmdhdGluZ19ieV9zbXUoYWRldiwNCj4gQU1EX0lQX0JMT0NL
X1RZUEVfR0ZYLCB0cnVlKSkNCj4gKwkJYWRldi0+Z2Z4LmdmeF9vZmZfc3RhdGUgPSB0cnVlOw0K
PiAgfQ0KPiANCj4gIC8qKg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dmeC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dm
eC5jDQo+IGluZGV4IGEwYmUwNzcyYzhiMy4uYjRjZWQ0NTMwMWJlIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+IEBAIC01NjMsMjQgKzU2MywzOCBAQCB2
b2lkIGFtZGdwdV9nZnhfb2ZmX2N0cmwoc3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYsIGJv
b2wgZW5hYmxlKQ0KPiANCj4gIAltdXRleF9sb2NrKCZhZGV2LT5nZnguZ2Z4X29mZl9tdXRleCk7
DQo+IA0KPiAtCWlmICghZW5hYmxlKQ0KPiAtCQlhZGV2LT5nZnguZ2Z4X29mZl9yZXFfY291bnQr
KzsNCj4gLQllbHNlIGlmIChhZGV2LT5nZnguZ2Z4X29mZl9yZXFfY291bnQgPiAwKQ0KPiArCWlm
IChlbmFibGUpIHsNCj4gKwkJLyogSWYgdGhlIGNvdW50IGlzIGFscmVhZHkgMCwgaXQgbWVhbnMg
dGhlcmUncyBhbiBpbWJhbGFuY2UgYnVnDQo+IHNvbWV3aGVyZS4NCj4gKwkJICogTm90ZSB0aGF0
IHRoZSBidWcgbWF5IGJlIGluIGEgZGlmZmVyZW50IGNhbGxlciB0aGFuIHRoZSBvbmUNCj4gd2hp
Y2ggdHJpZ2dlcnMgdGhlDQo+ICsJCSAqIFdBUk5fT05fT05DRS4NCj4gKwkJICovDQo+ICsJCWlm
IChXQVJOX09OX09OQ0UoYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50ID09IDApKQ0KPiArCQkJ
Z290byB1bmxvY2s7DQo+ICsNCj4gIAkJYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50LS07DQo+
IA0KPiAtCWlmIChlbmFibGUgJiYgIWFkZXYtPmdmeC5nZnhfb2ZmX3N0YXRlICYmICFhZGV2LQ0K
PiA+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50KSB7DQo+IC0JCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygm
YWRldi0+Z2Z4LmdmeF9vZmZfZGVsYXlfd29yaywNCj4gR0ZYX09GRl9ERUxBWV9FTkFCTEUpOw0K
PiAtCX0gZWxzZSBpZiAoIWVuYWJsZSAmJiBhZGV2LT5nZnguZ2Z4X29mZl9zdGF0ZSkgew0KPiAt
CQlpZiAoIWFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdShhZGV2LA0KPiBBTURfSVBf
QkxPQ0tfVFlQRV9HRlgsIGZhbHNlKSkgew0KPiAtCQkJYWRldi0+Z2Z4LmdmeF9vZmZfc3RhdGUg
PSBmYWxzZTsNCj4gKwkJaWYgKGFkZXYtPmdmeC5nZnhfb2ZmX3JlcV9jb3VudCA9PSAwICYmICFh
ZGV2LQ0KPiA+Z2Z4LmdmeF9vZmZfc3RhdGUpDQo+ICsJCQlzY2hlZHVsZV9kZWxheWVkX3dvcmso
JmFkZXYtDQo+ID5nZnguZ2Z4X29mZl9kZWxheV93b3JrLCBHRlhfT0ZGX0RFTEFZX0VOQUJMRSk7
DQo+ICsJfSBlbHNlIHsNCj4gKwkJaWYgKGFkZXYtPmdmeC5nZnhfb2ZmX3JlcV9jb3VudCA9PSAw
KSB7DQo+ICsJCQljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJmFkZXYtDQo+ID5nZnguZ2Z4X29m
Zl9kZWxheV93b3JrKTsNCj4gKw0KPiArCQkJaWYgKGFkZXYtPmdmeC5nZnhfb2ZmX3N0YXRlICYm
DQo+ICsJCQkgICAgIWFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdShhZGV2LA0KPiBB
TURfSVBfQkxPQ0tfVFlQRV9HRlgsIGZhbHNlKSkgew0KPiArCQkJCWFkZXYtPmdmeC5nZnhfb2Zm
X3N0YXRlID0gZmFsc2U7DQo+IA0KPiAtCQkJaWYgKGFkZXYtPmdmeC5mdW5jcy0+aW5pdF9zcG1f
Z29sZGVuKSB7DQo+IC0JCQkJZGV2X2RiZyhhZGV2LT5kZXYsICJHRlhPRkYgaXMgZGlzYWJsZWQs
IHJlLQ0KPiBpbml0IFNQTSBnb2xkZW4gc2V0dGluZ3NcbiIpOw0KPiAtCQkJCWFtZGdwdV9nZnhf
aW5pdF9zcG1fZ29sZGVuKGFkZXYpOw0KPiArCQkJCWlmIChhZGV2LT5nZnguZnVuY3MtPmluaXRf
c3BtX2dvbGRlbikgew0KPiArCQkJCQlkZXZfZGJnKGFkZXYtPmRldiwNCj4gKwkJCQkJCSJHRlhP
RkYgaXMgZGlzYWJsZWQsIHJlLWluaXQNCj4gU1BNIGdvbGRlbiBzZXR0aW5nc1xuIik7DQo+ICsJ
CQkJCWFtZGdwdV9nZnhfaW5pdF9zcG1fZ29sZGVuKGFkZXYpOw0KPiArCQkJCX0NCj4gIAkJCX0N
Cj4gIAkJfQ0KPiArDQo+ICsJCWFkZXYtPmdmeC5nZnhfb2ZmX3JlcV9jb3VudCsrOw0KPiAgCX0N
Cj4gDQo+ICt1bmxvY2s6DQo+ICAJbXV0ZXhfdW5sb2NrKCZhZGV2LT5nZnguZ2Z4X29mZl9tdXRl
eCk7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjMyLjANCg==
