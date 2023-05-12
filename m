Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E20700994
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97FF10E6C3;
	Fri, 12 May 2023 13:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BC610E6BE;
 Fri, 12 May 2023 13:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZe/IGebgHzWNUc4BB+SZqHeeCR84TD8PvSCsg/MxvphDJTThdt1+g+igzlx6mwbe1ceQ6ABnop2mvQsXkRT/Oyil5UDqnI2Yl+FlnCLUtc667VTpAjKUE9QEpDTRE0iWgukXck7P5fuKIp2r84+UxKXlqsNR7/AT8JIf8OBE6lLCHya7ghCpDlSYMSHFrn2fzObPA33nfi9HuVGb6Zt+ktSF6u+jkwWA8JRbfOnqIb0cy0O1CuxY8jtlkaI9ZY5nrm4E1usRuEunjEjMp9D4feMlgpawxbHmWJLCp28eThRgB7DwCjOmT6x4XeY1xJUcaX1tNNedTezMnETlM9jGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RocNo6/vIIBS9iH7ZE0V2CUla8hm6Iv6q73Vy08qBA4=;
 b=U8rzFLR9yZLFzCUZ0V7KVsThxL0vzZilpJ5yn2Vf7DAkbN/+6rjdrngBBpWxkd2rgQFO44OglcGfwa213bWOcACBwKSZUgoVCBy5zp+qD5bmpBEWc184eQToLZF81Ni6LOvgCgaGYg+orWEK+hMc/2TxaX7aFcqWPtM0Uw+49zMlVarakuqMEhIN0/Ot+3H2cN9rjTSdM5JIbvkSh/cXqDjuE0cKRyoCzK6Wjsmcg+CNCSLqXWwWAedJptieM62BU8juFMUM9DeTsK26zp8locFIdygq4O6JGLxOhF1zTXWTYgbE6omB9Snz/5plZ8NMaH5fysSAjjFjkfd/4ydGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RocNo6/vIIBS9iH7ZE0V2CUla8hm6Iv6q73Vy08qBA4=;
 b=eU16Wpba5J+Zufse+HtczuFfHJfZsqr0qT+lxkHkGWzxGhDxLEEVnI7Box98Xe5Aph8P75CDzxdrgoulvTV+K2Ao4QpFqVZ3VuyzAryFOM81xyr6n0Ln5rgqzkir09vx6YWeMV1tgiRkefQko0pyH0Rec9EFkK0tmYLX29H8PeI=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SJ0PR12MB5633.namprd12.prod.outlook.com (2603:10b6:a03:428::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 13:55:40 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2%4]) with mapi id 15.20.6387.024; Fri, 12 May 2023
 13:55:39 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "javierm@redhat.com"
 <javierm@redhat.com>
Subject: RE: [PATCH 04/11] drm/radeon: Use regular fbdev I/O helpers
Thread-Topic: [PATCH 04/11] drm/radeon: Use regular fbdev I/O helpers
Thread-Index: AQHZhK2e6VNOBM/ozUa6A6WoGmSsLq9WqThw
Date: Fri, 12 May 2023 13:55:39 +0000
Message-ID: <BL1PR12MB5144B0C966943E8B68E43D72F7759@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230512084152.31233-1-tzimmermann@suse.de>
 <20230512084152.31233-5-tzimmermann@suse.de>
In-Reply-To: <20230512084152.31233-5-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-05-12T13:55:38Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=fb78bc00-3a4f-49fb-98cf-cf175fc580ff;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-05-12T13:55:38Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 2ed34762-e6df-4b9b-b73f-69e20e02265c
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SJ0PR12MB5633:EE_
x-ms-office365-filtering-correlation-id: fa6d579e-83e4-4af3-f2a2-08db52f0920a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ONStkMBk/XOJ11rSWDb8ellINWwaHCQ8hgpAJp3a3bbL6K/s4gfK0P3iHlHukqYFLL01NRtLG6vtkRxNmlHN8MVeXgAq1FN9fBR604XB+E670UILVJFQB14mwR7OfxgFseJ8t86VS1/K9Nj46BZCw66gKjmY9ESekDpd6//a9js2Es1Lglh/Uvc9ILNzqKROny8tIIxl2uykuDCFt4ZGhdrCn8j2QsyTFw8c/us024POq+jX5koKfkXeFUbFDfoYz/P4kJx8TCeo1q761+c90xQvz7UIayIZJdAP0h9YkgWpSa+dR04WlgY5QxozdAROm/ty8BDg8wpEJA9onAs046s4TJaVjY3426mZnDMlyGPV5+oRSzZop+VPhNfFgWPnkfkqEgF/GELdvi7XiyQJZ/KwuTilJ360PTwOx6On21ltcNBZ/lxFwwAVCX7DPGKgZrdBbeuplSVN8UgTebDCg/aaHvr3XJt4lk+Z3PuUgAgUIOv60qU2LYVCe1feK7U931yVOiwnobJnUZ8yEiFVs42KDsjcwW/eEor1icZiFbw4EYUI8zJL1FuutMQReXBPjeWMkjkQJ4PjPNxrQfj8HlaGX04YNlgataoRQrQEDLo8q7H7z5xysCEJoMPevzNc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199021)(41300700001)(33656002)(7696005)(7416002)(38100700002)(53546011)(26005)(9686003)(6506007)(2906002)(5660300002)(83380400001)(66574015)(86362001)(38070700005)(52536014)(186003)(66476007)(55016003)(122000001)(66556008)(76116006)(64756008)(66446008)(66946007)(71200400001)(4326008)(54906003)(110136005)(478600001)(8676002)(8936002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTAwOC94R1BaYzRURjN3MjRvd3NVMFRQOXBCNUpHN1J5dngvc2M3VnE0Mk12?=
 =?utf-8?B?cUt0MHQyZnZoSFRJWFRBd1ZBZEdFOFUzajBBYkFoY3FxVGJCNXBmNXJMMlVz?=
 =?utf-8?B?TkZZV2s4M2tJY3lMcG12L1JQbkdoTTgxZHU3czdRditua1ZnbGVFdHpTdHYx?=
 =?utf-8?B?RWZkRmlaVldsUlJ4RmdPbTdRcHo2MWF4aDRCdW9uUDlPeXJmRjZFcXhjOS9t?=
 =?utf-8?B?NmZxdHFsVWs4Z1lHZXRML0RuVFNLZ3laUWNDdE15aGkyNEhUYzJybGs1QnVV?=
 =?utf-8?B?ZGxsd1pmR0lFc3hmOW5Eb21SbmUvUDZHWkFvVFRwdXJIYUFDQ296QlFhaTYx?=
 =?utf-8?B?eE01NFlMTlZZYU80TTZjdHJXY1I3aW5mRVZFU21wTm9kK3VlazJVYWlJMXdG?=
 =?utf-8?B?VkdpQUpjZVRTTXpTalZXOXZCSTdZSldBQkl2TTR1K0JXVmdJRmoxNm14amJ2?=
 =?utf-8?B?U1gwR1BKQ1lsd3NmZWtpYmJpYVkwbWFrTzVKS0NKNmE3elJ2MEp2cHFZL3hS?=
 =?utf-8?B?MUF6S3Y1cjBGSEYzWUxVOHJYa1Vqb1ROMkNWcmFmM3RxY1dkSGh5NVFLY09Q?=
 =?utf-8?B?dGwzNnBkRkNjZkNWMGNQOUJqbUE4V0pFTXU5eXRmL3JEYnNQMmdiakxZdWtZ?=
 =?utf-8?B?YkxvbkhVc1BMbDNnQ2cvUnltcVVLc09kUW84bFl1SUdRYjdpQ3Q4bWZPWWZJ?=
 =?utf-8?B?WjY3K05VU1I1WHY4eit3QnNyQlIyajl3d05CZXFNeFpyS1pZM2FuUVBFUlQ2?=
 =?utf-8?B?M2Q2U1U5RElWc0hyZk1LMFZzdU5uUDBoY1Bldk1ZMVBFL1V4QWYwZG5UTVdO?=
 =?utf-8?B?QlFBbmI1Mzc2UndkRWZPZ1Y3K21QK1p5Q3VuTzhhZHlLVHgyNkoxLzhKOG5l?=
 =?utf-8?B?OENzeWovcXF1YmE4NHFHSHFDcS9ldm45VnlYQ0lYcHp1cjBmYm5NbDFsb3hi?=
 =?utf-8?B?cmxmVHFHNkdtelovNWE1d2M5NFZ2NHp0Q3ZSYWROdUtEd3J4V3RaY3Vmc2VH?=
 =?utf-8?B?YTNjREt2ZWRhZDFBS2R0d2tLcVdqWVhxQyt3ckZQa0RhR3kxSnlxbjlBQjhJ?=
 =?utf-8?B?bTFjNU5oczlJT3VVOUUzOU1NbnUwd3dPRG5DblhiMktGcDJFckJmcUN3TCtJ?=
 =?utf-8?B?aE1qSGxHTFptUDQzUjRVSVE1SXdRbDI3eGZqQ3QzL2ZhTFBIc2YrclI2UGNE?=
 =?utf-8?B?OXh4eS9QU3k0TjVQTkJyelJtL3NHZ3lsRWxGU0VpbExySG45ei81S3R2dUps?=
 =?utf-8?B?Zmg5azM3LzVHKzFNZlVvajhJWUNjWklJbEprbVlhUmV0YjV0cUtTazFZN2w3?=
 =?utf-8?B?VE02SENPUUFaMGVFQUVkNCtwelBqTWVwMy9mNDdvYUQ5WWtKQ0tNZjkwbTAz?=
 =?utf-8?B?eFhWRjlYOHZMWXVKaXFIamNKN20waSs0cStKQng5THRmSmkxWGw3M0kzeGxC?=
 =?utf-8?B?TU9la0haV285Y2lVMUdCU3JvZ3Zqc0tXQmpCMzYrSmhrWisrMjFIcGFnd3VR?=
 =?utf-8?B?d1U0UGVEajhPaExvM09wZ3k3OFo5ZWJqNklGaFE2TlZTM2M3ZzBpc2U2VjF2?=
 =?utf-8?B?Y2FORU5Rcm95d3dpNG03SE9qZlVwQ2RYNnBRUytFQlBmVU1lODk4VVZtRmhx?=
 =?utf-8?B?RlZtdE9GR0t6b3NycWoxOUdHczJlY1Q2ZTF0bUVDV2htanZEL2lGQ0VKN0FO?=
 =?utf-8?B?aCtsWkFlSndESmc0NVdtSDhlbm5Gcm5oRHJuQkJza3ZPQzdLVDM3aS9Hc1lJ?=
 =?utf-8?B?WGV3ZUYrUTFKcC8vdXc5U21odjBPQkh5T0s5ZjkvNFlhUVBrdmF3NXFmQStX?=
 =?utf-8?B?VzRaMDRwcmdGYk0ySmNtL3kwWjRDT0ZvTjFDcXM5YSsrQUI3dzNVNDVjd0Fr?=
 =?utf-8?B?YTVFZmU0Um90Y3dlQklGOUoyOG1hdXdJOFNKbGwwQUpLVUNjSGdabVJoYkhI?=
 =?utf-8?B?aFFiM0ErUFdTM0hqaWYxWlh6OWFGeURKTFpKbG1nU2NsbzV0TmlxMDVQbXQ2?=
 =?utf-8?B?VmxzQ044SW1BVFhqN1VRTHUxZUcvYldrZCtUL0k4MDU0SjZyeFNnM3F5akZU?=
 =?utf-8?B?Y2dNaFp5K2c1OG42elBGeXJGalRYWTRMaTBvQ1dXUHI5Z3VZVG9qeXgzS1lE?=
 =?utf-8?Q?/z6o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6d579e-83e4-4af3-f2a2-08db52f0920a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 13:55:39.8666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbdRQxEQ1nFQk2iCTP3yv0GY1Fjj8R9+scTVNxe838n44szQyyOX1FoyLPGH9sn7iDhIUsFIJhvgdePJ1dTgOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5633
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMTIs
IDIwMjMgNDo0MiBBTQ0KPiBUbzogZGFuaWVsQGZmd2xsLmNoOyBhaXJsaWVkQGdtYWlsLmNvbTsg
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tOw0KPiBtcmlwYXJkQGtlcm5lbC5vcmc7
IGphdmllcm1AcmVkaGF0LmNvbQ0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1zYW1zdW5n
LXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxp
bnV4LQ0KPiBhcm0tbXNtQHZnZXIua2VybmVsLm9yZzsgZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC10ZWdyYUB2
Z2VyLmtlcm5lbC5vcmc7IFRob21hcw0KPiBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
PjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29l
bmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVp
IDxYaW5odWkuUGFuQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAwNC8xMV0gZHJtL3JhZGVv
bjogVXNlIHJlZ3VsYXIgZmJkZXYgSS9PIGhlbHBlcnMNCj4gDQo+IFVzZSB0aGUgcmVndWxhciBm
YmRldiBoZWxwZXJzIGZvciBmcmFtZWJ1ZmZlciBJL08gaW5zdGVhZCBvZiBEUk0ncyBoZWxwZXJz
Lg0KPiBSYWRlb24gZG9lcyBub3QgdXNlIGRhbWFnZSBoYW5kbGluZywgc28gRFJNJ3MgZmJkZXYg
aGVscGVycyBhcmUgbWVyZQ0KPiB3cmFwcGVycyBhcm91bmQgdGhlIGZiZGV2IGNvZGUuDQo+IA0K
PiBBZGQgQ09ORklHX0RSTV9SQURFT05fRkJERVZfRU1VTEFUSU9OIHRvIHNlbGVjdCB0aGUgbmVj
ZXNzYXJ5DQo+IEtjb25maWcgb3B0aW9ucyBhdXRvbWF0aWNhbGx5LiBNYWtlIGZiZGV2IGVtdWxh
dGlvbiBkZXBlbmQgb24gdGhlIG5ldw0KPiBjb25maWcgb3B0aW9uLg0KPiANCj4gQnkgdXNpbmcg
ZmJkZXYgaGVscGVycyBkaXJlY3RseSB3aXRoaW4gZWFjaCBEUk0gZmJkZXYgZW11bGF0aW9uLCB3
ZSBjYW4NCj4gZXZlbnR1YWxseSByZW1vdmUgRFJNJ3Mgd3JhcHBlciBmdW5jdGlvbnMgZW50aXJl
bHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4N
Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBD
YzogIlBhbiwgWGluaHVpIiA8WGluaHVpLlBhbkBhbWQuY29tPg0KDQpGZWVsIGZyZWUgdG8gdGFr
ZSB0aGlzIHRocm91Z2ggd2hhdGV2ZXIgdHJlZSBtYWtlcyBzZW5zZS4NCkFja2VkLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL0tjb25maWcgICAgICAgIHwgOCArKysrKysrKw0KPiAgZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9NYWtlZmlsZSAgICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2ZiZGV2LmMgfCA5ICsrKystLS0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9tb2RlLmggIHwgMiArLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vS2NvbmZpZw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vS2NvbmZpZyBpbmRl
eCBlMTlkNzdkNTg4MTAuLjY2Yjc0MWQ5NmNjNA0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vS2Nv
bmZpZw0KPiBAQCAtOCw2ICs4LDcgQEAgY29uZmlnIERSTV9SQURFT04NCj4gIAlzZWxlY3QgRFJN
X0RJU1BMQVlfRFBfSEVMUEVSDQo+ICAJc2VsZWN0IERSTV9ESVNQTEFZX0hFTFBFUg0KPiAgICAg
ICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVINCj4gKwlzZWxlY3QgRFJNX1JBREVPTl9GQkRFVl9F
TVVMQVRJT04gaWYNCj4gRFJNX0ZCREVWX0VNVUxBVElPTg0KPiAgCXNlbGVjdCBEUk1fU1VCQUxM
T0NfSEVMUEVSDQo+ICAgICAgICAgIHNlbGVjdCBEUk1fVFRNDQo+ICAJc2VsZWN0IERSTV9UVE1f
SEVMUEVSDQo+IEBAIC0zOSwzICs0MCwxMCBAQCBjb25maWcgRFJNX1JBREVPTl9VU0VSUFRSDQo+
ICAJaGVscA0KPiAgCSAgVGhpcyBvcHRpb24gc2VsZWN0cyBDT05GSUdfTU1VX05PVElGSUVSIGlm
IGl0IGlzbid0IGFscmVhZHkNCj4gIAkgIHNlbGVjdGVkIHRvIGVuYWJsZWQgZnVsbCB1c2VycHRy
IHN1cHBvcnQuDQo+ICsNCj4gK2NvbmZpZyBEUk1fUkFERU9OX0ZCREVWX0VNVUxBVElPTg0KPiAr
CWJvb2wNCj4gKwlkZXBlbmRzIG9uIERSTV9SQURFT04NCj4gKwlzZWxlY3QgRkJfQ0ZCX0NPUFlB
UkVBDQo+ICsJc2VsZWN0IEZCX0NGQl9GSUxMUkVDVA0KPiArCXNlbGVjdCBGQl9DRkJfSU1BR0VC
TElUDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL01ha2VmaWxlDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9NYWtlZmlsZSBpbmRleCBhODczNGI3ZDA0ODUuLjQ2YzE0
NDYxOTZhOQ0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9NYWtlZmls
ZQ0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL01ha2VmaWxlDQo+IEBAIC03Niw3ICs3
Niw3IEBAIHJhZGVvbi15ICs9IFwNCj4gIAl2Y2VfdjFfMC5vIFwNCj4gIAl2Y2VfdjJfMC5vDQo+
IA0KPiAtcmFkZW9uLSQoQ09ORklHX0RSTV9GQkRFVl9FTVVMQVRJT04pICs9IHJhZGVvbl9mYmRl
di5vDQo+ICtyYWRlb24tJChDT05GSUdfRFJNX1JBREVPTl9GQkRFVl9FTVVMQVRJT04pICs9DQo+
IHJhZGVvbl9mYmRldi5vDQo+ICByYWRlb24tJChDT05GSUdfVkdBX1NXSVRDSEVST08pICs9IHJh
ZGVvbl9hdHB4X2hhbmRsZXIubw0KPiAgcmFkZW9uLSQoQ09ORklHX0FDUEkpICs9IHJhZGVvbl9h
Y3BpLm8NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9m
YmRldi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmJkZXYuYw0KPiBpbmRl
eCBmZTc2ZTI5OTEwZWYuLmRjYWJlNTI3ZjljMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZmJkZXYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9mYmRldi5jDQo+IEBAIC0yNCw2ICsyNCw3IEBADQo+ICAgKiAgICAgRGF2aWQgQWly
bGllDQo+ICAgKi8NCj4gDQo+ICsjaW5jbHVkZSA8bGludXgvZmIuaD4NCj4gICNpbmNsdWRlIDxs
aW51eC9wY2kuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ICAjaW5jbHVk
ZSA8bGludXgvdmdhX3N3aXRjaGVyb28uaD4NCj4gQEAgLTE5MywxMSArMTk0LDkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBmYl9vcHMgcmFkZW9uX2ZiZGV2X2ZiX29wcyA9IHsNCj4gIAlEUk1fRkJf
SEVMUEVSX0RFRkFVTFRfT1BTLA0KPiAgCS5mYl9vcGVuID0gcmFkZW9uX2ZiZGV2X2ZiX29wZW4s
DQo+ICAJLmZiX3JlbGVhc2UgPSByYWRlb25fZmJkZXZfZmJfcmVsZWFzZSwNCj4gLQkuZmJfcmVh
ZCA9IGRybV9mYl9oZWxwZXJfY2ZiX3JlYWQsDQo+IC0JLmZiX3dyaXRlID0gZHJtX2ZiX2hlbHBl
cl9jZmJfd3JpdGUsDQo+IC0JLmZiX2ZpbGxyZWN0ID0gZHJtX2ZiX2hlbHBlcl9jZmJfZmlsbHJl
Y3QsDQo+IC0JLmZiX2NvcHlhcmVhID0gZHJtX2ZiX2hlbHBlcl9jZmJfY29weWFyZWEsDQo+IC0J
LmZiX2ltYWdlYmxpdCA9IGRybV9mYl9oZWxwZXJfY2ZiX2ltYWdlYmxpdCwNCj4gKwkuZmJfZmls
bHJlY3QgPSBjZmJfZmlsbHJlY3QsDQo+ICsJLmZiX2NvcHlhcmVhID0gY2ZiX2NvcHlhcmVhLA0K
PiArCS5mYl9pbWFnZWJsaXQgPSBjZmJfaW1hZ2VibGl0LA0KPiAgCS5mYl9kZXN0cm95ID0gcmFk
ZW9uX2ZiZGV2X2ZiX2Rlc3Ryb3ksICB9Ow0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX21vZGUuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX21vZGUuaA0KPiBpbmRleCAxZGVjZGNlYzAyNjQuLmM1YThlMjVhNGM5NyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW9kZS5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21vZGUuaA0KPiBAQCAtOTM5LDcgKzkzOSw3IEBAIHZv
aWQgZGNlNF9wcm9ncmFtX2ZtdChzdHJ1Y3QgZHJtX2VuY29kZXINCj4gKmVuY29kZXIpOyAgdm9p
ZCBkY2U4X3Byb2dyYW1fZm10KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlcik7DQo+IA0KPiAg
LyogZmJkZXYgbGF5ZXIgKi8NCj4gLSNpZiBkZWZpbmVkKENPTkZJR19EUk1fRkJERVZfRU1VTEFU
SU9OKQ0KPiArI2lmIGRlZmluZWQoQ09ORklHX0RSTV9SQURFT05fRkJERVZfRU1VTEFUSU9OKQ0K
PiAgdm9pZCByYWRlb25fZmJkZXZfc2V0dXAoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOyAg
dm9pZA0KPiByYWRlb25fZmJkZXZfc2V0X3N1c3BlbmQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYsIGludCBzdGF0ZSk7ICBib29sDQo+IHJhZGVvbl9mYmRldl9yb2JqX2lzX2ZiKHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX2JvDQo+ICpyb2JqKTsNCj4gLS0NCj4g
Mi40MC4xDQo=
