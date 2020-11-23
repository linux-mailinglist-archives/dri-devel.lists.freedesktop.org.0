Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B634B2C1742
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09406E0DA;
	Mon, 23 Nov 2020 21:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D218E6E0D5;
 Mon, 23 Nov 2020 21:08:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTJDbDwlGVRvL27+g/YktI9I1r1unol2grJxbiKGQcjFi/gvHRQQo/lZIS2M/yicfgg7b3+FUa+q7ZoqUL0SIgTyzKU3I3QknLavsdAM+styTNZqNiYOwx2Ix5vFB/AycHYZQWIgzaUkWp0N/d2qabiT9HirwHiYaWiXqAfgJ6Bkkoo5b/ozeVYdy1E41Di1G/Wdpr1WjiR8J7EhZYFIt/qnQODp82NnJONFnxMp3wqJpuaUplmDOA8lzaaSVoLcJNoNNZnu1ttvq7AG3TaAOivOPf5GfXbfP7KjqbpgTSW/CskYofAG6J1Fz4NsNM1iInFRkAoUg2CTebJcimYMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9SIJqzHLwW4pS3MEhpDSFPejV/fuwKYMOcd9UXVEhQ=;
 b=M3DTeVSm3JW2YoJMDnx+hIoorPJKCypDE8SVDNI0GJD+iT/ZRyQto5iimXUOdVrqLGNKXEidh0gke9KXI95yXcbsq51aWbU3e94p04Yc0OOHmZdvp8zGTgmeTIveCkfphpvq1NOwulKatORtJ3FVvAEie2Yhz4VZHtIJKYkxM1hw0pOaXJilmtiHqg34Eq460SFS+Y+cHUGkA6w288qOlt2Hw07r7UiX3R+qLjmserHfWpyzbG9nr0Vcs6AC6y9k28zVI5O/a0wK18Z28Dzib8246LF2V7gStcw1AEIH337440nHK7o5Ugqm1g/DSMWEDOa6Q2yBNWKkkk1r96Ev7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9SIJqzHLwW4pS3MEhpDSFPejV/fuwKYMOcd9UXVEhQ=;
 b=Y3Zot2hiiVcEz8vHNNJRAiwvuyOTWvoPc3OTFHv3XHPvpLmuwYkYICHKB7nRcUNGq6D9m33nS58ydurN0u8zPAdi9fSO/1dKwhYi5HZ4q+7R9Aa3/ueBhxnbrLlb2t2G8ak63wsFj6K1dor6EyGkVAcji4d9Du7Wr0s1VZV3XyA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1883.namprd12.prod.outlook.com (2603:10b6:3:113::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Mon, 23 Nov 2020 21:08:56 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 21:08:56 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
Date: Mon, 23 Nov 2020 16:08:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: CH0PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:610:74::18) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.231.243] (165.204.55.251) by
 CH0PR04CA0073.namprd04.prod.outlook.com (2603:10b6:610:74::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Mon, 23 Nov 2020 21:08:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 633f8b72-7f4b-45fa-4407-08d88ff3fd27
X-MS-TrafficTypeDiagnostic: DM5PR12MB1883:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1883E497B206BD37B7B2FD85EAFC0@DM5PR12MB1883.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wueNqZAeuLTtQg7GC8suOQDpdaO96UYnmXjSp9LpjVlcJLLu11vELOheY77jN3mKSv1r2dZ5gLj3i3Fw8aitxg4Z4XqaTfUvzGkpwnrDOICr6WgV/dGnBDlSRjDdeWj6SVYSUegN+xGif3JLjh/7SxIMBF64ePMYKgn4oZFDHxYC4Wr+A3OaIYkLm7IHvfOPA3YQ2ano9q/Lgd1fszvN7Yof4riOUoGSwegQvh8s6g1GTYKm6XbuRRRpso1LxU8ek5JmKmry0jjnPF+uvS178eySsn1JEXzi0ditpXVdo5XE0albQanJ9PkszvVXovhmeaVNICwrqEItdNJX0Qn00z0LJ0A5rHWL48u0vR09YTrC5gz9V5LEJzV1CNKtCPAu7Iifbbt4JFHC53uSYPzlpRGnT0HPBAonQPktFrGOArg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(52116002)(86362001)(8676002)(478600001)(8936002)(66946007)(966005)(53546011)(36756003)(4326008)(66556008)(45080400002)(66476007)(5660300002)(83380400001)(2906002)(2616005)(186003)(16576012)(6486002)(16526019)(316002)(31686004)(31696002)(66574015)(956004)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rT4dwlJSobqOKM5RMIGxWMGL++gtVLaPf5PxwhdSUKZKXRRtko2CO4fr7KIWUbxn9cqhnPY2139on2vRUvoougre64uSollvZL5sGlH2p2+ZP5MNzvlPF1/eoKfNPQAP2RN5rbTkn6yirzvOKukuNuO/g5s9jH56hPMaLX8G3QJ7LrPz+0VhNroyiOCz2+dQMkz0X0sDdM/AH/hRokKRtmw+TBU82jLHJxV0CYd4Q7Na++miGLsk5KLcGv69syWWE+WQFBu4+u6i7/BssKCc4nSigtMz84NbKRjxygmLopEzEVj9lCr2q9AnRLyhlZN+w8XBCi4amVL96ajbkOY+zLRLwFAScSnnQ7iNxX2U6C2tRE5+YeLcv1LaC6rQEWfqQrsyK2cZ/xcuPfZHVvvli6C6lDnRDZ9IDYz56XnOdypdkDCD8t9Za6mwXHxkhduJ1ccZuCdEUHlo2yg8LQwrP+urZkR/A9VQ67pu/5BR/Vh+xfOJ6VAV4VT2433dGXhtqtG4666iQF2KRAMDKIAD68sYPJU6H5MnxXg3p5rogL02XPukuUK1ZoE2Z0Jd7OEX9dsuyKRhGx/kl4X3V5pxudDhNiVLmpLk7GFqHJdQvf475cxinrTWz0e9cTlryo+rI+g4se6dlU5JIvslKWkJyBCCEiiVO42W3B4a+x5G8BT13HbbL+zPlDXJlBeV2iCFqBBBeRgcMsxAWSVvLyU7BgPS4jAqTaMrs6TfSWWBaE0/Xwk58iHTI8YRks2/8fdB57KgrMrBcnIHwLRN9ud7VQT9cvvdEPr9wgtv72lx5+evr7DTZ2EBTeSLZ/VrBy8PFik8QfJ6+Box2ivMA5G5+ba7IGRTwVquO7/19NefCi/Wd3eHoOJWF9usJZF+4Ju411Ganz/1xgSZ7Kzy82o65g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633f8b72-7f4b-45fa-4407-08d88ff3fd27
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 21:08:56.1681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Sqn2RrQ0/oZMsqvMzTwMez4N7/Hmwy9oMngCZavh0025oMlXP2NQSrkWSfMyR2peseKYwERZfUyFGTcPp2AaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1883
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzIzLzIwIDM6NDEgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjMuMTEu
MjAgdW0gMjE6Mzggc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4KPj4gT24gMTEvMjMvMjAg
MzoyMCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDIzLjExLjIwIHVtIDIxOjA1
IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4KPj4+PiBPbiAxMS8yNS8yMCA1OjQyIEFN
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAyMS4xMS4yMCB1bSAwNjoyMSBzY2hy
aWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4gSXQncyBuZWVkZWQgdG8gZHJvcCBpb21tdSBi
YWNrZWQgcGFnZXMgb24gZGV2aWNlIHVucGx1Zwo+Pj4+Pj4gYmVmb3JlIGRldmljZSdzIElPTU1V
IGdyb3VwIGlzIHJlbGVhc2VkLgo+Pj4+Pgo+Pj4+PiBJdCB3b3VsZCBiZSBjbGVhbmVyIGlmIHdl
IGNvdWxkIGRvIHRoZSB3aG9sZSBoYW5kbGluZyBpbiBUVE0uIEkgYWxzbyBuZWVkIAo+Pj4+PiB0
byBkb3VibGUgY2hlY2sgd2hhdCB5b3UgYXJlIGRvaW5nIHdpdGggdGhpcyBmdW5jdGlvbi4KPj4+
Pj4KPj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4KPj4+PiBDaGVjayBwYXRjaCAiZHJtL2FtZGdw
dTogUmVnaXN0ZXIgSU9NTVUgdG9wb2xvZ3kgbm90aWZpZXIgcGVyIGRldmljZS4iIHRvIHNlZQo+
Pj4+IGhvdyBpIHVzZSBpdC4gSSBkb24ndCBzZWUgd2h5IHRoaXMgc2hvdWxkIGdvIGludG8gVFRN
IG1pZC1sYXllciAtIHRoZSBzdHVmZiAKPj4+PiBJIGRvIGluc2lkZQo+Pj4+IGlzIHZlbmRvciBz
cGVjaWZpYyBhbmQgYWxzbyBJIGRvbid0IHRoaW5rIFRUTSBpcyBleHBsaWNpdGx5IGF3YXJlIG9m
IElPTU1VID8KPj4+PiBEbyB5b3UgbWVhbiB5b3UgcHJlZmVyIHRoZSBJT01NVSBub3RpZmllciB0
byBiZSByZWdpc3RlcmVkIGZyb20gd2l0aGluIFRUTQo+Pj4+IGFuZCB0aGVuIHVzZSBhIGhvb2sg
dG8gY2FsbCBpbnRvIHZlbmRvciBzcGVjaWZpYyBoYW5kbGVyID8KPj4+Cj4+PiBObywgdGhhdCBp
cyByZWFsbHkgdmVuZG9yIHNwZWNpZmljLgo+Pj4KPj4+IFdoYXQgSSBtZWFudCBpcyB0byBoYXZl
IGEgZnVuY3Rpb24gbGlrZSB0dG1fcmVzb3VyY2VfbWFuYWdlcl9ldmljdF9hbGwoKSAKPj4+IHdo
aWNoIHlvdSBvbmx5IG5lZWQgdG8gY2FsbCBhbmQgYWxsIHR0IG9iamVjdHMgYXJlIHVucG9wdWxh
dGVkLgo+Pgo+Pgo+PiBTbyBpbnN0ZWFkIG9mIHRoaXMgQk8gbGlzdCBpIGNyZWF0ZSBhbmQgbGF0
ZXIgaXRlcmF0ZSBpbiBhbWRncHUgZnJvbSB0aGUgCj4+IElPTU1VIHBhdGNoIHlvdSBqdXN0IHdh
bnQgdG8gZG8gaXQgd2l0aGluCj4+IFRUTSB3aXRoIGEgc2luZ2xlIGZ1bmN0aW9uID8gTWFrZXMg
bXVjaCBtb3JlIHNlbnNlLgo+Cj4gWWVzLCBleGFjdGx5Lgo+Cj4gVGhlIGxpc3RfZW1wdHkoKSBj
aGVja3Mgd2UgaGF2ZSBpbiBUVE0gZm9yIHRoZSBMUlUgYXJlIGFjdHVhbGx5IG5vdCB0aGUgYmVz
dCAKPiBpZGVhLCB3ZSBzaG91bGQgbm93IGNoZWNrIHRoZSBwaW5fY291bnQgaW5zdGVhZC4gVGhp
cyB3YXkgd2UgY291bGQgYWxzbyBoYXZlIGEgCj4gbGlzdCBvZiB0aGUgcGlubmVkIEJPcyBpbiBU
VE0uCgoKU28gZnJvbSBteSBJT01NVSB0b3BvbG9neSBoYW5kbGVyIEkgd2lsbCBpdGVyYXRlIHRo
ZSBUVE0gTFJVIGZvciB0aGUgdW5waW5uZWQgCkJPcyBhbmQgdGhpcyBuZXcgZnVuY3Rpb24gZm9y
IHRoZSBwaW5uZWQgb25lc8KgID8KSXQncyBwcm9iYWJseSBhIGdvb2QgaWRlYSB0byBjb21iaW5l
IGJvdGggaXRlcmF0aW9ucyBpbnRvIHRoaXMgbmV3IGZ1bmN0aW9uIHRvIApjb3ZlciBhbGwgdGhl
IEJPcyBhbGxvY2F0ZWQgb24gdGhlIGRldmljZS4KCgo+Cj4gQlRXOiBIYXZlIHlvdSB0aG91Z2h0
IGFib3V0IHdoYXQgaGFwcGVucyB3aGVuIHdlIHVucG9wdWxhdGUgYSBCTyB3aGlsZSB3ZSAKPiBz
dGlsbCB0cnkgdG8gdXNlIGEga2VybmVsIG1hcHBpbmcgZm9yIGl0PyBUaGF0IGNvdWxkIGhhdmUg
dW5mb3Jlc2VlbiAKPiBjb25zZXF1ZW5jZXMuCgoKQXJlIHlvdSBhc2tpbmcgd2hhdCBoYXBwZW5z
IHRvIGttYXAgb3Igdm1hcCBzdHlsZSBtYXBwZWQgQ1BVIGFjY2Vzc2VzIG9uY2Ugd2UgCmRyb3Ag
YWxsIHRoZSBETUEgYmFja2luZyBwYWdlcyBmb3IgYSBwYXJ0aWN1bGFyIEJPID8gQmVjYXVzZSBm
b3IgdXNlciBtYXBwaW5ncwoobW1hcCkgd2UgdG9vayBjYXJlIG9mIHRoaXMgd2l0aCBkdW1teSBw
YWdlIHJlcm91dGUgYnV0IGluZGVlZCBub3RoaW5nIHdhcyBkb25lIApmb3IgaW4ga2VybmVsIENQ
VSBtYXBwaW5ncy4KCkFuZHJleQoKCj4KPiBDaHJpc3RpYW4uCj4KPj4KPj4gQW5kcmV5Cj4+Cj4+
Cj4+Pgo+Pj4gR2l2ZSBtZSBhIGRheSBvciB0d28gdG8gbG9vayBpbnRvIHRoaXMuCj4+Pgo+Pj4g
Q2hyaXN0aWFuLgo+Pj4KPj4+Pgo+Pj4+IEFuZHJleQo+Pj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4+Cj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lA
YW1kLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQu
YyB8IDEgKwo+Pj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Pj4+Pgo+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+Pj4+PiBpbmRleCAxY2NmMWVmLi4yOTI0OGE1IDEwMDY0
NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+Pj4gQEAgLTQ5NSwzICs0OTUsNCBAQCB2
b2lkIHR0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fdHQgKnR0bSkKPj4+Pj4+IMKgwqDCoMKg
wqAgZWxzZQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9wb29sX3VucG9wdWxhdGUodHRt
KTsKPj4+Pj4+IMKgIH0KPj4+Pj4+ICtFWFBPUlRfU1lNQk9MKHR0bV90dF91bnBvcHVsYXRlKTsK
Pj4+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlz
dGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDElN0NBbmRyZXkuR3JvZHpvdnNreSU0MGFt
ZC5jb20lN0M5YmUwMjlmMjZhNDc0NjM0N2E2MTA4ZDg4ZmVkMjk5YiU3QzNkZDg5NjFmZTQ4ODRl
NjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MTc1OTYwNjU1NTk5NTUlN0NVbmtub3du
JTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRp
STZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9dFozZG8lMkZlS3pCdFJs
TmFGYkJqQ3RSdlVIS2R2d0RaN1NvWWhFQnU0JTJCVDglM0QmYW1wO3Jlc2VydmVkPTAgCj4+Pj4K
Pj4+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
