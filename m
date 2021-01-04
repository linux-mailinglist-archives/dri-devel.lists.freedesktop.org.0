Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780B82EA635
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 08:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613C389FF9;
	Tue,  5 Jan 2021 07:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD07E89FF9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 07:59:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbUyPlH08agLSQVHEb6HpS/73WSaTXRDgD4u19eduOHgC101i/s/S+stCgoWoq6Vtlr12cpIzbAdb1tkiz7Kxsns/7btQTnfvzLtmJua7fA3Hg09Gagjxw+9kontsCdbBrZlw7t+cnofCUmV6nL8R4/CeynldTvebvPvnk0enzUGQyMtCNeGhb6XX7LQwU9npC1QHkrILLhCq3/zgBr+nJT+BlEKXi6AkwZxWaxDuXhKX96cyApOF/f6hrMdfEKwu7f2xavke19yzktA/vpIENURe9ThYFWqpgzuaV53e0JSwSG3TFMkx11R1xDQYEKvDrA9vAsGhsFT4YfHzvTHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J04Tq740hyw9IOWX4Y/JvoxwVx4kK250yC/Ar+A1OGw=;
 b=dw7isscjKtGeLF0y0eolKOqkMVsjBecm3nWBx75SIupUpXULbeC2HN8U+FHqvCBtuJkZJeHoti3qqXfyJKo7Tt5t4CFtRPjvpd7Y1tRcbcqIOYeE3RCFESFJdYEkA/DBVDdjVLFk8mLybKdK7AmkP+MvZvcQTpU7JiZycnpHXaxVOOXA869PlbuIcFZ9d9s6JFrBL8lcNb5MMqLU8jRiJVWaWBX9iuiDk09OIUhvQTPwDf5+QF5l0/XNI12tSWxoFmkLA8lpBqQhWrglgbUubRVCE5HJzbFt0aGUNGZV9zAq1MGT9W6NGBnJOpi+OBmGZztw1Oiem9ERIkUj3FBhoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J04Tq740hyw9IOWX4Y/JvoxwVx4kK250yC/Ar+A1OGw=;
 b=TDjga3Tv8AhHq2ms8TBYYcnenasTaglM715GlG37y/rLWUZnTgkIH/UeHH31aoB4FOKf6MkWNZs0jX7zQfe9Z+BKo9j7MaASdGs9ntvGCSQnL862CYylZtcGe5mQ1H8VyaeoxDez90HgNvJrJn2mxaYmmJkx65OYpMe4rrnBnm4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Tue, 5 Jan
 2021 07:59:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 07:59:18 +0000
Subject: Re: [PATCH] drm/ttm: Remove pinned bos from LRU in
 ttm_bo_move_to_lru_tail()
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210104231358.154521-1-lyude@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cc501d40-fdae-93a8-394a-4db840b9b0ef@amd.com>
Date: Mon, 4 Jan 2021 22:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210104231358.154521-1-lyude@redhat.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0085.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Tue, 5 Jan 2021 07:59:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 50b4e6c2-c262-42aa-b531-08d8b14fce00
X-MS-TrafficTypeDiagnostic: MN2PR12MB4157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41574411E82622F912A8A6B883D10@MN2PR12MB4157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rbwl6SykyX9P0sbsJ9T5dwk0pTy3Ly7D86kwkN0RH2IcPksbJ+f1G1EqWHbg4MgTXNF1BfGe/yFP++cWVQrSfjOdOtTWkO8D/56mZL6CPZlMsYQ08pUhCvJKcE1QRAb0HErX/KLW8wfBBV2modxrwCb0lf9lcdkoybcYhmINCviUFNLlIg6BOnZho5VzZBj6dJ5P3PYCVuaUE7hSbXqA3KDlwgdjdlzb64XWvnB3jctsF8D9F8eYsKZgwgLj00VAXihfF8CmwrfYsHpMSMBovp/uxUPPeha9T6bkWelqGtsJrcJWQWORmXB44peVQ8WPMDGQJ9rrhR1Awfbk62QkSrIHvPiShjS6m5KfeEH7VPiwGAGFjJ2aifMiarlYqfAR8be9kt1nXPWr0wXM0auZ4E5n6E/HRPvHNg5XnuzWPoo3pDyi1Cw0lYAk7z/VDr2b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(6666004)(66946007)(478600001)(5660300002)(66574015)(52116002)(66476007)(8936002)(66556008)(8676002)(31686004)(2906002)(83380400001)(86362001)(2616005)(36756003)(6486002)(16526019)(186003)(316002)(4326008)(54906003)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nmt0U091ZGE0dXpvVHhVNjJHcjlSV1hqR2Ntc0JnV2owV0lqS2g4MHQ5V2tI?=
 =?utf-8?B?WXlIMmY0ZzMwejBnTm4wcUVXN0NzS2tnWjltTlRqZFNlQXdjb3FsKzlLL1U5?=
 =?utf-8?B?LzVUWnhMcUF6S2RvSld6MUpJckpxRHVhR3c5OWRDeWtQc0c3Zk41S1grUWtM?=
 =?utf-8?B?SUM1MlZ3QVRhZVdPUnVRbzVJcVhNSzdCOW5GU3UvYWtMVDlWbEkvWERqL056?=
 =?utf-8?B?eS9hRTBWbENTejJ0V1Q0TDNwYmNkVzR3NnhqQ1ZHZzFhM0hZcTdzWXlhY0dV?=
 =?utf-8?B?UzdFS0VncGZvbldUVFUrc3VkclRxeVlHRy84NE40UXFTS3RJbVpidlNjaVNh?=
 =?utf-8?B?UzloNGo4MG5wcmV6NGphSG0ydHVXNGxmZjlkejM2UjJDaHR3bHRlZXNlazYy?=
 =?utf-8?B?d215a2d0QUs5M0daYmtqRVJES1VlRUl2VGVZUDhzWnZKZ2FYMit2YzhRKzNY?=
 =?utf-8?B?VElMRzRRRW42Z1VnR25OMU9VVklhYU9kZFd1WTlnRWJSNFMwL0IxV2wzOWIr?=
 =?utf-8?B?U2NTTTJldXNsSHRyNFc2WXFrSWUwMWVISlhwa3FVZDNVVGVwdEF1c29TVWV1?=
 =?utf-8?B?SHlwTTkvZHlCeHBRRFJKSkxCekJoUWd3NnFRbFdnTHc5dXlsdStqUEY4U0da?=
 =?utf-8?B?Y3llNlBwUVIyKzB6bVRtN0F6KzVLUDJlaWM1Mm1hZzQzV3dDSEJyQWtlNVBi?=
 =?utf-8?B?bzR3U3YrUXkzQy9TMHEwbHpsZjhvSGszUnlLVHJRdFI4dUxSbUoxZXUzTExu?=
 =?utf-8?B?OWVqVlZqTXpvakNXK1krYzNyTmNXWWdIc21ZVm9qYWhIem4zQnRFSWF5MkNa?=
 =?utf-8?B?VGRPaktvZm9wdUh2ZmNxZTZ4N2pnZWptOFRlQitJSWxDYWNtRURiN01DT2Z4?=
 =?utf-8?B?ZEh0dkt4V0ppUzFBTSttS2tTc3pDbWhacWdSOHNZc3k4U3lZSEpVWjllWURM?=
 =?utf-8?B?U3RnK1EwYmVYTmVCQmppWlJhQ0lJL1krekh2VVZDSkZYK0tsTXp5VE9qY3I1?=
 =?utf-8?B?bVNUSTdMdFdSQUd0SllGL3JHL1Vtbitzay9ManBVbWQxOHVRN1pjaVN5WDFa?=
 =?utf-8?B?bXlGQktQNGlWajRSelRHNVN5THk0d2d4VjRDTEpETS92MlRLWVk3eVJOdGdv?=
 =?utf-8?B?UGlES0d1QTNHWE9iWGFTSE9pNHRFSC9LV3RRUkd5bzBTb09rU3JGclV0Ry9H?=
 =?utf-8?B?UGluVERvbi9qaWxFNUpra3dWdU5ZUkRLMENmNkVjQ0RDd0JSMWszaWNuNGJz?=
 =?utf-8?B?cmc3VTROVTdHOVlTQVpzU1Q2bER3Z2xWdTZ6bUhCblQzemk4WG5YOXM4V3B5?=
 =?utf-8?B?WkFLdm94Wk9jWUtibzBmc2kybDlhWE1YZ0VSaUFkd0RodkxXWXdzWkVSeENM?=
 =?utf-8?B?YjZhN2Z5eHdpNTc0byt4Mit1Zk1YYVcrMWJtV0wvV0pxQ3NqdkRETXYwZDlM?=
 =?utf-8?Q?twvC75Mt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 07:59:18.7352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b4e6c2-c262-42aa-b531-08d8b14fce00
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ycbrDim5LQEG+Jb2N+dYGXPfCTdnPgzEgcf1BLNrxlnQQL5u2YQqygA4TkJGUjc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDEuMjEgdW0gMDA6MTMgc2NocmllYiBMeXVkZSBQYXVsOgo+IFJlY2VudGx5IGEgcmVn
cmVzc2lvbiB3YXMgaW50cm9kdWNlZCB3aGljaCBjYXVzZWQgVFRNJ3MgYnVmZmVyIGV2aWN0aW9u
IHRvCj4gYXR0ZW1wdCB0byBldmljdCBhbHJlYWR5LXBpbm5lZCBCT3MsIGNhdXNpbmcgaXNzdWVz
IHdpdGggYnVmZmVyIGV2aWN0aW9uCj4gdW5kZXIgbWVtb3J5IHByZXNzdXJlIGFsb25nIHdpdGgg
c3VzcGVuZC9yZXN1bWU6Cj4KPiAgICBub3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJNOiBldmljdGlu
ZyBidWZmZXJzLi4uCj4gICAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IERSTTogTW92aW5nIHBpbm5l
ZCBvYmplY3QgMDAwMDAwMDBjNDI4YzNmZiEKPiAgICBub3V2ZWF1IDAwMDA6MWY6MDAuMDogZmlm
bzogZmF1bHQgMDAgW1JFQURdIGF0IDAwMDAwMDAwMDAyMDAwMDAgZW5naW5lIDA0Cj4gICAgW0JB
UjFdIGNsaWVudCAwNyBbSFVCL0hPU1RfQ1BVXSByZWFzb24gMDIgW1BURV0gb24gY2hhbm5lbCAt
MSBbMDBmZmVhYTAwMAo+ICAgIHVua25vd25dCj4gICAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IGZp
Zm86IERST1BQRURfTU1VX0ZBVUxUIDAwMDAxMDAwCj4gICAgbm91dmVhdSAwMDAwOjFmOjAwLjA6
IGZpZm86IGZhdWx0IDAxIFtXUklURV0gYXQgMDAwMDAwMDAwMDAyMDAwMCBlbmdpbmUKPiAgICAw
YyBbSE9TVDZdIGNsaWVudCAwNyBbSFVCL0hPU1RfQ1BVXSByZWFzb24gMDIgW1BURV0gb24gY2hh
bm5lbCAxCj4gICAgWzAwZmZiMjgwMDAgRFJNXQo+ICAgIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBm
aWZvOiBjaGFubmVsIDE6IGtpbGxlZAo+ICAgIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBmaWZvOiBy
dW5saXN0IDA6IHNjaGVkdWxlZCBmb3IgcmVjb3ZlcnkKPiAgICBbVFRNXSBCdWZmZXIgZXZpY3Rp
b24gZmFpbGVkCj4gICAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IERSTTogd2FpdGluZyBmb3Iga2Vy
bmVsIGNoYW5uZWxzIHRvIGdvIGlkbGUuLi4KPiAgICBub3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJN
OiBmYWlsZWQgdG8gaWRsZSBjaGFubmVsIDEgW0RSTV0KPiAgICBub3V2ZWF1IDAwMDA6MWY6MDAu
MDogRFJNOiByZXN1bWluZyBkaXNwbGF5Li4uCj4KPiBBZnRlciBzb21lIGJpc2VjdGlvbiBhbmQg
aW52ZXN0aWdhdGlvbiwgaXQgYXBwZWFycyB0aGlzIHJlc3VsdGVkIGZyb20gdGhlCj4gcmVjZW50
IGNoYW5nZXMgdG8gdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoKS4gUHJldmlvdXNseSB3aGVuIGEg
YnVmZmVyIHdhcwo+IHBpbm5lZCwgdGhlIGJ1ZmZlciB3b3VsZCBiZSByZW1vdmVkIGZyb20gdGhl
IExSVSBvbmNlIHR0bV9ib191bnJlc2VydmUKPiB0byBtYWludGFpbiB0aGUgTFJVIGxpc3Qgd2hl
biBwaW5uaW5nIG9yIHVucGlubmluZyBCT3MuIEhvd2V2ZXIsIHNpbmNlOgo+Cj4gY29tbWl0IDNk
MWE4OGUxMDUxZiAoImRybS90dG06IGNsZWFudXAgTFJVIGhhbmRsaW5nIGZ1cnRoZXIiKQo+Cj4g
V2UndmUgYmVlbiBleGl0aW5nIGZyb20gdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoKSBhdCB0aGUg
dmVyeSBiZWdpbm5pbmcgb2YKPiB0aGUgZnVuY3Rpb24gaWYgdGhlIGJvIHdlJ3JlIGxvb2tpbmcg
YXQgaXMgcGlubmVkLCByZXN1bHRpbmcgaW4gdGhlIHBpbm5lZAo+IEJPIG5ldmVyIGdldHRpbmcg
cmVtb3ZlZCBmcm9tIHRoZSBscnUgYW5kIGFzIGEgcmVzdWx0IC0gY2F1c2luZyBpc3N1ZXMgd2hl
bgo+IGl0IGV2ZW50dWFsbHkgYmVjb21lcyB0aW1lIGZvciBldmljdGlvbi4KPgo+IFNvLCBsZXQn
cyBmaXggdGhpcyBieSBjYWxsaW5nIHR0bV9ib19kZWxfZnJvbV9scnUoKSBmcm9tCj4gdHRtX2Jv
X21vdmVfdG9fbHJ1X3RhaWwoKSBpbiB0aGUgZXZlbnQgdGhhdCB3ZSdyZSBkZWFsaW5nIHdpdGgg
YSBwaW5uZWQKPiBidWZmZXIuIEFzIHdlbGwsIGFkZCBiYWNrIHRoZSBodW5rcyBpbiB0dG1fYm9f
ZGVsX2Zyb21fbHJ1KCkgdGhhdCB3ZXJlCj4gcmVtb3ZlZCB3aGljaCBjaGVja2VkIHdoZXRoZXIg
d2Ugd2FudCB0byBjYWxsCj4gYmRldi0+ZHJpdmVyLT5kZWxfZnJvbV9scnVfbm90aWZ5KCkgb3Ig
bm90LiBXZSBkbyB0aGlzIGxhc3QgcGFydCB0byBhdm9pZAo+IGNhbGxpbmcgdGhlIGhvb2sgd2hl
biB0aGUgYm8gaW4gcXVlc3Rpb24gd2FzIGFscmVhZHkgcmVtb3ZlZCBmcm9tIHRoZSBMUlUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IEZpeGVzOiAz
ZDFhODhlMTA1MWYgKCJkcm0vdHRtOiBjbGVhbnVwIExSVSBoYW5kbGluZyBmdXJ0aGVyIikKPiBD
YzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZl
IEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoKSSB3YXMgYWxyZWFkeSB3b3JraW5nIG9uIGEg
Zml4IGFzIHdlbGwsIGJ1dCB5b3UgaGF2ZSBiZWVuIGZhc3RlciB0aGFuIG1lIDopCgpSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKR29pbmcg
dG8gcGljayB0aGlzIHVwIGZvciBkcm0tbWlzYy1uZXh0IG9yIGRybS1taXNjLWZpeGVzIGluIGEg
ZmV3IG1pbnV0ZXMuCgpUaGFua3MsCkNocmlzdGlhbi4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
Cj4gaW5kZXggMzFlOGIzZGE1NTYzLi4wZjM3M2I3OGU3ZmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKPiBAQCAtMTEzLDExICsxMTMsMTggQEAgc3RhdGljIHN0cnVjdCBrb2JqX3R5cGUgdHRtX2Jv
X2dsb2Jfa29ial90eXBlICA9IHsKPiAgIHN0YXRpYyB2b2lkIHR0bV9ib19kZWxfZnJvbV9scnUo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgIHsKPiAgIAlzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiA9IGJvLT5iZGV2Owo+ICsJYm9vbCBub3RpZnkgPSBmYWxzZTsKPiAgIAo+IC0J
bGlzdF9kZWxfaW5pdCgmYm8tPnN3YXApOwo+IC0JbGlzdF9kZWxfaW5pdCgmYm8tPmxydSk7Cj4g
KwlpZiAoIWxpc3RfZW1wdHkoJmJvLT5zd2FwKSkgewo+ICsJCW5vdGlmeSA9IHRydWU7Cj4gKwkJ
bGlzdF9kZWxfaW5pdCgmYm8tPnN3YXApOwo+ICsJfQo+ICsJaWYgKCFsaXN0X2VtcHR5KCZiby0+
bHJ1KSkgewo+ICsJCW5vdGlmeSA9IHRydWU7Cj4gKwkJbGlzdF9kZWxfaW5pdCgmYm8tPmxydSk7
Cj4gKwl9Cj4gICAKPiAtCWlmIChiZGV2LT5kcml2ZXItPmRlbF9mcm9tX2xydV9ub3RpZnkpCj4g
KwlpZiAobm90aWZ5ICYmIGJkZXYtPmRyaXZlci0+ZGVsX2Zyb21fbHJ1X25vdGlmeSkKPiAgIAkJ
YmRldi0+ZHJpdmVyLT5kZWxfZnJvbV9scnVfbm90aWZ5KGJvKTsKPiAgIH0KPiAgIAo+IEBAIC0x
MzgsOCArMTQ1LDEzIEBAIHZvaWQgdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibywKPiAgIAo+ICAgCWRtYV9yZXN2X2Fzc2VydF9oZWxkKGJvLT5iYXNl
LnJlc3YpOwo+ICAgCj4gLQlpZiAoYm8tPnBpbl9jb3VudCkKPiArCS8qIFBpbm5lZCBib3Mgd2ls
bCBoYXZlIGJlZW4gYWRkZWQgdG8gdGhlIExSVSBiZWZvcmUgdGhleSB3ZXJlIHBpbm5lZCwgc28g
bWFrZSBzdXJlIHdlCj4gKwkgKiBhbHdheXMgcmVtb3ZlIHRoZW0gaGVyZQo+ICsJICovCj4gKwlp
ZiAoYm8tPnBpbl9jb3VudCkgewo+ICsJCXR0bV9ib19kZWxfZnJvbV9scnUoYm8pOwo+ICAgCQly
ZXR1cm47Cj4gKwl9Cj4gICAKPiAgIAltYW4gPSB0dG1fbWFuYWdlcl90eXBlKGJkZXYsIG1lbS0+
bWVtX3R5cGUpOwo+ICAgCWxpc3RfbW92ZV90YWlsKCZiby0+bHJ1LCAmbWFuLT5scnVbYm8tPnBy
aW9yaXR5XSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
