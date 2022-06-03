Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A34153CBB0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C5710F065;
	Fri,  3 Jun 2022 14:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6E810F093
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 14:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEThkPDVhgckbWF/vnSz/wuQR/VKK56L/FK3Qzoxj/07jYtLRuue8BXe2dJ9iRdv8gYaUPhV1ogpbZPUz49mxV1vNug4BbyxddbKX/jfzB8stvAA3MRxLpIiqPEJ4SES+mIh5IGdOXcihZ+7AyDCKC7inTFIGAKo6W7/dt+S3bS2LkMOboXbYAnw9R9dYxiorkb3umm+PhWV8CfB8XwAHUoe4VpqoC/FBzFNVV3LiEe2LKVrQvylheAzjFBK4bRriDWJfvU4tExPpdSsRJXj8GIijnntdhtkxhTv5xGoy7wdyrrcntQWUc8SGc6HA8C66+X9ASLImqjjcMrU6M++NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/Fi6QS9CDhHceZ/T29W9BsD44I4j54ETkYsnnye60Q=;
 b=nR1gQqYR3KUpLk2npTS3EXK5MiqL1fELcBYak7u/vkKDTbb4PFrsSkF24x0LpxJXCRIGfqiEUrpkr2NHnTmO/QAZWEab1OYPXHQFpD1N4tbpi73uCMArkGs4hmTQAym+J6+Gby+L/F1igUGqcM+a8R8GomZ9nxePMRX+XJHIqqkvz1iyhg3ED732zGmB4WykiR5bgH0wUBu9o3kA827m02eZFBkbohnW8MCuf1yQWBLCI7WwtbHPVIMaFt2mP8mJgnE66LzQzepywTm/tbERHEuzwXS3y9fmZ7r2rOhg4Q739qDl9PFnFYq7Y1VjKfXGG/RSRjK/fMilsZKnu+K4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/Fi6QS9CDhHceZ/T29W9BsD44I4j54ETkYsnnye60Q=;
 b=Q+sFlyf2k03EDfsMSv+WIOpQjHx0Jdc6bJukNPIa/TfhV4WE7L0BGw9xDQUVNqFo7zPgjlTeSegxnB8vYwbU/PrX5EZnHH8H9k3Cgwjgy0OdY9isQSHmfLyYz0+847GSz0YF7aLT4yN7zKb9tkyvWOuphIO/Kl1kfIlUse2EbY8=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by CH2PR05MB7174.namprd05.prod.outlook.com (2603:10b6:610:45::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.4; Fri, 3 Jun
 2022 14:43:08 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::10c6:987:f526:83aa]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::10c6:987:f526:83aa%3]) with mapi id 15.20.5332.006; Fri, 3 Jun 2022
 14:43:08 +0000
From: Zack Rusin <zackr@vmware.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Topic: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Index: AQHYdpeKjA+fIeSl9UGD1Oezsoj+Fa09fDMAgABHF4A=
Date: Fri, 3 Jun 2022 14:43:08 +0000
Message-ID: <788F94C6-41B4-48E0-A634-1E678E67063D@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <20220603102840.g5y43spkwtowmdcc@sirius.home.kraxel.org>
In-Reply-To: <20220603102840.g5y43spkwtowmdcc@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bce0cd8-ac8c-470e-f348-08da456f601a
x-ms-traffictypediagnostic: CH2PR05MB7174:EE_
x-microsoft-antispam-prvs: <CH2PR05MB717449162A7FA486EA2464FACEA19@CH2PR05MB7174.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aic0YErAKlwHtGa0nwZ8IteKup6uIrU0mut5z4EMmFJIBtqdD/1kAjLTViiOVzEvZATVTjgB2FQjA/h8djxyG2lebmAcm5nljMGLOMPApLGOIBmJK2HY7XKbq33gBonnyYAUZIBzcc/wxpPHdqqQmJTzHyQGhk08gTBSf1rejiIZbZ2PVIpbqpqQ3xVEZ/Spdcw20EyYlO9AdptIBlVb9BHEEkj5pza0mllSbl6tJT8PSOQqA9pn7jZ2uzdNF5wJuKZMwpqu4iAOF1JYawkrLUqs2TI+StsazMZe9nD5Kvom2miwAnlOLz+IKjtcNsQdkBWYbTGHa26M8NS+fHnD7Xasfy/9KmTTugAaRMJCmGshYQumaoSUnovpp9IMQUmWtW5rzrrR0Rhz2k0uLQp44pg5fsqVP3SeSu1AIGC81a30O2++G/wWTJdw650z2JrYOvR2K+IH0SWGJRquxZNmOAyMTc3/Ea9y4i5A/CUJm6ykEQlBUcIsYpF5tyHyw9zfGt09tfJSCQZkvspTU5c1BQnYvUnGKWGytbhbqnFQEoZMmEiuPK9RJ/1m8hCXMk8fcJ1ehdUwRRUdBKYhPOJhqBZgv+3HG1ijgvI3nseIt2PwfOW8jcaJz/ezxBVB5+KTrL4fPObotIQTZTUeNKL6cb1BX0Eujl8ctlxQ7HV4KkVj5XG5rsvq84hqeGyDNBw8itC7L1rZ74thubc8sUgDrJDYqvT/gU2pcmjELNYc1tWTJvaivU5eQ6DGVDcGVPH2tD+ETOI/GL9gmj+h7ByPAlw8NpifMJitHDMDUkfxNZg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(6512007)(186003)(53546011)(508600001)(6506007)(2616005)(86362001)(66946007)(91956017)(66446008)(33656002)(8936002)(36756003)(66556008)(66476007)(5660300002)(64756008)(38070700005)(122000001)(8676002)(4326008)(316002)(2906002)(76116006)(71200400001)(6486002)(54906003)(6916009)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2c1R0tXak1RUEJoa25pdDBnbFcyejFjZlJUWVRzcjI4RjlrNjB1WTgxTE02?=
 =?utf-8?B?QXhyeGJ1bDZOVWFWWmNQaWc5UHpvNitUT2JyT3d1dEt2MTRZakRWKzdWNEhU?=
 =?utf-8?B?RmxrczB0OXhRQjJoSlltaUJ5ZG5zQUJiMUZvR1kwUVdJQXh6MnRXcGEyQVpa?=
 =?utf-8?B?ZU1OWVNZdEp1NEtubHhYYlhNeitHYy9SWDhwaFB6RE1xWFdET05peFZ1bzFS?=
 =?utf-8?B?RG9hVEcwVU9OdXd2TzZjTWllbnlwQlFxUVFyZFVPVEFrZ0p3bzhqNWZqSjBL?=
 =?utf-8?B?TW9lQkNLb1lWUS9mTXlIVDVzK0ZPaFA2eEhjTWxMOFpyVXB2Q0NTTW5McWE5?=
 =?utf-8?B?T0tleDlSV1hyclJPVGpKRE42VTdCK2FUbVlyTitVK3VPR05jdVVJQnBjaVFQ?=
 =?utf-8?B?RUNxcGdLSFlmRFBTN2VmWnM0NFcwUnJGUjVQQWF1RXZYM1FLWFJLcmMwOFpq?=
 =?utf-8?B?TUpVbjNudm41L0xLdDBHeC9odzVibG9tNFV4SnFIQ0VxZ0Q0OWZjV1VRVmZr?=
 =?utf-8?B?Y0k3djVGdHBSRHArc3FsM0RHa2drUnNuWTZuWW95ZnV0eXlyMWF1NWp3eWNZ?=
 =?utf-8?B?WnZxa3E5dERSWWFuWURHeS9nekhxQW9ORVFVUzZPaUhIajg4ZVJESEowdXdx?=
 =?utf-8?B?N1RUaFhyOGpYeFNaSU81QUc2QVhnS0M0dENTMktjUWVPSmdBNnBwSStyRUN2?=
 =?utf-8?B?OFY4U3BxZzlld21JM2tsUC9LQUxkV01vaVpCSDkyWGZsRmg5NDZNZDhXcXdL?=
 =?utf-8?B?N1ZMMy9raXEyTDE5bmVNd3UxQ3c0djNkVTNPUlhURlB1TU1DUlM0UjhDb1Q1?=
 =?utf-8?B?U2U3R0RlOEtnSWNjeTJJWXlRN1JUL0pEOGJ0UmtDbTFpRWo3cnFMbzZSWEt6?=
 =?utf-8?B?NUE3OTluUlJOYkh6MDh2NmpzaFBySjZ5Z0xXT2hqd0ZEMWF3R1FYUFdpcHRi?=
 =?utf-8?B?Wkx5YVR5NEI2dS9rMndrZ1UxMTY1a0U1SGMzWjFsbjFqNnZsNWFRNlpWcjZP?=
 =?utf-8?B?QnhWZmZ4TFF5RzN3SUtndXdPNm9USWRFUWxNSDFOVzc4cEFsSjFaTjBkNkZN?=
 =?utf-8?B?SEprVGlYNWtLT2RDeS9kNkhBZ1VsSUIyUkJSTFNVTnU1VnR0Q0dkQ0lvREd6?=
 =?utf-8?B?K1g3YlhKY3I5anVnTWRhcjlGUlc3S1pnWDFhWXhHVzRlekFtQXJ0eEdiV0RX?=
 =?utf-8?B?VVZkVUIrTmo0dEZPVmQxR29MTzFEMjU2c1dyc0FUMzBYN3NGTlZCanZuVG9q?=
 =?utf-8?B?NVJoMlRqazRONWtRRTBPdnIyVEdCWkJBZWkxZUF2bzlMK2pTMytVdE9hUWtB?=
 =?utf-8?B?ZTBuUkgzNnkzSGNkOVZVcTFuK3pNaHFxOVRmUTliNjNMdTRwbHcwOEo5R0lT?=
 =?utf-8?B?Rzl2cDJCUDUxVkxuZ2cwT2tRWlpCMmsrcy9aZGlOall4NEVTVVZpR2hRSUxM?=
 =?utf-8?B?MDk3Rjd4dlJja1dxUGpRVURVd3pkbytYa1hEUUdOZmNIcDZ5REZ5ZFQwTGVl?=
 =?utf-8?B?TVdmTXZSSHI4K082ZHBIdTBrL2Z0ZHplTFdtZ3pUM2JQUDh4R1YvMWJUaE1E?=
 =?utf-8?B?L2tVOU4ydkl3Y3ZqdlhnZHhnU2duN0NhNi9YSDVDRlduL1hPOG5qemhxSE5S?=
 =?utf-8?B?UGllKzRQTVVHcnNsWW5QT2Q4WllDaXgvV1pDVURHRXc2MXFzMVRtV1FTb005?=
 =?utf-8?B?aGszSkcvNlFyYnhiREhTZjB6STY4bjJsbC9STUt1aVFvSnhFVTQvNU04d2l4?=
 =?utf-8?B?ajNWbWc3UzVQUFltUzRCamJZQ1ROTUQwSy9Qelh1WVJlRjZJaGpBb0ZjOTlM?=
 =?utf-8?B?LzZPenRqVDBVRkczY3h1Q2FWYmVpaklsQnBHUjlFS3ZnR2dIMjV3bE5RVEli?=
 =?utf-8?B?MmRHcnhtQUdXYlJTQXljcU5TQjUvZ0JZNXh3NFYvL2h4TUJ0bWFkRUtUdnc5?=
 =?utf-8?B?UTFiUmZTRUx1VnZiYzdOWUVNb3VwU29jRUl2ZVNiQ0ZCcnY2UUcyeklmelZK?=
 =?utf-8?B?SFZMY25SZS9KLzFJVmNpN3liSXJZSFJrYUdYSXZqN01LZGs1RkZYeUNmbUE2?=
 =?utf-8?B?dWttVVdXU3pSYWRNT3l3Y0lJYkxWa3NMQnpaSUMwRkorczB2Q05FcVNoeVJJ?=
 =?utf-8?B?TG9ka0VuWlR6QnYrS0l4cnNlNlRCMzhIZTR6a3F4QnJ5c3V1WW9jRWFhMzU3?=
 =?utf-8?B?MEplVVpyT1l4ODRjMG1hZW5wNThFZ3pSVDVJU2NCamIrL0IxS3daakM5anlI?=
 =?utf-8?B?TWtuWWQxQkhnUWdPSnBWQllrWUhINVFSV2NsR0hIVHUyZGdSS20yWkYzeXl6?=
 =?utf-8?B?N3Ftamx6UUo1cllGbmU1bFVMQkdlRWtlQnliU0ZyMkdvNnNBdS9sQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E56D4312CD7FB144BD122D016A847FB2@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bce0cd8-ac8c-470e-f348-08da456f601a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 14:43:08.1943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: be9cBmcpNFPZY4HfoU+1sZ/esVdlgcwYAxK7v8X303nis5RH/KQZgs0avYN3CNd7mKwxJC3OZMBzVnRF4lQcAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR05MB7174
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
Cc: Martin Krastev <krastevm@vmware.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gSnVuIDMsIDIwMjIsIGF0IDY6MjggQU0sIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IOKaoCBFeHRlcm5hbCBFbWFpbA0KPiANCj4gIEhpLA0K
PiANCj4+IHRoZSBsZWdhY3kga21zIHRvIGF0b21pYy4gVGhpcyBsZWZ0IHZpcnR1YWxpemVkIGRy
aXZlcnMsIGFsbCB3aGljaA0KPj4gYXJlIGF0b21pYywgaW4gYSB3ZWlyZCBzcG90IGJlY2F1c2Ug
YWxsIHVzZXJzcGFjZSBjb21wb3NpdG9ycyBwdXQNCj4+IHRob3NlIGRyaXZlcnMgb24gZGVueS1s
aXN0cyBmb3IgYXRvbWljIGttcyBkdWUgdG8gdGhlIGZhY3QgdGhhdCBtb3VzZQ0KPj4gY2xpY2tz
IHdlcmUgaW5jb3JyZWN0bHkgcm91dGVkLCBlLmc6DQo+IA0KPj4gLSBhbGwgdXNlcnNwYWNlIGNv
ZGUgbmVlZHMgdG8gaGFyZGNvcmUgYSBsaXN0IG9mIGRyaXZlcnMgd2hpY2ggcmVxdWlyZQ0KPj4g
aG90c3BvdHMgYmVjYXVzZSB0aGVyZSdzIG5vIHdheSB0byBxdWVyeSBmcm9tIGRybSAiZG9lcyB0
aGlzIGRyaXZlcg0KPj4gcmVxdWlyZSBob3RzcG90Ig0KPiANCj4gU28gZHJpdmVycyBtb3ZlIGZy
b20gb25lIGxpc3QgdG8gYW5vdGhlci4gIE5vdCBpZGVhbCwgYnV0IGFsc28gbm90IHdvcnNlDQo+
IHRoYW4gaXQgd2FzIGJlZm9yZSwgc286DQoNClllYSwgdGhhdCBwcm9ibGVtIHdhcyBhbHdheXMg
dGhlcmUgYmVjYXVzZSB3ZSBuZXZlciBoYWQgYSB3YXkgb2YgY2hlY2tpbmcgd2hldGhlciBhIHBh
cnRpY3VsYXIgZHJpdmVyIHJlcXVpcmVzIGhvdHNwb3QgaW5mby4gVW5mb3J0dW5hdGVseSBJIGRv
buKAmXQgdGhpbmsgdGhpcyBjYW4gbm90IGJlIHNvbHZlZCBpbiB0aGUga2VybmVsIGFueW1vcmUu
IFRlY2huaWNhbGx5IHRoZSBob3RzcG90IHByb3BlcnRpZXMgc29sdmUgaXQ6IGRvZXMgdGhlIGRy
aXZlciBleHBvc2UgaG90c3BvdCBwcm9wZXJ0aWVzIG9uIGN1cnNvciBwbGFuZXM/IElmIHllcywg
dGhlbiBpdCByZXF1aXJlcyBob3RzcG90IGluZm8uIEJ1dCB3ZSBjYW7igJl0IGRpZmZlcmVudGlh
dGUgYmV0d2VlbjoNCi0gZHJpdmVyIHRoYXQgZG9lc27igJl0IHJlcXVpcmUgaG90c3BvdCBpbmZv
DQotIGRyaXZlciB0aGF0IHJlcXVpcmVzIGhvdHNwb3QgZGF0YSBidXQgd2XigJlyZSBydW5uaW5n
IG9uIGEga2VybmVsIGJlZm9yZSB0aG9zZSBwcm9wZXJ0aWVzIHdlcmUgaW1wbGVtZW50ZWQNCldl
4oCZZCBoYXZlIHRvIGJhY2twb3J0IHRob3NlIHByb3BlcnRpZXMgdG8gZXZlcnkga2VybmVsIGJl
dHdlZW4gbm93IGFuZCB3aGVuIGF0b21pYyBrbXMgd2FzIGltcGxlbWVudGVkLiBTYW1lIHdpdGgg
YW55IG90aGVyIGNoZWNrIHdlIGNvdWxkIGFkZCB0byB0aGUga2VybmVsLiBMaWtlbHkgbGliZHJt
IHdvdWxkIGJlIHRoZSBwbGFjZSBmb3IgdGhpcyBhdG0gYnV0IEnigJltIG5vdCBzdXJlIGluIHdo
YXQgZm9ybS4NCg0Keg==
