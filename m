Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1A6AFE2B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 06:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652CA10E011;
	Wed,  8 Mar 2023 05:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU008-vft-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11012002.outbound.protection.outlook.com
 [40.93.200.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740A810E011;
 Wed,  8 Mar 2023 05:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bk3l0nuIeDyMW0nvKajRyUBIrK+f63m06wnui47iRs/0CLaTmGWAbp9sJI3ZI0qVHavNWvVC0DRPcpuuS2pvrrj38FtkujjRG5M1ZJdzKgy+BKbJqleGnSiEVD9EHIq9xUTNPLBJWlHPmkcAzNvpTQpKVBqk5cnuKyPlCYYlEUhmQN4K6848bGSsw4DwZFAuVMNA3vvwyknOEYB2Ybv1zQ3U/XC05vh9uIzXAayY/jFj79PKcK7ya7sGSdsalzwn23VXONMe2Oc36h9sBzVwYlNtpzx966aGKA+rpc9sg9LMBbPOM2XaExQeD2DSqjbmdE+TtDPdUl5UV0vsTtTSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AIfs0el1nhL1225l73QcqJO3sMTewLL7h3SiK1JXvk=;
 b=CebobRBtSXGJ5/LIiLx8VdIPldwqWRDbNyQiwJu/TPu0KFdL3DlLRLgggeWTRtMrgJEWLrQN6RnN4eKzRdCd+ik8N6/ouPoUk5T4V1xlBLAHp9XZGUN3skw4Pzzu1gqjmdu8tE3zXVPz5CO8f/aHxvis1cFvVH/emwKQ83Q3EAlyNLpl0gardwh2KqaD8KfHWFigowzowejexd+v6acZuL7k8bFMbchfp32W5kUGv0D+QWdlL65NbJc1Uh1qco8pbb3JlvqJMl6Fo9LR3JLWbB8XoaQUq4ocA8t85K2IWYzKV6EV+xjLqMUesmyA47BmJBYbRbAfks6y6X6UnQBPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AIfs0el1nhL1225l73QcqJO3sMTewLL7h3SiK1JXvk=;
 b=qJUgQKBkSXJKo0fyWN/eFAii4oPPMTZSz8ll0imKJADK4ZSaPBapFljydthWlGJLb+kr4M8rq923z+bBfSUTKitDqUV8MP4KtRQcY8nkDRUhr/MEy4nCIhH2UmaUzEFVhRAgI1JCgAWU8fF+opQJN24JEl6dCf9+jNcHJ9wyIkI=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by BL0PR05MB5458.namprd05.prod.outlook.com
 (2603:10b6:208:6a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 05:14:56 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 05:14:55 +0000
From: Zack Rusin <zackr@vmware.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 9/9] drm: move ttm_execbuf_util into vmwgfx
Thread-Topic: [PATCH 9/9] drm: move ttm_execbuf_util into vmwgfx
Thread-Index: AQHZS09/txQe14sNKkKTzUIFpMWF9a7wYzeA
Date: Wed, 8 Mar 2023 05:14:55 +0000
Message-ID: <b4beeee4b2a004938adc6c502443f7b3311aad50.camel@vmware.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-10-christian.koenig@amd.com>
In-Reply-To: <20230228083406.1720795-10-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|BL0PR05MB5458:EE_
x-ms-office365-filtering-correlation-id: 3ea887e4-6b5c-4a8d-665f-08db1f940e3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k50FHWp2l9fXhzz3iwFjDXFL5kcJEvva0/+MpDgjTAYNTY3BX0OW5vyNc+MDc3uyYAZ19Krpo938bjGNisfwsExxRn0f6u688woTWvqRaw9zoDUFnlCW8SU/09RHnKNPFTfArGLG752U6DbTbb44NkxyzQ+EhuJNilzLbxHIbs780qKjV/PZyBs0mhMg+NGRBT1TYw3GPNGs82t56nXgvNYF2emzQa07rL+QaXu7x6njlvcTFuLCWJ4UcTiBWZc1oKyJN6ArKLIXHxl9S+jDqCdFWLjPPqdrO/uphzDwSm+fc1JPuYlFx73wgt+yNla0FPQtW70lKA4omdIb0/30xh8kIXc4QEUA8kCGkxFNOhtg/UA1yu/SH6CDJZc5BK1vAdN3BArKbef/EF14RGEbkXP4n7NZBTmvpEOp4BnWvMWXwBhPx/uEbMRA9WtZschbXqztseXVcM1y+YJBBBiqGqSCN4yWPamYIx3xE9Qace9snJChHOWME8+4KcIm5eHBn27CEdvQz9IkBNuIp7pNaDAw21YNKyyUCy98YKEaNAFn6e3QoQQg7Kj6KSPLHckYOy+MR6AexwVQ6Ivnj8BAFFkEnWs3da5O30kK2pTNgPg7GPfRkbKN6ZtlyaX9N0Dve+mwf9xHPpOR5y+q5SzfZIGji9M1am7cKX2MDJEIyImQcrDKOFJ+x2SGit+mmLxZKqGaOlba15QikzQQqs81nV44QleQAuZdvJxED/KqpPY5BCnNt0LECMFXKcVET9Qf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(86362001)(2906002)(4744005)(38100700002)(38070700005)(122000001)(71200400001)(6486002)(186003)(478600001)(36756003)(6512007)(6506007)(66946007)(8676002)(91956017)(110136005)(76116006)(54906003)(66446008)(4326008)(66476007)(26005)(2616005)(64756008)(41300700001)(66556008)(5660300002)(316002)(8936002)(17423001)(156123004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2U3bmZTM2dZMlNrUE0yeTVxZW1PYWdRZlJqUWdEWk1jOCtYOUtPcmNWR1p4?=
 =?utf-8?B?UTRVdkN0L0Frdkp4UWVNRStZL2RhUWMxS0VQNE9tZVZQUkQxeStGeTNNdkR5?=
 =?utf-8?B?Mk8rSFNMcDNmZXk0ZjVwaWgyamVnQlAwVDZjV1pXU0Z3TUlNeEtyMm0zOWFm?=
 =?utf-8?B?MW1XSmRaT1NCNE44MUpWL0hVSVgxYnJrdjc4OHdtTDFtWlR0SmN5dWtzVCts?=
 =?utf-8?B?a0M1Um14UUx2ZzR4QjVLUG5TSk1jMzdTRzVCdkIwNy9FVEp6UkZTNU1GN2RS?=
 =?utf-8?B?ZnhaaWt2QzR4R2psYnpPZFpTTDZOS0VCbkhRSkFsSFhWSFZLUk9ic0ZNY1Zz?=
 =?utf-8?B?Rm1RUnlXSjlOTGFtV01DWG9Xb0VNT3Z4MFZDZzgrbTBKYXFPS2JmY0k1TTdO?=
 =?utf-8?B?SGlXNXBZOXVHcEN1WjFhcjR6UTdWYk8xN0tHTHpCTkhUcTRiL1p4R1RIZ2RL?=
 =?utf-8?B?QzQ4UDg2UHYrNC8zUEk5MnhLdjNlZ3hPOFpYam1xUG90R0R5REx1czNpSGZG?=
 =?utf-8?B?ZlRPb05kS3h1NXV2NzFpbG1DeFpJcEtQSVE5Z2hzZDE3MUFzNjhZc3MyYUdC?=
 =?utf-8?B?cGJ2dFdncm1YY3BRNEFGRVNmRGdUSGxITXRrbjNWZVZ1QnBEak1MVTRPRWFh?=
 =?utf-8?B?L09SMnhIS3kvenB6YWZzL0txblJzOGVyNm5HSjZLSGxJa0J0d2VzV0UrcmFH?=
 =?utf-8?B?MWxxT1UzeDFwcVA5KzJvRGQ1Qm5yNUxVZHBkZmYyREtnKzVldlJCZmVjWk1P?=
 =?utf-8?B?VkE2bExoc3FWeXhoVG1kanpHbkFoQXdFRG1iR015dXpxc3BNZkFlK3lFZ3FW?=
 =?utf-8?B?M3AvWUt2Y2dwclU5RkViTWF4YS85RGM5UWxvRXI0cnlha1F0QUhJNmVJUTJh?=
 =?utf-8?B?ZWJNNWEzTUtUK0kwNGV1UDYyZ29ZczZkc1dEQjI4ZkZ1QjlWbVVwRStDR2cy?=
 =?utf-8?B?QS91ZzFWemdoYVlXcGNFOXFJZThlQlNvNXkzWFpQanAxOUsvd243SG9vN09W?=
 =?utf-8?B?dUtEVDk5Q2hNVWRYNjFFUkQwd3QyMWd0dW0zK2ZpYmlxVENlTzh2UC9vNEZW?=
 =?utf-8?B?ZHVzRERoN0VTb1NKdnp3Qjc2aHp3blNHNHRWeUxzVXVJWTlZR29RVW9sZVdp?=
 =?utf-8?B?ZUdUYU9QZUVLakw3WkNKdERKVndEdWVMNk1heDhZMGdZSmIyMmlFV3ZPSTlv?=
 =?utf-8?B?UjVzdFFEUWwwYmVaRlA2Z244MHU5b3NyREJhR1V6aGRzQ05rcEVJRlJBL3VS?=
 =?utf-8?B?S1VBN3M2NzN2clJ0bEdLWWFVTkhYcnhNRjQ5R2d0Q29KSUVtUkpFeE9BWkJV?=
 =?utf-8?B?Ylg1L1Y1SkdrWVdTVEJFamNXNEdtb3BGYTVaR1RORVA4dHpFdmxQNjdoYUk2?=
 =?utf-8?B?amlDZFVLV0kza2xPdnpkN08rTVdmT1Z5aWNUR05oNG9YTnBvVXJRVEdCcjBI?=
 =?utf-8?B?eE1kbXFTR3cxTXRKbGRjYmdGL2lESERPNktDNWpFYXM4dU9aK1F4Nmxha3l1?=
 =?utf-8?B?L1p4SDZwdEo4YmZmV0hSNFpkYVJIN1NvVjV1NWJReHI0WEUxWEdWWEx2dysw?=
 =?utf-8?B?ZU5PUHNyRXQzLzNUeXQ4eVErbURKMDN1V2RVWS9zeVgyQUlNdVNWdHpJaml1?=
 =?utf-8?B?SGJITUZKMWtlUFhzd0c5bS96MFBkRy9JYk5XWGp5Q3cwVWRnbmJwY0N0cG9o?=
 =?utf-8?B?eUY1YUIzZzZWT3VyeGpJZzhMRTFRWFZuMlpZeXNXU01DYmU3L0hGM1UzSFoz?=
 =?utf-8?B?MzFzeHBDQVp2SW45UjZCeitvR1J0NVpBWEZLZEpONW9SK1lkdzkvTklNRE8y?=
 =?utf-8?B?bEROTHdlL3dFOEFrUXRTaThqODYweFRReFYrVTA3bUFHRC9KYlFKYWdKZFQx?=
 =?utf-8?B?eWJtaUN4aVkrbVF5RHZGQm9qa05jK1dWRFA3ei82NytSUFNhSjdrNTM5YzdE?=
 =?utf-8?B?YXpHYnU1a1gyekxwNVB3Y2JQOVB1eEQ5VEdORm00Lzl3ZDZyVG5UekRYMTZr?=
 =?utf-8?B?RnRFVy9Qa2hYZ3ZuaFJMU1ZZTW83K3JycjR0MkV0VFpFUUk4aE0xZDNiNEl2?=
 =?utf-8?B?NG53RDJzdkdzeGFCeGljMitWV1dUczFTU0RWS1ZXMXJ1UDVqVnhKRU82NXU2?=
 =?utf-8?Q?+3LqwNTEERpxgylyBJiV0f44b?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E376C6ABDC8C3F4C8DA5589C0C102C7E@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea887e4-6b5c-4a8d-665f-08db1f940e3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 05:14:55.6892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TTAuzo0jz2bZycrGjI9cGAAZrJyD0jTWN/Q8XWv363TArLaOjzGnwfLbNPAYiOUrHS+l/yte6D0RL8dit0ZfoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB5458
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
Cc: "dakr@redhat.com" <dakr@redhat.com>,
 "arunpravin.paneerselvam@amd.com" <arunpravin.paneerselvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAyLTI4IGF0IDA5OjM0ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBWTVdHRlggaXMgdGhlIG9ubHkgcmVtYWluaW5nIHVzZXIgb2YgdGhpcyBhbmQgc2hvdWxk
IHByb2JhYmx5IG1vdmVkIG92ZXINCj4gdG8gZHJtX2V4ZWMgd2hlbiBpdCBzdGFydHMgdXNpbmcg
R0VNIGFzIHdlbGwuDQoNCklzIHRoaXMgYmVjYXVzZSB2bXdnZnggcGlnZ3liYWNrcyBidWZmZXIt
aWQgcmVsb2NhdGlvbnMgb24gdG9wIG9mIHR0bSB2YWxpZGF0aW9ucyBvcg0KZGlkIHlvdSBqdXN0
IGZpbmQgaXQgdG9vIGhhcmQgdG8gcG9ydCBpdCBvdmVyPyBJJ2QgcHJlZmVyIHRvIGF2b2lkIHR0
bSBtb3ZlcyB0bw0Kdm13Z2Z4IGFuZCBhdCBsZWFzdCBoYXZlIGEgY2xlYXIgaWRlYSBvZiB3aGF0
IHdlIG5lZWQgdG8gZG8gdG8gcG9ydC4NCg0Keg0K
