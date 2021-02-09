Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730813150CB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446AF6EB20;
	Tue,  9 Feb 2021 13:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4386EB20
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bO1er0PfSdHy9PSCfuMKT9ORN4SB/iQXKSTAyF/hG4DWgh9jK46OhGS4xCFGPqtrrTDLc/zke8x46wfoifDxCOPAbHApI+w2V3rdTStRIfrjC+ZZnKmTLqU3Qo7ngP+FY5F68mRPc5rbNUgdxXnpj6PddU67H/ZCrVxbnogymmojEzUqNOEjflySCOaDJWDEdIKKCP1aiqnHIDIIVd0pfPQ5gQiHQQ6e9VPcle7QrRRA01J0QkToEJWor3Nv0c+PsxSSVxqVa31rGyHo+39Jb/XR3KQhvdpYnQwACZVR9c/l9d+3lNfHyD4AUCzWg0+e4ToJ5QValvSaurOhEJ1gQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6zEN17QCwLmDElJsMnxJbGSomU+Y+zRdOp6ESqDIi4=;
 b=fxqV7bhIVukFJZ7cjU4hrGbxDEqvb3ZTkIlURKXPr10yk4qXPhxPmM44IaBWc0euFY/W5u2J99avp3RrNb6G/W+4zBvln3/P4Ym8de3015bblMvk0hC+W7e1Ndf7ZFyekU5+1wYT31oL8Gw1tBp4Js2RlUqYKC89wR/G7BKzSXp4txva44kMyMUWhKIE0Dw2078uZaBY75RVIQt0NwrdTS4JORVthSgxqUKGTp6ktq47FTk2h0HoPmY/HLgLBvCK/jpuUDb7qWZOxJCfQrRtcxmKsvJBIoy3oCtyPbXyQwkvEPsJsS8hFEq2Ut6XDstUhuSIMzm7DRuCgdy7RkwYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6zEN17QCwLmDElJsMnxJbGSomU+Y+zRdOp6ESqDIi4=;
 b=DuEurhrO9b79PUQTUcc7p5hGI35bD+wAYiT/RWAcQ/wKHtpHwvFShColZL031kr5AY8d2gg3BXgst4epx1zKFeb9ZlW9GmbRKqq+/eJXSIbmhh1j+r5QThg0d/mn33w6Z+/6shvjNP1+OUVgRwe3hcVpzEISlKBn3T7tEeRuxag=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM6PR12MB3530.namprd12.prod.outlook.com (2603:10b6:5:18a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Tue, 9 Feb
 2021 13:51:20 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::452c:77af:fea7:a633]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::452c:77af:fea7:a633%6]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 13:51:19 +0000
Subject: Re: [PATCH] drm/ttm: fix removal of bo_count sysfs file
To: dri-devel@lists.freedesktop.org
References: <20210209131756.24650-1-christian.koenig@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <b64be555-a36d-9e00-22bc-e3517473d3a5@amd.com>
Date: Tue, 9 Feb 2021 14:51:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210209131756.24650-1-christian.koenig@amd.com>
Content-Language: en-US
X-Originating-IP: [217.86.98.108]
X-ClientProxiedBy: AM9P192CA0024.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::29) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (217.86.98.108) by
 AM9P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 9 Feb 2021 13:51:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5206f93d-70c6-4cbe-b3bc-08d8cd01c74f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3530:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3530F4689612DD246EF2C9A48B8E9@DM6PR12MB3530.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1/XWfZnlpGocsLLO7g7/k4pDGpCTxbjC/wM8dS1EDxluNZInbzK+PIqdSuznCKMw2A2NJiCHYKm4KvKIUQ/yyOnFi2YP3KwEBh8Ptg+sGgvGIWq9Omj97QpWl5x3Wt5Yvc/4AEQkJzKYT/4CZbd0f8DYrq6T2VNdVskOPNZuW1PnQni4vbgKp1mFMeiSaI4UFrUzEcAzZtPQX/Xd4+tOEw2kq0IYJdrER5vTwfMGmEuyCkjLhoJYfnt85ABsSuZks0vfP+/+JF15GmXqVUIm/sZ/4Hl4nngpt5cGL1EN+JHsf70Zh+ocrVYHn/b31yODip+ZuDO/JiKV0nJ94tND+nxf2aK/Ks0ixtBrYp0w/vMughhUY1+w6/1bZ24nF8Y16/n6hTPDJODWcjshe5KVkdA23ayVDiJ5OQS0OGA2IA2PbIa9Te2/jZglq6KxrjZMr2bWJUM18R1N5MSF7IlATm7BHq6iMOXxCE2AEKVrijZrdCdAYpHplCLkz4NQuqzFggwmZsyZMXA5GWeQThYHog7wBP66LMHrwTcEjshrKKx6scHdoEIQiYQGQOS4PyCCpmdu1EEUfI1jVTU5/bqSPHcyrtDWlFjWggSniQaW8/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(956004)(2616005)(6666004)(16526019)(36756003)(6486002)(66574015)(83380400001)(186003)(478600001)(53546011)(31696002)(26005)(66946007)(66476007)(31686004)(8936002)(6916009)(8676002)(66556008)(5660300002)(316002)(52116002)(2906002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OXhtTmJuei9hcXNIV3ZVSDVSeTZWTTUzQ2lJUzNWSEUxendJSG95cmFmOUZK?=
 =?utf-8?B?ZjdTK1lubSsxQTlHMW1PMnFVb1c1WUJiRkFFakF0U0NGUVNmekZTZFpBZVNx?=
 =?utf-8?B?SExSdVZDU0FxdUJEbUVjaFJ0VTdDb3Ewelp2Y1RIVWQySVMvQ0ZNaStSaHov?=
 =?utf-8?B?WG5EU2R2VVFWaXhmeE03UXRQdnUzTXN2VWNjUDFQUlJxdVB6VGFPa0poV1NE?=
 =?utf-8?B?eWtlS0p1MktqQkhmVHhFNDFoNGtrT1FJNDFQWlNGQXI3c0I1WExqTHlnbUtY?=
 =?utf-8?B?MEhPMThpSjFQYjAxbVF5clR6aTZ3emRiaklSZitlU3g2QVkxY3dxZ3dqVi91?=
 =?utf-8?B?cTFzYmpKWnkrMHk0RkYwbWNPNlg0WVZPQzRCTUJYU0FyemhUQzU5T2k5ZlVk?=
 =?utf-8?B?anJEV3E1S0ZjeHYyMDJqK2F6c2xFZ0hBb0JDcmlndmNjMHRqMnVwUCtuMFVX?=
 =?utf-8?B?Ukh2MjVjRmdpclBKOENWS0pjSUFkVjVqeE1qQ3JRZTFrUkFveVNUQ1pWdk50?=
 =?utf-8?B?NHhyclFqQ2pJUklTNmR1YUN3T2RiNE5CSU8xQ1pzdzdvSHNaVjkzRG4rUjZR?=
 =?utf-8?B?TkFGTmlzN3ZzQTF3SWFKTmtNb0U4MmkyaW82amZ4ZjBIcnhhd2Y0RGVxbTE2?=
 =?utf-8?B?ZFpUVWRZRktmRWErQ0wxak1sZ3B0dk9YM0s2YXQwSmZOTEFMZUhLRXpCTnFS?=
 =?utf-8?B?dTFwWndXVllhQUVKUUhwbjkra1FFSlBieHRzZUgrcWtBazJQR1hVZGE4dGpM?=
 =?utf-8?B?ZWRwSjR1V25uS2J0TEJoWkNaQjFrdDJNbmVuZDBFYmJjR010dXAveXBTZ1c0?=
 =?utf-8?B?YVVIZFNMdThhWWQwTTJlSzNSVGZhSjlraUNGdWZUekpxdjlsbVNQYit2MGMy?=
 =?utf-8?B?OTRPNXMwdnRjWHQwYTNLa1cwdEpjUnc4V3oxMFBKSEdmNVY2RUJreVFseHFt?=
 =?utf-8?B?LzBCbEN1QkxjNEUyOFlMOVF6eWgrbm04UkoyY2dsdU1vTlA4QmpVUEZvL3Ns?=
 =?utf-8?B?V1c1TldneU9hekdpRkpYTEhjMmVhdXd1RmttSVNseGxmRVF0amZmeGo4SkUw?=
 =?utf-8?B?L1pqRm1TK0VVanJZZ2EraFo1N3FCbm5KUXd3SXlJajlnNW11Q3dqdmFkaCtH?=
 =?utf-8?B?djczOUhuVyswQnZVTUMxMWtiT2JXVm1LR3ovQjlXd0NuM1dTT21nck9BZ0lZ?=
 =?utf-8?B?dUJCMVBsRVJ6NWUzZDJleGI4TU9VanMrdDBYWi85NE5CR1RQOTk2bmIwL0x0?=
 =?utf-8?B?VWpEUUQzNHh1K0JQVDFzcTV2RjVRdmNoR0xrWUxiZHlQb3JJUlNxYnI4bVNH?=
 =?utf-8?B?eFZYUUVPdkhyUG9QRkZNZWxTOWJ3aDZtTlNSb1VRWTJoN2twcnBLREdCeVRw?=
 =?utf-8?B?a2tJb3VlV1B3OHA5Qy9QRmdOWkpnakZLSERoVGlaQ1h6MTFEaWdZRmZGZStL?=
 =?utf-8?B?RW54TC9aZEN6ZmdUeGpJajdqRmNHL3pRVTIzR0orVXY3UVU5eW9FNlF4Ulpt?=
 =?utf-8?B?T3hXMWJXNjZYcXNyclhGTnpNMzZKRWtFSWZCVUdWbGE0YkNtL3Z2UlhYOXVE?=
 =?utf-8?B?T2EvL3BOVHBmMVZVVDU1aGg0SG1RTjNkMUo2OGNRZkRwK2F6YnZ4dW1PaGhp?=
 =?utf-8?B?K2JoQ1Rma2hYSnVac0Q3RjZPWEtBWlVzc1FBbi9RYk0xcUhRMmRCYVhJTEs0?=
 =?utf-8?B?Q05SWWMweWFVRlRKbDBDalVKVEw2ZzF1Y1hSQzhUeFJKTUYrYkdKZDRqVEgy?=
 =?utf-8?Q?C7F45YaylEkZvw81t6hcsyA8LFqvsh3uPZlL3us?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5206f93d-70c6-4cbe-b3bc-08d8cd01c74f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 13:51:19.7574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGujTRXouj0xu9UgXj8cZbxPsqsK/aneLb0RlkR7+6KBko2nl2h361ZViGxBfNoOiQsglZmJocmf/mOB5mKRPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3530
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

UmV2aWV3ZWQtYnk6IE5pcm1veSBEYXM8bmlybW95LmRhc0BhbWQuY29tPgoKT24gMi85LzIxIDI6
MTcgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gT25seSBhIHpvbWJpZSBsZWZ0b3ZlciBm
cm9tIHJlYmFzaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+IEZpeGVzOiAzNzYzZDYzNWRlYWEgKCJkcm0vdHRtOiBhZGQg
ZGVidWdmcyBkaXJlY3RvcnkgdjIiKQo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
ZGV2aWNlLmMgfCAyIC0tCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oICAgICB8IDEg
LQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
ZGV2aWNlLmMKPiBpbmRleCBhYzA5MDNjOWU2MGEuLjhiYjYxZGQyNjQzNyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2RldmljZS5jCj4gQEAgLTQ5LDggKzQ5LDYgQEAgc3RhdGljIHZvaWQgdHRtX2ds
b2JhbF9yZWxlYXNlKHZvaWQpCj4gICAJaWYgKC0tdHRtX2dsb2JfdXNlX2NvdW50ID4gMCkKPiAg
IAkJZ290byBvdXQ7Cj4gICAKPiAtCWtvYmplY3RfZGVsKCZnbG9iLT5rb2JqKTsKPiAtCWtvYmpl
Y3RfcHV0KCZnbG9iLT5rb2JqKTsKPiAgIAl0dG1fbWVtX2dsb2JhbF9yZWxlYXNlKCZ0dG1fbWVt
X2dsb2IpOwo+ICAgCV9fZnJlZV9wYWdlKGdsb2ItPmR1bW15X3JlYWRfcGFnZSk7Cj4gICAJbWVt
c2V0KGdsb2IsIDAsIHNpemVvZigqZ2xvYikpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90
dG0vdHRtX2RldmljZS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaAo+IGluZGV4IDdi
YzhiYjc5NzE2MS4uMDM1YmJjMDQ0YTNiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90
dG1fZGV2aWNlLmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oCj4gQEAgLTU1
LDcgKzU1LDYgQEAgZXh0ZXJuIHN0cnVjdCB0dG1fZ2xvYmFsIHsKPiAgIAkgKiBDb25zdGFudCBh
ZnRlciBpbml0Lgo+ICAgCSAqLwo+ICAgCj4gLQlzdHJ1Y3Qga29iamVjdCBrb2JqOwo+ICAgCXN0
cnVjdCBwYWdlICpkdW1teV9yZWFkX3BhZ2U7Cj4gICAJc3BpbmxvY2tfdCBscnVfbG9jazsKPiAg
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
