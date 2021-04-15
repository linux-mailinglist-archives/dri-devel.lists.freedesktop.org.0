Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3FD360BCB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 16:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB346EA5E;
	Thu, 15 Apr 2021 14:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A456EA5B;
 Thu, 15 Apr 2021 14:29:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBHNftiu/gk5STjsLxan0jM0p/PVHvYGU2zVh/lCvfI4XfGt+oawGzSVyAtUvNXA+iLH5lKN18jMdex8H5oQivZt1vUYXr/6oVEnFYdvLXo9XT2LQzFWrca1t5r8HbFyrgOcmz44FxpfhCdyi3MUYdkTJvCEX3qo5mUaxWt513CfsO/T8787OnNMt0rL0+DQmeUWl6cPdYYSvXi8fCkIo+fRYVILUh/Mq3rqTAjIDK3HeYFGXVhgsHrqreMR9DODt1oijJVu6tZnDFw98N08OvF1UTkMNKkyj26qe3NbCZzzlcDoPVGcABOIjqrdfEdvzHNdpNdmgbpLRze4yfvQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDQE7RbXrRsJX6uGrYcTknG6I1rLFb+OORYGx1NR0Og=;
 b=AtDcTnFWvE5ouWZhWr+2So64d+alkj+ceq23Q0Qm9JEIWjmzU6+xlM/s3CNHsS7+QwYnh5ITP4gewTZGLvyTBENCxm+7FNpTgNl5Y62MNS/tNHwv6KJbyw9YNzafysynhwSqMPuKDVlqAMU97eSCSY2lIR13FXuPRUQAagppwFaAfFAjTwT7c8nVOqznrKvDyIJQ6me3Yvdi71y8KcJR5paEZGaQQjpoiDn6LoArip8aFGtJGhGWFUGEm6NkZPkmW+rYBB8nuP1bvhuWiETcse6KXhwzMkbLxXRldigj8pIlhqt5lIuIWa7bqyE0U2p85R3UFDfdKS+Fh+Gea16tKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDQE7RbXrRsJX6uGrYcTknG6I1rLFb+OORYGx1NR0Og=;
 b=YPlDmxdD8rBlH6xweUX0c8a529C/0S1hgvP6irKS3c3N9eIrPoAOefMc8sW5fM5VRu9gHzN4bVTtUWjPqhbmQYFv//iZUjO+q/CpzNEj6AZlGs6AOmcWAB9WUmrOvVUB/cyl429yNTdW1pPSMdNHK7HhBgkHRjQHlNmeMPGxwm8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3680.namprd12.prod.outlook.com (2603:10b6:208:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 14:29:39 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 14:29:39 +0000
Subject: Re: [PATCH 9/9] drm/amdgpu: Lock the attached dmabuf in unpopulate
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
 <20210414064621.29273-10-Felix.Kuehling@amd.com>
 <517032d9-1a37-ed7b-1443-9f5148e2f457@amd.com>
 <bf7a332a-b696-dc49-efa8-2fec477e3bbd@amd.com>
 <01c6a6ab-1301-dac5-70d4-74d5dbbcb67a@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <39f18b99-0ec2-c4e0-14ee-3be539d9566d@amd.com>
Date: Thu, 15 Apr 2021 10:29:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <01c6a6ab-1301-dac5-70d4-74d5dbbcb67a@amd.com>
Content-Language: en-US
X-Originating-IP: [142.182.180.233]
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.180.233) by
 YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Thu, 15 Apr 2021 14:29:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c042b44a-3332-4cf3-7422-08d9001ae6a3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3680790ED7B5546F9B2D9C10924D9@MN2PR12MB3680.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uazil/MEGyBAzeSfpBtG43A1croQho1uhWWTDqovDcMQA/FIk6v5kS8S4jQvBY6cabEmbPez3UZtD5VQfaTKO2p+N1MSOfPLTBcR3kD8reKN88HIRdsYw6etjH1mbbpArkLBoGSrXdYJ5U6Cka58xhAOiFk6kukYkCGSh5Nd2aH2ARtzsizGrNDgZDDSU7OfRyOIYfxOLGy3uGJGoNvQu4dDk0wJF5NnjDj3SQGzE0HQtSqtG3uRQzmW9dQhGA37/oJM9X9NeukGuNhsTUOR0/EAxliP0XCbvXYTig9XhkLlJAwTVcrsCJXq8oXXCLpq2jPUoD7e06in6cRgjHUJjUtF4gd6nCniRbHwkCWoo13wDnAgIlh0y2W5z1w1BwQxVA+COcJOOAR89lMZNMi1pAXPK8oMfyQpGFbGQN8MtmlYFHKncBw0aB/6WnG6+l83MU/QAzkfO7YmBzoaaSimX9PxDWQhMD2WLVKdJOsB4GyndgjSvVN3PRo1A9Xf0jH1bmgbITcMhTzTvwZ7rl5DYcK1VISe+xWfXK5fQsmwavSrcupmBKqzl60VtLg3kCCB23AlMvV+cZP5za5ew45CUvccJKoLvvaLrN+l4jxGGExlF3GBQpLEQpDPqUK6NLXjWFSPglF9TGTY6ADtFvxQ78o1uknFKxF+ApbW3XQFbfR8Lz25tdPkGy2ux6SGDT34
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(83380400001)(66946007)(31686004)(2906002)(186003)(316002)(16576012)(16526019)(66574015)(66556008)(8676002)(26005)(38100700002)(450100002)(8936002)(66476007)(36756003)(478600001)(6486002)(5660300002)(44832011)(31696002)(86362001)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sy8rTVZab2d0TnFXdjgrZVl5cXVyTXoyNTlENytRN3NTbjJoTm1BOHRMSThV?=
 =?utf-8?B?enpTNWJNZ0gwbDkvblZXRUFNQ0k3QUVJaHVmRG16N2JzY254c0syUDdpbEZw?=
 =?utf-8?B?a2hXMjFoMXRsUHR2UkJsR0d6M1RPVy9LSjFCRDQ1eGZYeW9HOHZIVHNrQVJJ?=
 =?utf-8?B?MU8xU1Exd081OG5kOVlaSGR1UERNNDROSEVMMldxZFFHck5DKzFyMUFMbEhi?=
 =?utf-8?B?cnlEbU8yTlUrdUhhOEdUSVlYQWZlNnZPcFZXMDlnRlhxejFjbmhob0dmR1pB?=
 =?utf-8?B?aUVEaXlWUW5EcVpLSi9RQmZsdEJoeDRwbVBLbG8vWFRWcnZjcng3cDhnSURK?=
 =?utf-8?B?OWkxTk02Ym03OVd2ams1WTlHTFcxcUZFajRtV1YyZUtSbXBEeWkvS2ZpYkgz?=
 =?utf-8?B?Qk16NU9iTzkyY1F4QU44S1FJY2tPZW9FUHhscU1zcVpDajVvOE5BMUdFeVl4?=
 =?utf-8?B?dzdlY0NVVlhZVjJwU1RvQXF1VnpCdm1lMGRCWU50M3VBNUE0eUQxM1JTYTFo?=
 =?utf-8?B?c2pMd05maWQ2UDA1c0lsaUp0RHNsM2hkd1dPUExpU1hMcXRsbzk1M2Z0bmhJ?=
 =?utf-8?B?NkYyY3BtWGswQnhGb3N2NS9TOElMbERCQ1hMU2Z6c2dKeU9rMXEwT2xGcFFN?=
 =?utf-8?B?U0RXc0Z2VU91UHBWTkt2M0IwckdsT0FnYkZrZ1pMWXo0aGNaK1VaOVVmUGVH?=
 =?utf-8?B?V0dUMUFQNjEzb2YrNGNHMjI0cFpDZzJzRDhqamFmb3MzeklnOFJhU2VPWkR2?=
 =?utf-8?B?U3dqTmlYQ3FwdDkrZ1kzL3EvWjdpTnpVd0xvUHF3ZGU3UTlxTitGVDk1OXBj?=
 =?utf-8?B?bEozV1FZUWsxRGdXUzlYZ0k2bmhrbDM4dHRKMXd5b2RuZDQ4YzlhWGtrcGd2?=
 =?utf-8?B?VTJBc0JvWkZmRDl3d1ZJU3FWWVFIeS9ZOE9COURQZjRpbGpaWjZMZ1dZdFph?=
 =?utf-8?B?WnJ0MUY1TnF5OVlVenVTZEZrc0sxK1JzcWFSYlVVUHJmUDhsQWIwYU85STUy?=
 =?utf-8?B?dGx6MzV5M3RIenZCWElqT2Q4ODlwS1k5UC9iR3grREZGZEkxajMvTUowbHpD?=
 =?utf-8?B?U0dUa01jQUs4a3hzeXNidGc5Vi9mUld6SnBPaTc0YjVhR2tPdVpncHV0Q0hl?=
 =?utf-8?B?WWxUbXNWUCtBd0VaRlBTZWsvTUxPaVcyNDNld2RGUVh0Q1plN25Xb2doUlB3?=
 =?utf-8?B?N2pRc1NNVitvRjFDdWNjSTZOYTlIVWM4Z1drd0JnWVByYTFNVDAvZXB2RFE5?=
 =?utf-8?B?RDR6a1FWWTduSWFLam5XUHlxbXQrczNhekxLcHRLL0Rpc2t4RXFzU0dWT3Iw?=
 =?utf-8?B?UmlwSmQ4aTdxNUtRajlGaEZSemtxMm5BUmNFOVg3Z0p4UTFSdHBIeUhxelBQ?=
 =?utf-8?B?YlFySDh0cW9hc2syZzh6NE9yQVBIelhJQ2xRL2lab2w0Q2dFQzY2MFZ4dDRF?=
 =?utf-8?B?WlBZY3Z3WWFhZG1iSXlqNmVQMmZNdWFpV0p1bTV0ZEszOEJITEdaQWM0N2xm?=
 =?utf-8?B?Q01lU0ZEZFhMMnhkcUo1eTcvOSs3aTBEeStjUnNjdVJ5TmovcmtNcWk1U3VO?=
 =?utf-8?B?V1o2eWhpS0Z3SFFUd0dHTHhhZWs0emdrTFJFeGRyWVM5U2JGMW9pMG5McDBG?=
 =?utf-8?B?U2h3UzEzRFJ5N2JTQ0pkbGdlRncwSFd4dmxDcW9BTThYYjBGRE04eW9XSjh5?=
 =?utf-8?B?b243ckZtVGdjYTVQdGtuODNZbERzc2s3ZGdENndlUnBTS2REbjRzb3ZrR09X?=
 =?utf-8?B?Rk1kaGJqbmt3c01aL3FBTEZ2SU9OWkh2Snl5WmIzbHBTNW5sUmZiN3J2MkhC?=
 =?utf-8?B?Q2FOdzlQdFFuUFo3Vkg3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c042b44a-3332-4cf3-7422-08d9001ae6a3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 14:29:38.9880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNBsmY5jJLB0DDZIU3/UfiKQ3F7+F1XrCOBR/kBki8LW2J/XdyRoC7oF+xSaXCQYMMusbOljFDB2gNC2/99/Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3680
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0xNSB1bSAzOjQxIGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Cj4K
PiBBbSAxNC4wNC4yMSB1bSAxNzoxNSBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+PiBBbSAyMDIx
LTA0LTE0IHVtIDM6MzMgYS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+PiBBbSAxNC4w
NC4yMSB1bSAwODo0NiBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+Pj4+IGFtZGdwdV90dG1fdHRf
dW5wb3B1bGF0ZSBjYW4gYmUgY2FsbGVkIGR1cmluZyBib19kZXN0cm95LiBUaGUKPj4+PiBkbWFi
dWYtPnJlc3YKPj4+PiBtdXN0IG5vdCBiZSBoZWxkIGJ5IHRoZSBjYWxsZXIgb3IgZG1hX2J1Zl9k
ZXRhY2ggd2lsbCBkZWFkbG9jay4KPj4+PiBUaGlzIGlzCj4+Pj4gcHJvYmFibHkgbm90IHRoZSBy
aWdodCBmaXguIEkgZ2V0IGEgcmVjdXJzaXZlIGxvY2sgd2FybmluZyB3aXRoIHRoZQo+Pj4+IHJl
c2VydmF0aW9uIGhlbGQgaW4gdHRtX2JvX3JlbGVhc2UuIFNob3VsZCB1bm1hcF9hdHRhY2htZW50
IG1vdmUgdG8KPj4+PiBiYWNrZW5kX3VuYmluZCBpbnN0ZWFkPwo+Pj4gWWVzIHByb2JhYmx5LCBi
dXQgSSdtIHJlYWxseSB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIGNhbGwgdW5wb3B1bGF0ZQo+Pj4g
d2l0aG91dCBob2xkaW5nIHRoZSByZXNlcnZhdGlvbiBsb2NrLgo+PiBUaGVyZSBpcyBhbiBlcnJv
ciBoYW5kbGluZyBjb2RlIHBhdGggaW4gdHRtX3R0X3BvcHVsYXRlIHRoYXQgY2FsbHMKPj4gdW5w
b3B1bGF0ZS4KPgo+IFRoYXQgc2hvdWxkIGJlIGhhcm1sZXNzLiBGb3IgcG9wdWxhdGluZyB0aGUg
cGFnZSBhcnJheSB3ZSBuZWVkIHRoZQo+IHNhbWUgbG9jayBhcyBmb3IgdW5wb3B1bGF0aW5nIGl0
Lgo+Cj4+IEkgYmVsaWV2ZSB0aGF0IGhhcyB0byBiZSBob2xkaW5nIHRoZSByZXNlcnZhdGlvbiBs
b2NrLgo+Cj4gQ29ycmVjdCwgeWVzLgo+Cj4+IFRoZSBvdGhlciBjYXNlcyAoZGVzdHJveSBhbmQg
c3dhcG91dCkgZG8gbm90IGhvbGQgdGhlIGxvY2ssIEFJVUkuCj4KPiBUaGF0J3Mgbm90IGNvcnJl
Y3QuIFNlZSB0dG1fYm9fcmVsZWFzZSgpIGZvciBleGFtcGxlOgo+Cj4gLi4uCj4gwqDCoMKgwqDC
oMKgwqAgaWYgKCFkbWFfcmVzdl90ZXN0X3NpZ25hbGVkX3JjdShiby0+YmFzZS5yZXN2LCB0cnVl
KSB8fAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWRtYV9yZXN2X3RyeWxvY2soYm8tPmJhc2Uu
cmVzdikpIHsKPiAuLi4KPgo+IFdlIGludGVudGlvbmFsbHkgbG9jayB0aGUgcmVzZXJ2YXRpb24g
b2JqZWN0IGhlcmUgb3IgcHV0IGl0IG9uIHRoZQo+IGRlbGF5ZWQgZGVsZXRlIGxpc3QgYmVjYXVz
ZSBkcm9wcGluZyB0aGUgdHQgb2JqZWN0IHdpdGhvdXQgaG9sZGluZyB0aGUKPiBsb2NrIGlzIGls
bGVnYWwgZm9yIG11bHRpcGxlIHJlYXNvbnMuCgpJIHRoaW5rIHRoaXMgaXMgYmVjYXVzZSBJIG1h
bnVhbGx5IGluZGl2aWR1YWxpemVkIHRoZSByZXNlcnZhdGlvbiBpbgpwYXRjaCA0LiBXaXRob3V0
IHRoYXQgSSB3YXMgcnVubmluZyBpbnRvIGRpZmZlcmVudCBwcm9ibGVtcyAocHJvYmFibHkKbmVl
ZCB0byBkaWcgYSBiaXQgbW9yZSB0byB1bmRlcnN0YW5kIHdoYXQncyBoYXBwZW5pbmcgdGhlcmUp
LiBTbyB0aGUKbG9jayBoZWxkIGJ5IHJlbGVhc2UgaXMgbm90IHRoZSBzYW1lIGFzIHRoZSBsb2Nr
IG9mIHRoZSBvcmlnaW5hbCBkbWFidWYuCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4KPiBJZiB5b3Ug
cnVuIGludG8gYW4gdW5wb3B1bGF0ZSB3aGljaCBkb2Vzbid0IGhvbGQgdGhlIGxvY2sgdGhlbiBJ
Cj4gcmVhbGx5IG5lZWQgdGhhdCBiYWNrdHJhY2UgYmVjYXVzZSB3ZSBhcmUgcnVubmluZyBpbnRv
IGEgbXVjaCBsYXJnZXIKPiBidWcgaGVyZS4KPgo+IFRoYW5rcywKPiBDaHJpc3RpYW4uCj4KPgo+
Pgo+PiBSZWdhcmRzLAo+PiDCoMKgIEZlbGl4Cj4+Cj4+Cj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+
Pj4+IC0tLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
IHwgMTMgKysrKysrKysrKysrKwo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Ywo+Pj4+IGluZGV4IDkzNmIzY2ZkZGU1NS4uMjU3NzUwOTIxZWVkIDEwMDY0NAo+Pj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+Pj4+IEBAIC0xMjE2LDkgKzEyMTYs
MjIgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3R0bV90dF91bnBvcHVsYXRlKHN0cnVjdAo+Pj4+IHR0
bV9kZXZpY2UgKmJkZXYsCj4+Pj4gwqDCoCDCoMKgwqDCoMKgIGlmICh0dG0tPnNnICYmIGd0dC0+
Z29iai0+aW1wb3J0X2F0dGFjaCkgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBk
bWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgYm9vbCBsb2Nr
ZWQ7Cj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgYXR0YWNoID0gZ3R0LT5nb2JqLT5pbXBv
cnRfYXR0YWNoOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBGSVhNRTogdW5wb3B1bGF0ZSBjYW4g
YmUgY2FsbGVkIGR1cmluZyBib19kZXN0cm95Lgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogVGhl
IGRtYWJ1Zi0+cmVzdiBtdXN0IG5vdCBiZSBoZWxkIGJ5IHRoZSBjYWxsZXIgb3IKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoCAqIGRtYV9idWZfZGV0YWNoIHdpbGwgZGVhZGxvY2suIFRoaXMgaXMgcHJv
YmFibHkgbm90Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiB0aGUgcmlnaHQgZml4LiBJIGdldCBh
IHJlY3Vyc2l2ZSBsb2NrIHdhcm5pbmcgd2l0aCB0aGUKPj4+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IHJlc2VydmF0aW9uIGhlbGQgaW4gdHRtX2JvX3JlbGVhcy4uIFNob3VsZAo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgICogdW5tYXBfYXR0YWNobWVudCBtb3ZlIHRvIGJhY2tlbmRfdW5iaW5kIGluc3Rl
YWQ/Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqAgbG9ja2Vk
ID0gZG1hX3Jlc3ZfaXNfbG9ja2VkKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPj4+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKCFsb2NrZWQpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX3Jl
c3ZfbG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdiwgTlVMTCk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KGF0dGFjaCwgdHRtLT5zZywKPj4+PiBETUFf
QklESVJFQ1RJT05BTCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghbG9ja2VkKQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9yZXN2X3VubG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVz
dik7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtLT5zZyA9IE5VTEw7Cj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
