Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75670318E5F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 16:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586206EE41;
	Thu, 11 Feb 2021 15:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1A86EE36
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 15:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4Xn5IdYWQg8qM0RuCaoO+GmFaBpWn5cDlzByG2gmvWYHd+9ab4MHrT2pW3DCxLi7pIgvvuBzjeXbKIKxsd7jP0yVwPP/buwUvCR1P7AtQYPRmU0aCC+swNM6mOiKigSYUwfxVa+4f0IaWDMe8JCsryrQfVcX7sgLaYJk//N17/EcOnrcCuKnB8LaP0oyRo1zkozokGhHYRrkHoSdXNid4ybiW6wnMgCAo3giyBEFdKdeLYzF2hGBabudqAocEqD1a44u0av8MWIQR+TfmE/Di2ASro1pwZCwIHMj/4i/ab20ZZ+gwIhxe8670S3i3iSg7yXnOrLz9UzwEXzbI/9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfeKpuM6qmrAGRaCGhv46ArXElCre5YNnZpn4giCdRo=;
 b=cbV1qCNY+Slcd8tjZ7+PIhWdZ3A8luYWagPTQaF+Y3DiuDOZsMwVxx0tQvfF0t4/bN59eL7y5JLNzXSpAIcXWWO7VUwD7RVQT7MESg6lrBLP+GhR0t3Ss2pyiA/DZZyjoAecrNx6aQZivaXb4xsMOrcazn6qAAuPCmGLutYRA4ObcOrpmQ5DUz46ICQnIAbAsaMee9dT+b6ZZKVGoGMc2hGnEDLvrgw9pOfnwUh0HH9oDyxKFNujuJUWsQ4YGBBQjWnt5vpIMWxnkihzQQhaDRu5I+zobcKaRxvepq0eEFJUMI3yCDzUklcwabjnfKrvmjB2bdNA/oVaNpO40xjugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfeKpuM6qmrAGRaCGhv46ArXElCre5YNnZpn4giCdRo=;
 b=rdigxt1Np2IF31qtpLVUJfh4JVMeKVItTnH/HcJBu8EJbdtPl0K+PlvFnBQVKSwYE25idxOpiTjSo2VR29epxe460C36KTTAn2ZiatvoRohH3triM96FHLHH2Ca2gkSxRz8FAcGbqnV7ixmrGqteB5sIjeRvCC997+QNnrtmSro=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3774.namprd12.prod.outlook.com (2603:10b6:208:16a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 15:27:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 15:27:33 +0000
Subject: Re: Not 100% sure if I correctly fixed drm-tip
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
References: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
 <87o8gqd4vw.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3b20fc5a-e6ff-d1f9-a4f6-6b5c21ca94fc@amd.com>
Date: Thu, 11 Feb 2021 16:27:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87o8gqd4vw.fsf@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:128e:c59b:ac8b:316f]
X-ClientProxiedBy: AM0PR04CA0044.eurprd04.prod.outlook.com
 (2603:10a6:208:1::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:128e:c59b:ac8b:316f]
 (2a02:908:1252:fb60:128e:c59b:ac8b:316f) by
 AM0PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:208:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 15:27:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f2143739-ec5d-43f4-3934-08d8cea18d9b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3774:
X-Microsoft-Antispam-PRVS: <MN2PR12MB377460C09EF4CFE73070F3A5838C9@MN2PR12MB3774.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4RUPwLtBkiUfS/BfJvUePL27JmoPcCZR//q074/qoZYjjeZ1eZPc/ZVE4rZZJAjDpwwrSY+XnvhUbQFGQizbA2+IAcYzbM+SVqW7uBNyo5x7kMSw4mQy1qxuuiKllUbz3qQ9hr+DM6413vMzoxzgJjGUoNmK1eye5VnXer0K5fDh/58KQde2O6/5aMsurVqn5tnfS+RMjUdY1brjQT0TVQUvt/mlh4V/Cqm0mmWwJ0X+4Q/hrKX+XVwr8nhRrsBExdqIh2CqeHE4ZUSdp5fW1uPSbDQrLOFrGhvkXm4fNFABu9xazDRUux84kKNoMtrOI3KmyjdNRARasUAH8cepv9V7/oecK6CHrZhTQc6j+L6cM0820iFWRtjZgxWkXhp2eAd1o3kvoOAe5cTX30xoQlqWqxE4WoBrVygvyRsESCF3BWMPLeMExdc/YtdKrH778l6VcnKIE2ziox/XkPhiIflDbE9lj/iKu9rQiv33sAmWR9OUYPN1UOJsu+tZNqxcpgnoUO/1mkEykz2oBCm11/jz+dmQUW3XpvAH63UpPW6YtNr3v0FFaxRlZcWvU6yaFmEF/5oHsuhAZis9dGPKWVRMKmwGZw0uOIdWANRsoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(31686004)(83380400001)(31696002)(66946007)(86362001)(66574015)(478600001)(5660300002)(8676002)(66476007)(6666004)(16526019)(8936002)(186003)(6486002)(36756003)(2616005)(52116002)(110136005)(66556008)(2906002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnRqZjlQZFg0YzJMR2ttSERtT053aGtiRjhrTklIbVFWd1c1YklJTkNPaHJq?=
 =?utf-8?B?Z1lxQ0FtT1Q0ekxXVWxUdUJYaUxkd1JHWW1WV2hoMTNuK0lUcXY1WHBscXJj?=
 =?utf-8?B?Sm9YYzcwRVVkUFJodHJiNEpTSmF0WUJhMnZRQlhWbFZBWm51SHdyWmpIenly?=
 =?utf-8?B?bDFvbFpnNkJuclUySUIyc2IrdVlKZGprTWxsWG16OWhoZDgxc3huTUJuSW0w?=
 =?utf-8?B?NjJFeUwybHlUOW01YjlKc0Nna2c3b1BNVEhSdUpIc200SVZLQzdXOENVZ2Vm?=
 =?utf-8?B?R3dNdlZiRFhkL3I3Qk9NcTJobHN3bFhnc1F0MzVWaFU0ZGlZcDdIZ2UxS2U0?=
 =?utf-8?B?T2JhTVVHOExjS2FEdjNPNUdVUURaVGM0bGJLYzFkTWlGT0hrOTltZElhVDFE?=
 =?utf-8?B?SHBLbDVmZS95TDJBRjBzQ091TDUxTkRFVVErVms3SVpucDhORW5mTlZWWkJk?=
 =?utf-8?B?NTk2RThMcEtsblVSL2dkZzZPRXdlTnM5T2g3YUYwUXhBN285bmNkcERFam42?=
 =?utf-8?B?ZTlYMnRKVTJ1R3pPM2ZYbThpRHprREdLMGx1aHBLZllQc0tLNm5SeFBPTnRw?=
 =?utf-8?B?Mlg5V3BuUmtScGE0eXUyVWVPQnZTUmU5K3doOSt1VzQrM01uVjRPK2I0VGNy?=
 =?utf-8?B?UTlmREVTUGRwSm9WRzFBR28rQTVSTUZFWG5KZ05nQVcxVnhhWWZoNTJZVEl0?=
 =?utf-8?B?bmVyeE5VMDJveDVtVU1nWUdObS9uR2J0a296N2Zvc2p5NVJaZ2s1bCtXTW9K?=
 =?utf-8?B?MzdXekRBWS93a3NER2RNSStXSzZmT3lMYnhWblh6N2xKeHZzSFM2MHp5K2tV?=
 =?utf-8?B?dTl6R0U2eWNyRCtBNkRHNDM5YlVZbGplOTczL2FkaXNJeFBqRCtvbUF2dXo4?=
 =?utf-8?B?cnpzdC9qSEUzeWQ4VjUwb1cvV0tjdndpUGNzemVCcnY1b1JRNkd5UTUwYmwr?=
 =?utf-8?B?b0tHdW1WUjVSV3Q1eEY0Z2RBeDduNUJFWFptMStNUU5BSi9lNE5OeXl4d2k1?=
 =?utf-8?B?OXlkQmhhT1lWc29ydTQ0YytSQldMM1hTTmt2OFlNcWtlRTFyamw1N1IyYit3?=
 =?utf-8?B?cEVzNXhXTS9pa2VGUkpPRVVFSHhNdCs4UnlSY0M3Zk91cTd6bFdJRXNUVnJ0?=
 =?utf-8?B?eGx2dVV1TVlxNmhtcnVianZpNzh0MXlXMzhNR2lSNDRvaGhtY2RickJ1cE1P?=
 =?utf-8?B?TVcvWjNEcERpMFNRa0FIOFp3bFJoK3R0TnptOGVXaWdGNlVCNFZGQzVTbFZh?=
 =?utf-8?B?RUVwcHNRaGpITWs3L3ZkamRsRFVsbWI1bUl3RnMvcFlyUDBLb2oxSUlGY3NM?=
 =?utf-8?B?UjJHMDRwNFdEd1JJbXYvMGJBaGxja3d6SVJYUkFONmxpbVJHZ0VDNGdJeE5x?=
 =?utf-8?B?K0FGMFE5S3plRWtiWlBuSWVjZitPRS9sNFYxZjk1Nk5zRDgyRU5GMnh1MWwx?=
 =?utf-8?B?aEhYdnJYeXJSY2lERFhobGVrZzg2Z3B0N3ZwVDJUWXlNMGdsOFNDVkNDUHhY?=
 =?utf-8?B?eVJyZUVScGZ3OTFvaURRSndVb2lRUThuT09DYy9mNThJa1EycmJqclpBcVRF?=
 =?utf-8?B?eU1FVElzeTJVV0ZzaWxINm5ubnlXbGp0QVZLWjZ5ZDFZOGIzRE8zL1JQRnc4?=
 =?utf-8?B?dkNrZkJ5VjNlNkkwMmhUdDdFY0pyWFlSd2xmOG9IWURqTnNYSGl1VWxTU1V0?=
 =?utf-8?B?Nldaa1BTbmdXd2VaVWJpYklxdTNpcUhOalJKYm9IKzVXTXVMTlM2NjhnV2Ur?=
 =?utf-8?B?RWNWR0ZIM29WMWFvckY5K29LWk1EYXpIRWJWVll5WStQZGYwQlJDbUdYV2xw?=
 =?utf-8?B?OWxRZlI1dkFjTFJHM3pqUjJvQ3dqZldyN1VMSHRpekdPUDZBVWRtOHZaRkdC?=
 =?utf-8?Q?uYxf3ycQ415fB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2143739-ec5d-43f4-3934-08d8cea18d9b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 15:27:33.7129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uixWAIKXzgIM3YvtOdFi0lZA5zKVqdN4WeXMNpmbJqvr2ERT4lLClCeGF7Lk5lu+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3774
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxMS4wMi4yMSB1bSAxNjowMiBzY2hyaWViIEphbmkgTmlrdWxhOgo+IE9uIFRodSwgMTEg
RmViIDIwMjEsIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3Jv
dGU6Cj4+IEhpIGd1eXMsCj4+Cj4+IEkgaGFkIGEgY29uZmxpY3QgdGhpcyBtb3JuaW5nIGluIHRo
ZSB0dG0gcG9vbCB3aGlsZSBwdXNoaW5nIGFuIGltcG9ydGFudAo+PiBmaXggdG8gZHJtLW1pc2Mt
Zml4ZXMuCj4+Cj4+IEknbSBub3QgMTAwJSBzdXJlIGlmIEkgY29ycmVjdGx5IGZpeGVkIHVwIGRy
bS10aXAuIEhvdyBjYW4gdGhpcyBiZQo+PiBkb3VibGUgY2hlY2tlZD8gQW5kIGhvdyBjYW4gaXQg
YmUgZml4ZWQgaWYgdGhlIG1lcmdlIGhhcyBnb25lIGJhZD8KPiBJJ20gYWZyYWlkIHRoZXJlJ3Mg
YSBwcm9ibGVtOyBiYjUyY2IwZGVjOGQgKCJkcm0vdHRtOiBtYWtlIHRoZSBwb29sCj4gc2hyaW5r
ZXIgbG9jayBhIG11dGV4IikgaW4gdXBzdHJlYW0gYW5kIGRybS1taXNjLWZpeGVzIGNyZWF0ZXMg
YSBzaWxlbnQKPiBjb25mbGljdCB3aXRoIGJhMDUxOTAxZDEwZiAoImRybS90dG06IGFkZCBhIGRl
YnVnZnMgZmlsZSBmb3IgdGhlIGdsb2JhbAo+IHBhZ2UgcG9vbHMiKSBpbiBkcm0tbWlzYy1uZXh0
LCBjYXVzaW5nIHRoZSBsYXR0ZXIgdG8gdXNlCj4gc3Bpbl9sb2NrL3VubG9jayBvbiBhIG11dGV4
Lgo+Cj4gQnV0IHdoaWxlIHlvdSBoaXQgYSBjb25mbGljdCwgaXQgZG9lcyBsb29rIGxpa2UgdGhl
IGNvbmZsaWN0IGJyZWFraW5nCj4gdGhlIGJ1aWxkIGlzIHNpbGVudCwgQUZBSUNUIHRoZSBzcGlu
bG9jayBwYXJ0IGRvZXMgbm90IGNvbmZsaWN0LiBTbyBhCj4gZml4dXAgcGF0Y2ggaW4gZHJtLXJl
cmVyZSBpcyBwcm9iYWJseSBuZWVkZWQgdW50aWwgdGhlcmUgYXJlIHNvbWUKPiBiYWNrbWVyZ2Vz
LgoKV2VsbCBleGFjdGx5IHRoYXQncyB0aGUgaXNzdWUuIEkndmUgYWxyZWFkeSBoYWQgYSBmaXh1
cCBpbiBkcm0tcmVyZXJlIApmb3IgdGhpcy4KCkJ1dCB0b2RheSBJJ3ZlIHB1c2hlZCBhbm90aGVy
IGZpeCB0byBkcm0tbWlzYy1maXhlcyB3aGljaCBhbHNvIGNvbmZsaWN0cyAKd2l0aCBiYTA1MTkw
MWQxMGYgKCJkcm0vdHRtOiBhZGQgYSBkZWJ1Z2ZzIGZpbGUgZm9yIHRoZSBnbG9iYWwgcGFnZSBw
b29scyIpLgoKSSd2ZSBmaXhlZCB0aGlzIHVwIGFzIHdlbGwgYW5kIGNvbW1pdHRlZCB0aGUgc29s
dXRpb24uIEJ1dCBkaW0gdGhlbiAKY29tcGxhaW5lZCB0aGF0IHRoZSBvcmlnaW5hbCBmaXh1cCBp
cyBub3cgbm90IGFwcGxpY2FibGUgYW55IG1vcmUgKHdoaWNoIAppcyB0cnVlIGFzIGZhciBhcyBJ
IGtub3cpLgoKVGhpcyBzb21laG93IHdlbnQgYXdheSB3aGVuIEkgc2FpZCB0aGF0IGRpbSBzaG91
bGQgYXNzdW1lIHBhdGNoIApyZXZlcnNhbCwgYnV0IEknbSBub3Qgc3VyZSBpZiB0aGF0J3MgdGhl
IHJpZ2h0IHRoaW5nIHRvIGRvLgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4KPiBCUiwKPiBKYW5p
Lgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
