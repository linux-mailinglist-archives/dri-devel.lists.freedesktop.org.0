Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF336FE4A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 18:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE5B6F562;
	Fri, 30 Apr 2021 16:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BC66F55C;
 Fri, 30 Apr 2021 16:11:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imEHx81Vh2V48KsA9UZ4vFcY4cRycd6EOWVP6ubze59HqKY4fnmg0uzrRbzqQCQ2Qy04gcsdLI6vhVV+JeN7HMP6G+bm0hEsMosHBmemGASyn+F4iXwbvUvV23DlUPP9sLfYKkFPhCfzQdeX7vhUAZ49ET8+GLni0bYrK+LJorVtC1NFkRrV5e+D6H6npw+pZyY6PAls07Y6JiwEAbKuB4W/YKPR/3I9VdJkTrI4gaLomhMbws2dSrBx8eagX/cT6hRIPr6aXVy3pBz1hj7iAODeUZ5imMHSheDMnwpcAp2n1NAsqZf/jAU2YJo29POuiRdjOoW5mWdRpKqF8dDU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeG/S8C2nbztHwYZfZ0eWBMLcqrBY9UsOCfrthgI5rQ=;
 b=JRlHvxjgONJxqt7A0gcNBTRE5i80k2y9TneUbxaLohCw0RYTI+nRNDwdrASlSPJys3As5gK75NzFEukQlvwSofJCUdgHYiwm5OnCmlAGJxDkJ8BvtJQVbmYvWjYk9YTXWBXXBXoLX8j30jim70h8+ZUj1DXUz/lvmI94qf9EZVqsgasmXTa01K0vLp6sEoKPM18SpuTNa68y8Bt2yWjWJFMLuG3XGlbegRd3RKU3NLJvDGFebw58vCe5XuT3An+Dm6g+ioV3oITQA4Hk2+cagsFDPwdY+0ld9ntJy6+5I/9BnXCXdxvCM5X1VfMeAt1i8PC4wNfiF7/wuHR8gwbCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeG/S8C2nbztHwYZfZ0eWBMLcqrBY9UsOCfrthgI5rQ=;
 b=b9dDPmScTXNkHwWipZJYUJC1uu7EUkLzHF1/Xdt3dNsNQ/yB4CaOQdU0bMfFdb2+LBdLdYSH5bCbFkAx1TpG5gpWqoFLAFI3qQ6APkP5wveiwkQzvcSgDvX55lVIQLG3dkLYgD70fS5kdtwjcj6nSnUqtKByBGXNyF1nrdcrFvU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2815.namprd12.prod.outlook.com (2603:10b6:805:78::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 30 Apr
 2021 16:11:00 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.033; Fri, 30 Apr 2021
 16:11:00 +0000
Subject: Re: [PATCH v5 15/27] drm/scheduler: Fix hang when sched_entity
 released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-16-andrey.grodzovsky@amd.com>
 <a8314d77-578f-e0df-5c49-77d5f10c76c7@amd.com>
 <9cb771f2-d52f-f14e-f3d4-b9488b353ae3@amd.com>
 <0c598888-d7d4-451a-3d4a-01c46ddda397@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <a704880d-8e27-3cca-f42b-1320d39ac503@amd.com>
Date: Fri, 30 Apr 2021 12:10:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <0c598888-d7d4-451a-3d4a-01c46ddda397@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:28bc:ce08:83b6:6c00]
X-ClientProxiedBy: YT2PR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::27) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:28bc:ce08:83b6:6c00]
 (2607:fea8:3edf:49b0:28bc:ce08:83b6:6c00) by
 YT2PR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Fri, 30 Apr 2021 16:10:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d117d2b5-72ab-47ab-26f7-08d90bf28b45
X-MS-TrafficTypeDiagnostic: SN6PR12MB2815:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2815664446CAACD9330BB40CEA5E9@SN6PR12MB2815.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKiSQVLfbNd33BQ5yezNENgUrx9g1aEMotH2/GL0RSCnpo4I/t2F0VhuU+HO/743cmzd4H20ngpnyjz80MfgClmhk5udVG5gkkbf8bDYVuugAbwwJ9R9gan8sdrDVOuZZUDG4u0RD9wH9CelS/vcHort7c6T7qzdiE7FviRcgQwsJ7dM6FfRPt2gafxDs8AUkKWXsh7P10fTJ+W7KKaJtGDiSElAMgVY0KO+U8ffojvlkvQ7yBudq5vgK+oulAtgZkIwD51ZmECu98XCFHomwjw8d3vxObcN8H5EWS8ayrtRsR4Vl+jr3mVcuwF49F3E30bpBnu11x3v8w/nfJNsdiJwfaZRP9DPBnzxz1DCXIDG8eFNqL2KUT4xMWfHUjSsXC8NoR8k+g32n8xc68xs7focSk2CtEYB99NrhoS9+zQ1yI8u0QN8JlDynMhFz7yUoRGXaZL0eqfj3BDB5WIijuvUufq0z6b0HVwe0uG9Jr5pI03qqZ5D87QOmqM8JmNia+Fomc2fuTGnn77VyTBlnsQqWpEECZNYy5+07l1N0MrlRKckPN7Dbrzt00vBgbLPXVkhwcZGODJ/rQ8Mtj60U9oY9az64A6ConR+ihDlT1F7+xeSGe2dx+LjCvjabx9S6y200fP7YX9eNN9keysvyTgVvnxtZTipMps/tnx/GeoaCCgCo1LGIrqo1EBQaooP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(66476007)(8676002)(66946007)(66574015)(66556008)(38100700002)(110136005)(31686004)(478600001)(53546011)(316002)(6486002)(36756003)(4326008)(86362001)(16526019)(186003)(52116002)(5660300002)(8936002)(83380400001)(6636002)(44832011)(2906002)(31696002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEZmVHk4MXVvMkVjUSthREUyYXNkVGtjV1hMbDlaYzQ4OG40L3BxUVJuNW04?=
 =?utf-8?B?ejFjeGNpUG43WWZpdVNUZ2xFMXBEN3RQWlIzQU5hWi9pL0Y2cVNEeXBNbDdr?=
 =?utf-8?B?b1E4TXhVSDV5bzBvTVpnaGNxWkhnTkswak5hcnpQMW8vcmkxZTgrUjBBTmQ1?=
 =?utf-8?B?V2RqcXBBWndjNVNWS3hPZWhWV3NJUUx3ZXI2VGtVc05PWERTWjVjY1hUZEo1?=
 =?utf-8?B?SU5mT2diaFRYOGM3L0x0a1cwNWQvU2xGdDcySEY4V01xZjJleUkwbDNvejR1?=
 =?utf-8?B?S0JqVG55RUx2eXZDVXR2M21nVlVObS9nNVNnNUdPbmtjMnlnenJoQUFJY0Q1?=
 =?utf-8?B?UktjOHlrVE02MmZhTnBBSFU0YUZRMjVwMHM2L24yZ2NrNi9DNTJMUndRODZz?=
 =?utf-8?B?Rk1Fb1RKMXVQcnFSaXFoRzQ2eFg0cXlzZVBhdi9TUlJSR01rWEFhZllIYmhY?=
 =?utf-8?B?U1BoeDgyOGY3Y3hCNWVCS2l3WFNNWkFvZDl5bjlRQU9JWTBDcHo5SmhKYUI0?=
 =?utf-8?B?dkdIUUk2YTRXcXlWUGF6cTJEQ243M2ZqeDBMM3NQNnU2UlRjMjN4c202U0tv?=
 =?utf-8?B?QUM2MFh5WVkvT2wreUYvQ2JIZmVJRWRHdnZhQlFUMkMxMGJWUTlJT1Y3QUNZ?=
 =?utf-8?B?NW0yVHBNOWw1Q1c3U1hrVEpRRG1RVnlTMGpGS3ZkL2hiWFFTR3dSVklocHI5?=
 =?utf-8?B?di9WUmpBQXJPMHRHRzBPRkh1N3BHQWtaRXlwWVlpejFYQXBScmx1VitOY2R5?=
 =?utf-8?B?Tk1ONkJOdkJZRUNPK25YUVkzTU9FUW1jVSsxL2dLb0JRYXJYY1VnYUR0c2FK?=
 =?utf-8?B?ODFieWRKZ0FhZjN4aEs4OG81a2hMUXgvMGZ0Ymd0NUl0cDliNnNGK0NvL25L?=
 =?utf-8?B?bGg4cUx0a1l4eDZBemc3Wmc0NE94QlQ3bDBkdkViRy9YNjlQWU1kKzY1UVc2?=
 =?utf-8?B?MmEveGlGOVc5K01uV1c0aisxSTZseG1JUXhYUVBpWHpGNkt2K0t3aGJVUjlH?=
 =?utf-8?B?U1Q5bmZjVEFWcmJPald4ZWVtNSt0R2ErZ3Q5ZXMzczVSa1lLTzRORDlDdUhG?=
 =?utf-8?B?SGJKN3FJSDYxQkxMQWwvOW40WjhzZDBxOUpXWEVQNFkvd1EwYklISmFLQjNs?=
 =?utf-8?B?VTVqY1NzYjNGMVl5dDhMaDVVRGFDKzJxVUtRcEpLTStJeVBReW1HTXoreFg2?=
 =?utf-8?B?bTVKaGNObGtneVF5ZGRKVTg5YnNjNU9lSlJxNVVkcGRLOUZCZkZwbVM0dWhO?=
 =?utf-8?B?YXRJOHlicmpIdFIxMHdiVVdHRDJTYmFoRG44aGQ0ZmdPMEFLWmdMVWRtVTBO?=
 =?utf-8?B?RVNjdnFZRmUxdHE3MDBTMWEvVnJTYW84ZzA4bUpQM3BZZEFmdUlQM0hJQll6?=
 =?utf-8?B?RlJseHlBU3RVZVhhSmJjYitmWlBwLzQ4aGxBTUdxZmxkSUtHbHppWUZEYm1w?=
 =?utf-8?B?Q3JTOGoyWTQzWWpraWYzTG9qR0xwV25NZlpWd2RBZ2hqWVNZRmdDRkxqM0Ev?=
 =?utf-8?B?enU4UENCeTlvZXlobXFjeGpiWC84djhOUWZhSG9BREZpU2F1ZkZ1aXNoV1hK?=
 =?utf-8?B?aFcrdUEvV29uY3pmZVo2alNCRDJ1YVBWYjNsczR2QzJJazhKdDF4aGZaaHZD?=
 =?utf-8?B?Ukh6eUd1S05BbXh0WGx5R1Ztb0t1emJvU1hYV1loUm93R2FLWnVkNDh2VnV4?=
 =?utf-8?B?Z2dKcjRzdEFBbFp4cTBsUVI5K1JDOHdvQ2R5aVJTZHFieGFnMnRjczROQnpG?=
 =?utf-8?B?WUIrRlpBUlY1TDd1ZWhaSmpqUGRLVFBHNEh4anZZRTIyeTJPY3pEZ0JCQWQz?=
 =?utf-8?B?ZWszMk5qbVpjOEgranZIL0ZmMXNSTnpZSWtrLy9nU3NjcXh4MjJicHN2c2xy?=
 =?utf-8?Q?+1OzJIBVv8X91?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d117d2b5-72ab-47ab-26f7-08d90bf28b45
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 16:10:59.9100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqq1363qkyYf1wr7aRUhGSVqLGLy/eJafNsi/EnnvLbhzKswtsGObASrN5yLAgZFTmANBpY7Ci9FPnclHsCfsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2815
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLTA0LTMwIDI6NDcgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiAKPiAK
PiBBbSAyOS4wNC4yMSB1bSAxOTowNiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pgo+Pgo+
PiBPbiAyMDIxLTA0LTI5IDM6MTggYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEkg
bmVlZCB0byB0YWtlIGFub3RoZXIgbG9vayBhdCB0aGlzIHBhcnQgd2hlbiBJIGRvbid0IGhhdmUg
YSBtYXNzaXZlIAo+Pj4gaGVhZGFjaGUgYW55IG1vcmUuCj4+Pgo+Pj4gTWF5YmUgc3BsaXQgdGhl
IHBhdGNoIHNldCB1cCBpbnRvIGRpZmZlcmVudCBwYXJ0cywgc29tZXRoaW5nIGxpa2U6Cj4+PiAx
LiBBZGRpbmcgZ2VuZXJhbCBpbmZyYXN0cnVjdHVyZS4KPj4+IDIuIE1ha2luZyBzdXJlIGFsbCBt
ZW1vcnkgaXMgdW5wb2xhdGVkLgo+Pj4gMy4gSm9iIGFuZCBmZW5jZSBoYW5kbGluZwo+Pgo+PiBJ
IGFtIG5vdCBzdXJlIHlvdSBtZWFuIHRoaXMgcGF0Y2ggaGVyZSwgbWF5YmUgYW5vdGhlciBvbmUg
Pwo+PiBBbHNvIG5vdGUgeW91IGFscmVhZHkgUkJlZCBpdC4KPiAKPiBObyB3aGF0IEkgbWVhbnQg
d2FzIHRvIHNlbmQgb3V0IHRoZSBwYXRjaGVzIGJlZm9yZSB0aGlzIG9uZSBhcyAjMSBhbmQgIzIu
Cj4gCj4gVGhhdCBpcyB0aGUgZWFzaWVyIHN0dWZmIHdoaWNoIGNhbiBlYXNpbHkgZ28gaW50byB0
aGUgZHJtLW1pc2MtbmV4dCBvciAKPiBhbWQtc3RhZ2luZy1kcm0tbmV4dCBicmFuY2guCj4gCj4g
VGhlIHNjaGVkdWxlciBzdHVmZiBjZXJ0YWlubHkgbmVlZCB0byBnbyBpbnRvIGRybS1taXNjLW5l
eHQuCj4gCj4gQ2hyaXN0aWFuLgoKR290IHlvdS4gSSBhbSBmaW5lIHdpdGggaXQuIFdoYXQgd2Ug
aGF2ZSBoZXJlIGlzIGEgd29ya2luZyBob3QtdW5wbHVnCmNvZGUgYnV0LCBvbmUgd2l0aCBwb3Rl
bnRpYWwgdXNlIGFmdGVyIGZyZWUgTU1JTyByYW5nZXMgZnJwb20gdGhlIHpvbWJpZQpkZXZpY2Uu
IFRoZSBmb2xsb3d1cCBwYXRjaGVzIGFmdGVyIHRoaXMgcGF0Y2ggYXJlIGFsbCBhYm91dCBwcmV2
ZW50aW5nCnRoaXMgYW5kIHNvIHRoZSBwYXRjaC1zZXQgdXAgdW50aWwgdGhpcyBwYXRjaCBpbmNs
dWRpbmcsIGlzIGZ1bmN0aW9uYWwKb24gaXQncyBvd24uIFdoaWxlIGl0J3MgbmVjZXNzYXJ5IHRv
IHNvbHZlIHRoZSBhYm92ZSBpc3N1ZSwgaXQncyBoYXMKY29tcGxpY2F0aW9ucyBhcyBjYW4gYmUg
c2VlbiBmcm9tIHRoZSBkaXNjdXNzaW9uIHdpdGggRGFuaWVsIG9uIGxhdGVyCnBhdGNoIGluIHRo
aXMgc2VyaWVzLiBTdGlsbCwgaW4gbXkgb3BpbmlvbiBpdCdzIGJldHRlciB0byByb2xsb3V0IHNv
bWUKaW5pdGlhbCBzdXBwb3J0IHRvIGhvdC11bnBsdWcgd2l0aG91dCB1c2UgYWZ0ZXIgZnJlZSBw
cm90ZWN0aW9uIHRoZW4KaGF2aW5nIG5vIHN1cHBvcnQgZm9yIGhvdC11bnBsdWcgYXQgYWxsLiBJ
dCB3aWxsIGFsc28gbWFrZSB0aGUgbWVyZ2UKd29yayBlYXNpZXIgYXMgSSBuZWVkIHRvIGNvbnN0
YW50bHkgcmViYXNlIHRoZSBwYXRjaGVzIG9uIHRvcCBsYXRlc3QKa2VybmVsIGFuZCBzb2x2ZSBu
ZXcgcmVncmVzc2lvbnMuCgpEYW5pZWwgLSBnaXZlbiB0aGUgYXJndW1lbnRzIGFib3ZlIGNhbiB5
b3Ugc291bmQgeW91ciBvcGluaW9uIG9uIHRoaXMKYXBwcm9hY2ggPwoKQW5kcmV5Cj4gCj4+Cj4+
IEFuZHJleQo+Pgo+Pj4KPj4+IENocmlzdGlhbi4KPj4+Cj4+PiBBbSAyOC4wNC4yMSB1bSAxNzox
MSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+IFByb2JsZW06IElmIHNjaGVkdWxlciBp
cyBhbHJlYWR5IHN0b3BwZWQgYnkgdGhlIHRpbWUgc2NoZWRfZW50aXR5Cj4+Pj4gaXMgcmVsZWFz
ZWQgYW5kIGVudGl0eSdzIGpvYl9xdWV1ZSBub3QgZW1wdHkgSSBlbmNvdW50cmVkCj4+Pj4gYSBo
YW5nIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2guIFRoaXMgaXMgYmVjYXVzZSAKPj4+PiBkcm1f
c2NoZWRfZW50aXR5X2lzX2lkbGUKPj4+PiBuZXZlciBiZWNvbWVzIGZhbHNlLgo+Pj4+Cj4+Pj4g
Rml4OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRhY2ggYWxsIHNjaGVkX2VudGl0aWVzIGZyb20gdGhl
Cj4+Pj4gc2NoZWR1bGVyJ3MgcnVuIHF1ZXVlcy4gVGhpcyB3aWxsIHNhdGlzZnkgZHJtX3NjaGVk
X2VudGl0eV9pc19pZGxlLgo+Pj4+IEFsc28gd2FrZXVwIGFsbCB0aG9zZSBwcm9jZXNzZXMgc3R1
Y2sgaW4gc2NoZWRfZW50aXR5IGZsdXNoaW5nCj4+Pj4gYXMgdGhlIHNjaGVkdWxlciBtYWluIHRo
cmVhZCB3aGljaCB3YWtlcyB0aGVtIHVwIGlzIHN0b3BwZWQgYnkgbm93Lgo+Pj4+Cj4+Pj4gdjI6
Cj4+Pj4gUmV2ZXJzZSBvcmRlciBvZiBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSBhbmQgbWFy
a2luZwo+Pj4+IHNfZW50aXR5IGFzIHN0b3BwZWQgdG8gcHJldmVudCByZWluc2VyaW9uIGJhY2sg
dG8gcnEgZHVlCj4+Pj4gdG8gcmFjZS4KPj4+Pgo+Pj4+IHYzOgo+Pj4+IERyb3AgZHJtX3NjaGVk
X3JxX3JlbW92ZV9lbnRpdHksIG9ubHkgbW9kaWZ5IGVudGl0eS0+c3RvcHBlZAo+Pj4+IGFuZCBj
aGVjayBmb3IgaXQgaW4gZHJtX3NjaGVkX2VudGl0eV9pc19pZGxlCj4+Pj4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+
PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+Pj4+IC0tLQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5
LmMgfMKgIDMgKystCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWlu
LmPCoMKgIHwgMjQgCj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gwqAgMiBmaWxl
cyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyAKPj4+PiBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKPj4+PiBpbmRleCBmMDc5
MGU5NDcxZDEuLmNiNThmNjkyZGFkOSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9lbnRpdHkuYwo+Pj4+IEBAIC0xMTYsNyArMTE2LDggQEAgc3RhdGljIGJvb2wg
ZHJtX3NjaGVkX2VudGl0eV9pc19pZGxlKHN0cnVjdCAKPj4+PiBkcm1fc2NoZWRfZW50aXR5ICpl
bnRpdHkpCj4+Pj4gwqDCoMKgwqDCoCBybWIoKTsgLyogZm9yIGxpc3RfZW1wdHkgdG8gd29yayB3
aXRob3V0IGxvY2sgKi8KPj4+PiDCoMKgwqDCoMKgIGlmIChsaXN0X2VtcHR5KCZlbnRpdHktPmxp
c3QpIHx8Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9i
X3F1ZXVlKSA9PSAwKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcHNjX3F1ZXVlX2NvdW50KCZlbnRp
dHktPmpvYl9xdWV1ZSkgPT0gMCB8fAo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBlbnRpdHktPnN0b3Bw
ZWQpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+Pj4+IMKgwqDCoMKgwqAg
cmV0dXJuIGZhbHNlOwo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYyAKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jCj4+Pj4gaW5kZXggOTA4YjBiNTYwMzJkLi5iYTA4NzM1NGQwYTggMTAwNjQ0Cj4+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+IEBAIC04OTcsOSArODk3LDMz
IEBAIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2luaXQpOwo+Pj4+IMKgwqAgKi8KPj4+PiDCoCB2
b2lkIGRybV9zY2hlZF9maW5pKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCj4+Pj4g
wqAgewo+Pj4+ICvCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKnNfZW50aXR5Owo+Pj4+
ICvCoMKgwqAgaW50IGk7Cj4+Pj4gKwo+Pj4+IMKgwqDCoMKgwqAgaWYgKHNjaGVkLT50aHJlYWQp
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGt0aHJlYWRfc3RvcChzY2hlZC0+dGhyZWFkKTsKPj4+
PiArwqDCoMKgIGZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCAtIDE7IGkgPj0gCj4+
Pj4gRFJNX1NDSEVEX1BSSU9SSVRZX01JTjsgaS0tKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkcm1fc2NoZWRfcnEgKnJxID0gJnNjaGVkLT5zY2hlZF9ycVtpXTsKPj4+PiArCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGlmICghcnEpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29u
dGludWU7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJnJxLT5sb2NrKTsK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeShzX2VudGl0eSwgJnJxLT5l
bnRpdGllcywgbGlzdCkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBQcmV2ZW50cyByZWluc2VydGlvbiBhbmQgbWFya3Mgam9i
X3F1ZXVlIGFzIGlkbGUsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGl0IHdpbGwg
cmVtb3ZlZCBmcm9tIHJxIGluIGRybV9zY2hlZF9lbnRpdHlfZmluaQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBldmVudHVhbGx5Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNfZW50aXR5LT5zdG9wcGVkID0gdHJ1
ZTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPj4+PiArCj4+
Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyogV2FrZXVwIGV2ZXJ5b25lIHN0dWNr
IGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2ggZm9yIHRoaXMgCj4+Pj4gc2NoZWR1bGVyICovCj4+
Pj4gK8KgwqDCoCB3YWtlX3VwX2FsbCgmc2NoZWQtPmpvYl9zY2hlZHVsZWQpOwo+Pj4+ICsKPj4+
PiDCoMKgwqDCoMKgIC8qIENvbmZpcm0gbm8gd29yayBsZWZ0IGJlaGluZCBhY2Nlc3NpbmcgZGV2
aWNlIHN0cnVjdHVyZXMgKi8KPj4+PiDCoMKgwqDCoMKgIGNhbmNlbF9kZWxheWVkX3dvcmtfc3lu
Yygmc2NoZWQtPndvcmtfdGRyKTsKPj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
