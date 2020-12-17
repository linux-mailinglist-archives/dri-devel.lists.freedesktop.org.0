Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5AA2DCF72
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 11:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71A06E235;
	Thu, 17 Dec 2020 10:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCF26E235
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVp71JCTH4bkwdQvAO4hGw1x+ylFfFEx9rxGz6kSsLtE16QH4L0BBigl0nqB/U3A5mQOdmLioR2LG5+dCH9WpBdTlQ0AldX68QBt0cF840hIk1FnjmS9Vp61ivu8BFVG+RGTrQjJ2ImrNDB21XyRJlPpZj6mQkUTqDoxpZF8TeZgQ9J7M+ZzXFK3bA+NZMDCVDWl14Jo/CV1XdSAptPUXofY1Zr9J1m5R+xRvZUhn+wOXROmv9i1R8TEZyuq44iEmxY+MpIlWeVZ8vtrhvkXa4/jRLgHj+uU02xBFnb5L1S/uSoW4LodhJuhoM1/Fl8vgXwWjR1QpRIQgQH/ShZEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb7yXmcecsENihbZDOK15ZD1ttsf9fx3vUXQP8xyGiI=;
 b=UvBES6sd63xZsi0rsGq6SVDdoOvpV95BvNGkiX5VrIgYKsQF0lAtXWY9n8ICmZtyGrpDezOzDa56GQhwPRvo4ALEqSjZJnyCSvMQFe9URBo5tU+ELYTjwfcnL9wGsEKE2NfUGoXnO6XO2SRD2qJP/8gFAMyHHW+2uiHaoItRzJFZOOnqyHFEKhLSNzCj46EZqm60abUZe+/jNZJIBHKr0+bwBl1sboUtfxTydUB1wBqMtGbrDJ1E6ONEz9XCVzSXjcb9ryywP1LCz/WWBfqsDzYSV5g9wTck58uEK9BUCGlbvkRmFzMcWWJe4W5HOuJbr+ZeU7LH341fD1zwM6Je5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb7yXmcecsENihbZDOK15ZD1ttsf9fx3vUXQP8xyGiI=;
 b=DKoZdWi3nVrwahT0lpdSGa62fvb+HfNPpoI8qcV6BDhJ9C0+9ovXHHpgWtJC7pMPFy5x51lriJzowdjNTOUZF/IJSjAu5eOe0Ogwo2bbmBgGAXTFJMIRhdl0FAvW/+hzZot8PWcy1/tDfzKhWFGORRJzMmdCr0ddO93U/3sPsJk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.21; Thu, 17 Dec
 2020 10:25:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 10:25:17 +0000
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
To: Chen Li <chenli@uniontech.com>
References: <877dpiz4sf.wl-chenli@uniontech.com>
 <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
 <875z51zwsq.wl-chenli@uniontech.com>
 <90b625e2-2409-d13b-2456-483ad4eef18f@amd.com>
 <873605z1du.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7920fd29-3f95-2109-07ee-15659e80dc40@amd.com>
Date: Thu, 17 Dec 2020 11:25:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <873605z1du.wl-chenli@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0701CA0002.eurprd07.prod.outlook.com
 (2603:10a6:200:42::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0002.eurprd07.prod.outlook.com (2603:10a6:200:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.12 via Frontend
 Transport; Thu, 17 Dec 2020 10:25:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7313c5ae-fa66-4ebb-1e13-08d8a2760c88
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4357CCA245D83A6A0F6075FA83C40@MN2PR12MB4357.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1+wXwDtm/ueGooLbqquTAsAhGyPw4VCMmVW0X4xHG7lBiDUvZhloBlmIc7G9CvbNQybTJxwE7h6mY9wiXYADvuYA8QsMUd651sfb+mA5bwDnIW9O6XTv9pzAEItk4TjfVrmS+XHFztX9wNV9OvStvfuMt4TiGT1BQZai3Htq8V8kUV/trtxb8iPvLfvmPdRigF53ED16YV+K8k7BR8FQIxzC/zoxhSVOFeqOW3XQgpvlQ5OvpjEAyllDDZETf9x5P5h4+dbCcn5935mf/1XI13yf0q1NEKjo0PGnleWlNn/oMaWzAxQuu50dbhYHMajWK/pTf+RoWEHeymIPp0CdtWCFvs3oEq2tfhTS1XoRE7CRbdjCJLK6o9aBWTcsJRUWaAq3phuy8CbZX1wuo3a/UzMAOq/yvfICXfwEmD7A47gw3UbHk2wX8GMBWKnxUAl2PK81Ka28yT1+DjQvrmyfpmNi8rU9vMYqR9LZGtEo44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(5660300002)(2906002)(6916009)(83380400001)(45080400002)(4326008)(66556008)(66946007)(316002)(16526019)(31686004)(966005)(66476007)(66574015)(6486002)(31696002)(186003)(8676002)(8936002)(2616005)(86362001)(6666004)(36756003)(52116002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnNQUEZ6aFBwdUxRMWcvbDAwNjNuMDYrcGxxOE9Kd0lRUDV1amtyTjRLWitm?=
 =?utf-8?B?d3QyNi9DMVNzSVNsTEJIMXdTamtYRTlvL3drTVE3SnpWc0VrZjUvS2NxRzJ2?=
 =?utf-8?B?bkp5NER0b3FieTJ1OFdZYm5tcEF3TEdpV0trZGpEaVYwZ2xLR2t4WEtZQ1J6?=
 =?utf-8?B?VGxFbHhWWUVTL2lLS0JCMHhPalRPYTNldndxL2RDbzAxVHB2aXR4NldjTVNk?=
 =?utf-8?B?K0NvVlRRaTM4VS9pVVAyc2VJYU52WW4rVElSNk8zd0JPZzlKdFFnVEtSRHZV?=
 =?utf-8?B?YzJpOUtlWlpwbTRoMzZvYWhZNWg2d21UWEJ0bTJTeWw5V3hsRnFsSTI0eit6?=
 =?utf-8?B?ZUtacmhBZVJyS2svZ2VYa05sUW1YbXBWbUswbzR4cjYvWTBvSWZsbWNLWFh2?=
 =?utf-8?B?bUZybTZySHQ3VndkZmpVR3BtVVVZenpUNDFQSlJ0dmZiMXZTTjQwK3NjdUlp?=
 =?utf-8?B?ZEZUMTd6cktMYmpucXRxcmVhVC9WZEwrN281ZUlUVmlEVmR0aXRTVEdSYkla?=
 =?utf-8?B?aEc0RkhMOUV1NEcxUjNnY3JxMXVrVUdLb0d4OTVyekg0Y3pSN2ZQenRQMW1X?=
 =?utf-8?B?bm10SWo5ckZ5YzIrdHEvZWFpbW9CQ1ZNTGxNeWY0WU9qLzJsalFlay94TlNH?=
 =?utf-8?B?enA3SGFPaGxOTE94b1VZNUJ6eEFlYy9QMVhRWU5pdDBsRU9sckJCV0d1UWFs?=
 =?utf-8?B?Yk80NUowMGQwRXAyeXg4OG1zMTNndWZ6KythcTdybzFpUW5DRU91bFVDRmVC?=
 =?utf-8?B?a2RvVjkvVXRNMWN3dE1GRWw3c1NOUkF3Mjk3SUZnYk84ZS9zOXI4dDZST05K?=
 =?utf-8?B?bFZScGVwOUVvNVI0Q040TnRDT2JhZGsyOEJ0VVZ1SUxsRnJpUHhlczE4M2JK?=
 =?utf-8?B?a21iUTRRWkpoT0FhaythVmdGZ0h1T21QOVFyWVVDYjI2NWJ2MGVZTys4ejBx?=
 =?utf-8?B?M2VCR094QkZoQXVnRDFnbEV1VnVrajZZZnVTbkR3QmRTTm9iTVptM2FPVERk?=
 =?utf-8?B?MlR3OXNFVUd6VWFjZVFWV2oza0NmcUt2QjBOWXRMRkdKbVhMcWJQTEJPUlZk?=
 =?utf-8?B?TDB6Q3cvaWJ6dG1HYzkrQVRwYmNHV2dKY0U0YzczTHVzcUVMWFhEbDJTYm1u?=
 =?utf-8?B?VHRIQVRzeEdGMitBOXBHckJCM3dROTNUUUZPdXY0K0szaFBVYWxFODZ4SUxy?=
 =?utf-8?B?OWJTdGpEMVJqU1MwM05HVXVPQWRFTXNQVDdzZVkvd0J6MHZYcGQyNS83RW9D?=
 =?utf-8?B?a1l3dkVxdTYvRHdyQjg3SWpGRVlKUUpCSEJ3UHlYWjZFMUd1aHlNbUtCVmhD?=
 =?utf-8?B?Y0s0amY0QzlQS24yZDZiMzNLSjdxS3pkQWowckNMU0dwL0xRWmg0Tmo1Y3kz?=
 =?utf-8?B?RjhvZjJiejd0dzg3SVVrYVNBRG83eWZMbkVIblUyUzlNNjhya2srMi8rbjF6?=
 =?utf-8?Q?tycGTsTw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:25:17.1234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 7313c5ae-fa66-4ebb-1e13-08d8a2760c88
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzKqrzQS7EFQMXgVKVDSJh4mwupiQr+5i70KjIjKrm9E5kVsjpmCZ9/G4goJkA0W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMTIuMjAgdW0gMDI6MDcgc2NocmllYiBDaGVuIExpOgo+IE9uIFdlZCwgMTYgRGVjIDIw
MjAgMjI6MTk6MTEgKzA4MDAsCj4gQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTYuMTIu
MjAgdW0gMTQ6NDggc2NocmllYiBDaGVuIExpOgo+Pj4gT24gV2VkLCAxNiBEZWMgMjAyMCAxNTo1
OTozNyArMDgwMCwKPj4+IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4gW1NOSVBdCj4+PiBI
aSwgQ2hyaXN0aWFuLiBJJ20gbm90IHN1cmUgd2h5IHRoaXMgY2hhbmdlIGlzIGEgaGFjayBoZXJl
LiBJIGNhbm5vdCBzZWUgdGhlIHByb2JsZW0gYW5kIHdsbCBiZSBncmF0ZWZ1bCBpZiB5b3UgZ2l2
ZSBtb3JlIGV4cGxhaW5hdGlvbnMuCj4+IF9fbWVtc2V0IGlzIHN1cHBvc2VkIHRvIHdvcmsgb24g
dGhvc2UgYWRkcmVzc2VzLCBvdGhlcndpc2UgeW91IGNhbid0IHVzZSB0aGUKPj4gZTg4NjAgb24g
eW91ciBhcm02NCBzeXN0ZW0uCj4gSWYgX19tZW1zZXQgaXMgc3VwcG9zZWQgdG8gd29yayBvbiB0
aG9zZSBhZHJlc3Nlcywgd2h5IHRoaXMgY29tbWl0KGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZ0b3J2
YWxkcyUyRmxpbnV4JTJGY29tbWl0JTJGYmEwYjIyNzVhNjc4MWIyZjM5MTlkOTMxZDYzMzI5YjU1
NDhmNmQ1ZiZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M0
ZWQzYzA3NTg4ODc0NmI3ZjQxNDA4ZDhhMjI4MTFjNSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgy
ZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0Mzc2NDAyNzQwMjMzNTAlN0NVbmtub3duJTdDVFdGcGJH
WnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3
aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9SGhXeFVhTG8zV3B6b1Y2aGpWJTJCRzFI
SUNhSU9Yd3NvTnB6djV0Tk1OZzhBJTNEJmFtcDtyZXNlcnZlZD0wKSBpcyBuZWVkZWQ/IChJIGFs
c28gbm90aWNlIGRybS9yYWRlb24gZGlkbid0IHRha2UgdGhpcyBjaGFuZ2UgdGhvdWdoKSBqdXN0
IG91dCBvZiBjdXJpb3NpdHkuCgpXZSBnZW5lcmFsbHkgYWNjZXB0IHRob3NlIHBhdGNoZXMgYXMg
Y2xlYW51cCBpbiB0aGUga2VybmVsIHdpdGggdGhlIGhvcGUgCnRoYXQgd2UgY2FuIGZpbmQgYSB3
YXkgdG8gd29yayBhcm91bmQgdGhlIHVzZXJzcGFjZSByZXN0cmljdGlvbnMuCgpCdXQgd2hlbiB5
b3UgYWxzbyBoYXZlIHRoaXMgaXNzdWUgaW4gdXNlcnNwYWNlIHRoZW4gdGhlcmUgaXNuJ3QgbXVj
aCB3ZSAKY2FuIGRvIGZvciB5b3UuCgo+PiBSZXBsYWNpbmcgdGhlIHRoZSBkaXJlY3Qgd3JpdGUg
aW4gdGhlIGtlcm5lbCB3aXRoIGNhbGxzIHRvIHdyaXRlbCgpIG9yCj4+IG1lbXNldF9pbygpIHdp
bGwgZml4IHRoYXQgdGVtcG9yYXJ5LCBidXQgeW91IGhhdmUgYSBtb3JlIGdlbmVyYWwgcHJvYmxl
bSBoZXJlLgo+ICAgCj4gSSBjYW5ub3Qgc2VlIHdoYXQncyB0aGUgbW9yZSBnZW5lcmFsIHByb2Js
ZW0gaGVyZSA6KCB1IG1lYW4gcGVyZm9ybWFuY2U/CgpObywgbm90IHBlcmZvcm1hbmNlLiBTZWUg
c3RhbmRhcmRzIGxpa2UgT3BlbkdMLCBWdWxrYW4gYXMgd2VsbCBhcyBWQS1BUEkgCmFuZCBWRFBB
VSByZXF1aXJlIHRoYXQgeW91IGNhbiBtbWFwKCkgZGV2aWNlIG1lbW9yeSBhbmQgZXhlY3V0ZSAK
bWVtc2V0L21lbWNweSBvbiB0aGUgbWVtb3J5IGZyb20gdXNlcnNwYWNlLgoKSWYgeW91ciBBUk0g
YmFzZSBib2FyZCBjYW4ndCBkbyB0aGF0IGZvciBzb21lIHRoZW4geW91IGNhbid0IHVzZSB0aGUg
CmhhcmR3YXJlIHdpdGggdGhhdCBib2FyZC4KCj4+Pj4gRm9yIGFtZGdwdSBJIHN1Z2dlc3QgdGhh
dCB3ZSBhbGxvY2F0ZSB0aGUgVVZEIG1lc3NhZ2UgaW4gR1RUIGluc3RlYWQgb2YgVlJBTQo+Pj4+
IHNpbmNlIHdlIGRvbid0IGhhdmUgdGhlIGhhcmR3YXJlIHJlc3RyaWN0aW9uIGZvciB0aGF0IG9u
IHRoZSBuZXcgZ2VuZXJhdGlvbnMuCj4+Pj4KPj4+IFRoYW5rcywgSSB3aWxsIHRyeSB0byBkaWcg
aW50byBkZWVwZXIuIEJ1dCB3aGF0J3MgdGhlICJoYXJkd2FyZSByZXN0cmljdGlvbiIgbWVhbmlu
ZyBoZXJlPyBJJ20gbm90IGZhbWlsaWFyIHdpdGggdmlkZW8gZHJpdmVyIHN0YWNrIGFuZCBhbWQg
Z3B1LCBzb3JyeS4KPj4gT24gb2xkZXIgaGFyZHdhcmUgKEFHUCBkYXlzKSB0aGUgYnVmZmVyIGhh
ZCB0byBiZSBpbiBWUkFNIChNTUlPKSBtZW1vcnksIGJ1dCBvbgo+PiBtb2Rlcm4gc3lzdGVtIEdU
VCAoc3lzdGVtIG1lbW9yeSkgd29ya3MgYXMgd2VsbC4KPiBJSVVDLCBlODg2MCBjYW4gdXNlIGFt
ZGdwdShJIHVzZSByYWRlb24gbm93KSBiZWF1c2UgaXRzIGRldmljZSBpZCA2ODIyIGlzIGluIGFt
ZGdwdSdzIHRhYmxlLiBCdXQgSSBjYW5ub3QgdGVsbCB3aGV0aGVyIGU4ODYwIGhhcyBpb21tdSwg
YW5kIEkgY2Fubm90IGZpbmQgaW9tbXUgZnJvbSBsc3BjaSwgc28gZ3JhcGhpY3MgdHJhbnNsYXRp
b24gdGFibGUgbWF5IG5vdCB3b3JrIGhlcmU/CgpUaGF0IGlzIG5vdCByZWxhdGVkIHRvIElPTU1V
LiBJT01NVSBpcyBhIGZlYXR1cmUgb2YgdGhlIENQVS9tb3RoZXJib2FyZC4gClRoaXMgaXMgaW1w
bGVtZW50ZWQgdXNpbmcgR1RULCBlLmcuIHRoZSBWTSBwYWdlIHRhYmxlcyBpbnNpZGUgdGhlIEdQ
VS4KCkFuZCB5ZXMgaXQgc2hvdWxkIHdvcmsgSSB3aWxsIHByZXBhcmUgYSBwYXRjaCBmb3IgaXQu
Cgo+Pj4+IEJUVzogSG93IGRvZXMgdXNlcnNwYWNlIHdvcmsgb24gYXJtNjQgdGhlbj8gVGhlIGRy
aXZlciBzdGFjayB1c3VhbGx5IG9ubHkgd29ya3MKPj4+PiBpZiBtbWlvIGNhbiBiZSBtYXBwZWQg
ZGlyZWN0bHkuCj4+PiBJIGFsc28gcG9zdCB0d28gdXNlc3BhY2UgaXNzdWUgb24gbWVzYSwgYW5k
IHlvdSBtYXkgYmUgaW50ZXJlc3RlZCB3aXRoIHRoZW06Cj4+PiAgICBodHRwczovL25hbTExLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRsYWIu
ZnJlZWRlc2t0b3Aub3JnJTJGbWVzYSUyRm1lc2ElMkYtJTJGaXNzdWVzJTJGMzk1NCZhbXA7ZGF0
YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M0ZWQzYzA3NTg4ODc0NmI3
ZjQxNDA4ZDhhMjI4MTFjNSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2Mzc0Mzc2NDAyNzQwMjMzNTAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lN
QzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNE
JTdDMTAwMCZhbXA7c2RhdGE9WlI3cERTJTJCQ0xVdU1qQ2VLY01BWGZIdGJjenQ4V2RVd1NlTFpD
dUhmQ0h3JTNEJmFtcDtyZXNlcnZlZD0wCj4+PiAgICBodHRwczovL25hbTExLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRsYWIuZnJlZWRlc2t0
b3Aub3JnJTJGbWVzYSUyRm1lc2ElMkYtJTJGaXNzdWVzJTJGMzk1MSZhbXA7ZGF0YT0wNCU3QzAx
JTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M0ZWQzYzA3NTg4ODc0NmI3ZjQxNDA4ZDhh
MjI4MTFjNSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0
Mzc2NDAyNzQwMzMzNDQlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01E
QWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZh
bXA7c2RhdGE9akFKbzNhRzJJMW9JRFRaWFdoTmdjS29LYmQ2dFRkaUF0Yzd2RTRoSkpQWSUzRCZh
bXA7cmVzZXJ2ZWQ9MAo+Pj4gSSBwYXN0ZSBzb21lIHZpcnR1YWwgbWVtb3J5IG1hcCBpbiB1c2Vy
c3BhY2UgdGhlcmUuIChhbmQgdGhlIHR3byBwcm9ibGVtcyBkbyBib3RoZXIgbWUgcXVpdGUgYSBs
b25nIHRpbWUuKQo+PiBJIGRvbid0IHJlYWxseSBzZWUgYSBzb2x1dGlvbiBmb3IgdGhvc2UgcHJv
YmxlbXMuCj4+Cj4+IFNlZSBpdCBpcyBwZXJmZWN0bHkgdmFsaWQgZm9yIGFuIGFwcGxpY2F0aW9u
IHRvIG1lbXNldC9tZW1jcHkgb24gbW1hcGVkIE1NSU8KPj4gc3BhY2Ugd2hpY2ggY29tZXMgZnJv
bSBPcGVuR0wgb3IgVnVsa2FuLgo+Pgo+PiBTbyB5b3VyIENQVSBzaW1wbHkgd29uJ3Qgd29yayB3
aXRoIHRoZSBoYXJkd2FyZS4gV2UgY291bGQgd29yayBhcm91bmQgdGhhdCB3aXRoCj4+IGEgY291
cGxlIG9mIGhhY2tzLCBidXQgdGhpcyBpcyBhIHByZXR0eSBtdWNoIGdlbmVyYWwgcHJvYmxlbS4K
Pj4KPj4gUmVnYXJkcywKPj4gQ2hyaXN0aWFuLgo+ICAgCj4gVGhhbmtzISBDYW4geW91IHByb3Zp
ZCBzb21lIGRldGFpbHMgYWJvdXQgdGhlc2UgaGFja3M/IFNob3VsZCBJIHBvc3QgYW5vdGhlciBp
c3N1ZSBvbiB0aGUgbWFpbCBsaXN0PwoKQWRqdXN0IHRoZSBrZXJuZWwgYW5kL29yIHVzZXIgc3Bh
Y2UgdG8gbmV2ZXIgbWFwIFZSQU0gdG8gdGhlIENQVS4KClRoaXMgdmlvbGF0ZXMgdGhlIE9wZW5H
TC9WdWxrYW4gc3BlY2lmaWNhdGlvbiBpbiBzb21lIHdheXMuIFNvIG5vdCBzdXJlIAppZiB0aGF0
IHdpbGwgd29yayBvciBub3QuCgpSZWdhcmRzLApDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
