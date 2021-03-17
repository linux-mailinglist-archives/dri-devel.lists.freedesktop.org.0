Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D933E668
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 02:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39696E0A8;
	Wed, 17 Mar 2021 01:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E267B6E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 01:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAR0D6vmFO/Zyta8rs9+AAcpmhumVEZQssNYdhBNOJWYVDToQYE3jrEvqz/SgoJq9r3nXGVJ8Xvce6hNokN7lHZv83Va1ZZhAoKOhh1S8DT2i7eOACxW9ansDu0NAWUAm1voZm60jHQ/OhLejEpxxMhSPmxvKz8xq4SskEDfownZC4t32S3MJX+cmUxEF4k0mlk02g/8tkEbFjSaGIpjV1NNG8F+tq+xFcv5ptjeDOnKLNDa91zGvGp01dhfqRm3HZVdJiuyLEb51FydYPIBH+uX6Z+0sqSYtV9eam7UX6YEX8Io9yxgIUZ5Ru+kJbu+AaSGpnAAv8aC1begeCfsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeGNTemFjh77Ga8T3fS9i+eNCB+ugOOhPidmP6gIriE=;
 b=K8yglIhkGFCzBFfQawe4t2zcacl+2IZEa2bHmHLbK9TeQlTO58KtcypV734XdQqMAuBkwM4Fpnn4VrzPEpaIJTXUQ5mGSkI+tXmbj8MxgX2junUQQkd3CTeCwtls/zZ0m5oEDjjdsMSMY09igJTGwel1TUB+uCFEkTjtxRXHrsDwpN77jsXbZfIiIJPJSgRWelG+791ml/4HDfwRAjVL2iJzoI+c5blfIYH7Fwabgio8gNVdpVpShN9jSOjum38w1MtJ+BgwhdjJuW+KqucP1RTVYLxs8hNvvUbWAm5kOD1eGBO1NF9Kri1cjgymFWk/FpxlEleT0BZ5pR3i6q/dsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeGNTemFjh77Ga8T3fS9i+eNCB+ugOOhPidmP6gIriE=;
 b=nKZloQhPlpx1KiuD2AopgQi7wyp+M1+CmygdGMaa9Wptyb6KLw9YStvTbC7YUBeWOOjBxJhWE409pbwXwBt+nMyWrg3uRY2vO4Ibn86AB9T/7xFFoAhKCLvknB6FRsqtjm6o0dw9LJ8KduTnReFgkDFRur/b5la/SnqMnPsDtZk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by BLAPR05MB7348.namprd05.prod.outlook.com (2603:10b6:208:295::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11; Wed, 17 Mar
 2021 01:51:05 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e%6]) with mapi id 15.20.3955.010; Wed, 17 Mar 2021
 01:51:05 +0000
Subject: Re: vmwgfx leaking bo pins?
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
 <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
 <54448dd1-cfc3-626a-6480-4edfcf97b148@shipmail.org>
 <DCF8E67E-36D4-400A-88B7-63C6253179D6@vmware.com>
 <48d5e3f3-0b42-a9e4-6e5c-591806e873ff@shipmail.org>
 <3bb8b7f4-953a-b455-e148-009c2ff9f7b2@vmware.com>
 <CAKMK7uGY1-G_+CcaSfDqPhMpwbExugJj53A7xEn+LS5d398_3w@mail.gmail.com>
 <c8d7e6e6-0f0b-8200-066c-c53cc70ecbc1@shipmail.org>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <eebee5c9-a724-5cf9-ca7c-32df34e88169@vmware.com>
Date: Tue, 16 Mar 2021 21:51:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <c8d7e6e6-0f0b-8200-066c-c53cc70ecbc1@shipmail.org>
Content-Language: en-US
X-Originating-IP: [71.175.59.246]
X-ClientProxiedBy: MW4PR03CA0327.namprd03.prod.outlook.com
 (2603:10b6:303:dd::32) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (71.175.59.246) by
 MW4PR03CA0327.namprd03.prod.outlook.com (2603:10b6:303:dd::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Wed, 17 Mar 2021 01:51:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0e33450-4e58-4a29-3376-08d8e8e7203e
X-MS-TrafficTypeDiagnostic: BLAPR05MB7348:
X-Microsoft-Antispam-PRVS: <BLAPR05MB7348796913C86554FD139D3DCE6A9@BLAPR05MB7348.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +UnB2JV+xJYBlAL0Nzaa0CZ91KnMjghUozWQVBx+W5Sm71DWhmRx1mBlAGqaiHijxthg6Dnf1JNAmd53kfPFtlc5xV1y1Uph+znvpoJ4UjVT+j4g7Jx+vAUh4picyRxbQNWdaZ+MExsqU/I5Ni3AYF6dkXoXVslszULx58jYPNkIGsbbx0Yqcs8uv4yPlcMmpQdRLg6+OmZfjfCLdkP32Cj3EWacbsNR2yHAwzysbhFGr+dsqnL315E89b7PTVZz0ASrFzF4oDFvVp9tWj83fD8QF0kC3o3TOG2Q4H2aMgO852yr0B4wF+0hWTYQ7QXSS8B1P/b7tBrVmvACzvPr2FsMpYultsFeKZTfR+FBFewhGX4Zt9eOthfbeSj7j92sFekc79mV+t2VX3Xbka0ik9vwHAEKAkOaBGbd9DI/sOGnFugf7cpjr8WFskOPCAeq/dyeN0QR6oDd3iOAuNrseTh+JaKfEK68JYzsvm2T8ng7KOjzqjp0V6P7zx0TRCJEADxO8t2GZjLejaiSPbNK+XfnnU1Gk5nX82V/08SYDFUe1xC1TLd8gPu2Is+ylA4/vm06f00fRAxQYzeXNKdLkkLL3mn2OoDWc4AWV65kPIwdC9d6Gxp+k9Ptxi8O092oWOqm+8xoa9L73ZkZ9P127elKgkY28memu2Afp0J3iJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(53546011)(3480700007)(478600001)(66946007)(31686004)(956004)(2906002)(110136005)(31696002)(16526019)(8936002)(8676002)(66476007)(6486002)(316002)(36756003)(66574015)(4326008)(66556008)(5660300002)(186003)(2616005)(86362001)(6666004)(16576012)(83380400001)(26005)(40753002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzgybWUyYWliY0dsVDZmZG1ybXRJR0dULzVrTmtzM2NabkpKOUtrZWRBNVFl?=
 =?utf-8?B?MnYvNWRPSHBha04rVzYrS0RBWmQvbFpHOGRZTmJkcDNIME1NdWZLcWwvbTRM?=
 =?utf-8?B?YjhZL1NLblhoUHpvYXB6VzBKbkNsWjFBZXAyTFRuNFdleE42M29Ha090YW1x?=
 =?utf-8?B?aGcrUks4OE1wckdZc1EzM2k2RDdaek5WSFNmYUNNUVBjbHpKMko3RzdpYVc2?=
 =?utf-8?B?dWN0andYT1VLVzNSODVsbnhPTTc0QUZlY1V4N0VuRzlZVjVQeWFsUThQMXk2?=
 =?utf-8?B?Yk9hTW5RMjRjU1p5Y0grdWVVZzhrdnE5a0tTa3ZLdWV5b05EOGZXclQ2Vzlu?=
 =?utf-8?B?SkFuK2RkamlsSmRVT3RyNDMyUXFNbXBIN2ZZWjJmSWYyaURCYVhlNVdLUXk3?=
 =?utf-8?B?THhEZ1VGN0FqaTM0SjVOV0xwVGlMVWorVWVUTGRxMk41ZGl4YVRla2djZGtk?=
 =?utf-8?B?bVp3c2s1SVRkTGRNVEdBSEtNUkloUFBDR3JaV2hhVEVGS3pmalM3Uy9lTTJr?=
 =?utf-8?B?eHY0RHlDaEJmMTIyckQrWFpKelIrem5YRjNTOGZwaEsyd2lWYTR1L29zNjc0?=
 =?utf-8?B?ZzRLbWxURVN0ZHpnYUR6aUlzVUswUDAxMk9iZEk2b2tsKzFRU2gyOFNjNjVy?=
 =?utf-8?B?UmxSaFVLYVM4MWN6ZS8yR0dsYngvaXgvN2VJV2lPZjVHdXNLM3NmNWN4cDhv?=
 =?utf-8?B?RDU2cU12Y3hkQmRwWllkRDlsZm1iTUZPMzBVV0xpVVV1VHZNRnE0RGpxdThP?=
 =?utf-8?B?L3RMeWc3SllrNk1vMEFpTE9YVkpjVUpkdTJCWWUxeTBsdlhpOFV1eDBDZjZp?=
 =?utf-8?B?SWdTckpDQzdmSm1NNDlRTDhROHN4aTh0Nzk2ZUFwNGhEdmNuOVhEcjZ0R1lE?=
 =?utf-8?B?Q0MzZzl6Y0EzR2NyTTRiTTk2SCtiZEdtT01QamI1NnRPZTRRZGx3RFRFcmRn?=
 =?utf-8?B?aFdPNU1FUVJXWkRqYzYrNGxkSk1ObG1EVm1USW1JR0p2QkU5UDI4LzhqNklj?=
 =?utf-8?B?KzBaU1V1TU1DNkRna2JYOTZSRi9zTWhTVEtYaFFFNHJDZnlMa25SSEhDak9o?=
 =?utf-8?B?VDZlZ3UydHNmYmpDNTltc3BuVUk3ZlFzOTlWU3IySGYycEhnOUZrT0cvRHd4?=
 =?utf-8?B?Sm1KSEVXZ3REaDFGQmhQWUJFbEtnQUFVZjhDS0syUVdKL0UyakZVRmhFa2xI?=
 =?utf-8?B?QlNqdTlwNDU4dGVHRG9QcXMxVVRSVnQ0Wld3amhKVWZrU3FmcFh1RGNNMTFk?=
 =?utf-8?B?ZlB2RjlMWUZDbGV6V3BXT2phaDhtaEdZS0pBUVYyNk9CNGVBMTlOb3pXZVVC?=
 =?utf-8?B?SXhYMlE0ZWxVVHByaTFHRUcwMEkwSTZTYmtDZWh1NjNKd05HYjRyMG1DaEVj?=
 =?utf-8?B?L0Q3VVZaNjlzTTZBQWRGY2VFZXJRTGxuTFEzSVIzUmx5dm5lSVdpZEZJWmxW?=
 =?utf-8?B?WTd6YjVHN2dlYUVySmNsbVpYNkhpbXNoY2hUeHhHaXVFTm5lOWIrclpuQjEr?=
 =?utf-8?B?dm1FdE9XZEZiNUNWcmlncXY4cGhHQXdhbzhZMXBqNjhYb08wZjd3VDdza0dY?=
 =?utf-8?B?UFRGOWNmOXNPMWthTlY4VWp4SDBPdC83UVpMbE1FTTg1bEQwdytzOVphZDQz?=
 =?utf-8?B?ZjQxOGRlZ2wzSzFGd0Y5cVM0KzFhamZQZGovSjVMUUw4cWo0NXlrb2QyYVhq?=
 =?utf-8?B?TVBUb2V5SjluRTFKWHRIdWlxbndWYmhIM3VIeGxuSkdzQW5JcjVvRGlGM0VV?=
 =?utf-8?Q?ghXmnj+oUH3Kej0w/XxtVA64MlhO07vgF2zfCfr?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e33450-4e58-4a29-3376-08d8e8e7203e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 01:51:05.1100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1vMhJ4xFoiercyON8kxZ1TeQ5SoDzeVDZMCk8KoTWB9eOZBv3Chn6qhNAVI/GOYUuYhXrlEM2tmzmemAsIf2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR05MB7348
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8xNS8yMSA2OjM1IFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+IAo+
IE9uIDMvMTUvMjEgOTozOCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4gT24gTW9uLCBNYXIg
MTUsIDIwMjEgYXQgNjo1NyBQTSBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPiB3cm90ZToK
Pj4+IE9uIDMvMTIvMjEgNTowNiBBTSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToK
Pj4+PiBPbiAzLzEyLzIxIDEyOjAyIEFNLCBaYWNrIFJ1c2luIHdyb3RlOgo+Pj4+Pj4gT24gTWFy
IDExLCAyMDIxLCBhdCAxNzozNSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQo+Pj4+Pj4gPHRo
b21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IEhpLCBaYWNrCj4+Pj4+
Pgo+Pj4+Pj4gT24gMy8xMS8yMSAxMDowNyBQTSwgWmFjayBSdXNpbiB3cm90ZToKPj4+Pj4+Pj4g
T24gTWFyIDExLCAyMDIxLCBhdCAwNTo0NiwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQo+Pj4+
Pj4+PiA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEhp
LAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIHRyaWVkIGxhdGVzdCBkcm0tZml4ZXMgdG9kYXkgYW5kIHNh
dyBhIGxvdCBvZiB0aGVzZTogRmFsbG91dCBmcm9tCj4+Pj4+Pj4+IHR0bSByZXdvcms/Cj4+Pj4+
Pj4gWWVzLCBJIGZpeGVkIHRoaXMgaW4gZDFhNzNjNjQxYWZkMjYxN2JkODBiY2U4YjcxYTA5NmZj
NWI3NGI3ZSBpdCB3YXMKPj4+Pj4+PiBpbiBkcm0tbWlzYy1uZXh0IGluIHRoZSBkcm0tbWlzYyB0
cmVlIGZvciBhIHdoaWxlIGJ1dCBoYXNu4oCZdCBiZWVuCj4+Pj4+Pj4gbWVyZ2VkIGZvciA1LjEy
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gego+Pj4+Pj4+Cj4+Pj4+PiBIbW0sIHllcyBidXQgZG9lc24ndCB0
aGF0IGZpeCB0cmlwIHRoZSB0dG1fYm9fdW5waW4oKQo+Pj4+Pj4gZG1hX3Jlc3ZfYXNzZXJ0X2hl
bGQoYm8tPmJhc2UucmVzdik/Cj4+Pj4+IE5vLCBkb2VzbuKAmXQgc2VlbSB0by4gVEJIIEnigJlt
IG5vdCBzdXJlIHdoeSBteXNlbGYsIGJ1dCBpdCBzZWVtcyB0byBiZQo+Pj4+PiB3b3JraW5nIGZp
bmUuCj4+Pj4+Cj4+Pj4+Cj4+Pj4gV2l0aCBDT05GSUdfUFJPVkVfTE9DS0lORz15IEkgc2VlIHRo
aXM6Cj4+Pj4KPj4+PiBbwqDCoMKgIDcuMTE3MTQ1XSBbZHJtXSBGSUZPIGF0IDB4MDAwMDAwMDBm
ZTAwMDAwMCBzaXplIGlzIDgxOTIga2lCCj4+Pj4gW8KgwqDCoCA3LjExNzI4NF0gW2RybV0gVlJB
TSBhdCAweDAwMDAwMDAwZTgwMDAwMDAgc2l6ZSBpcyAxMzEwNzIga2lCCj4+Pj4gW8KgwqDCoCA3
LjExNzI5MV0gSU5GTzogdHJ5aW5nIHRvIHJlZ2lzdGVyIG5vbi1zdGF0aWMga2V5Lgo+Pj4+IFvC
oMKgwqAgNy4xMTcyOTVdIHRoZSBjb2RlIGlzIGZpbmUgYnV0IG5lZWRzIGxvY2tkZXAgYW5ub3Rh
dGlvbi4KPj4+PiBbwqDCoMKgIDcuMTE3Mjk4XSB0dXJuaW5nIG9mZiB0aGUgbG9ja2luZyBjb3Jy
ZWN0bmVzcyB2YWxpZGF0b3IKPj4+Pgo+Pj4+IFdoaWNoIHdpbGwgcHJvYmFibHkgbWFzayB0aGF0
IGRtYV9yZXN2X2Fzc2VydF9oZWxkKGJvLT5iYXNlLnJlc3YpCj4+Pj4KPj4+IEFoLCB5ZXMsIHlv
dSdyZSByaWdodC4gQWZ0ZXIgZml4aW5nIHRoYXQgSSBkbyBzZWUgdGhlCj4+PiBkbWFfcmVzdl9h
c3NlcnRfaGVsZCB0cmlnZ2VyZWQuIFRlY2huaWNhbGx5IHRyaXZpYWxseSBmaXhhYmxlIHdpdGgK
Pj4+IHR0bV9ib19yZXNlcnZlL3R0bV9ib191bnJlc2VydmUgYXJvdW5kIHR0bV9ib191bnBpbiBi
dXQgaXQncyBhIGxpdHRsZQo+Pj4gdWdseSB0aGF0IHNvbWUgcGxhY2VzIGUuZy4gdm13X2JvX3Vu
cmVmZXJlbmNlIHdpbGwgcmVxdWlyZQo+Pj4gdHRtX2JvX3Jlc2VydmUvdHRtX2JvX3VucmVzZXJ2
ZSBhcm91bmQgdHRtX2JvX3VucGluIGJ1dCBzb21lIHdvbid0IGUuZy4KPj4+IHZtd19tb2JfZGVz
dHJveSB3b24ndCBiZWNhdXNlIGl0cyBsb2NrIGlzIGhlbGQgYnkgdHRtX2JvX2RlbGF5ZWRfZGVs
ZXRlCj4+PiB3aXRob3V0IGEgdmVyeSBjbGVhciBpbmRpY2F0aW9uIHdpdGhpbiB0aGUgZnVuY3Rp
b24gd2hpY2ggaXMgd2hpY2guCj4gCj4gSXQgbG9va3MgbGlrZSwgbGlrZSBEYW5pZWwgaGludHMg
YmVsb3csIGZvciB0aGUgbW9iIHBhZ2V0YWJsZSBib3Mgc2luY2UgCj4gdGhleSBhcmUgcGlubmVk
IGFuZCBoZW5jZSBub3Qgb24gYSBMUlUgbGlzdCwgdGhlIHBhcmVudCBibyBpcyBob2xkaW5nIAo+
IHRoZSBvbmx5IHJlZmVyZW5jZSwgd2hpY2ggaXMgdXRpbGl6ZWQgaW4gdm13X21vYl91bmJpbmQo
KSB0byBtYWtlIHN1cmUgCj4gdGhlIHRyeXJlc2VydmUgYWx3YXlzIHN1Y2NlZWRzLiAodW5waW4g
Y291bGQgYmUgY2FsbGVkIGluIHZtd19tb2JfdW5iaW5kIAo+IGZvciB0aGUgcGFnZXRhYmxlIGJv
IGp1c3QgYWZ0ZXIgZmVuY2luZyBpZiBuZWNlc3NhcnkpLCAKClRoYXQncyBhIGxpdHRsZSB0cmlj
a3kgYmVjYXVzZSB0aGVuIHdlJ2QgaGF2ZSB0byBwaW4gb24gYmluZCwgb3RoZXJ3aXNlIAphZnRl
ciBtb3Zlcywgd2hpY2ggdW5iaW5kLCB3ZSB3b3VsZG4ndCBiZSBwaW5uZWQgYW55bW9yZS4gUGx1
cyBiaW5kIAp3b3VsZCBoYXZlIHRvIGNoZWNrIGlmIHRoZSBibyBpcyBhbHJlYWR5IHBpbm5lZCAo
aS5lLiBpdCdzIHRoZSBmaXJzdCAKdGltZSBiaW5kIGlzIGNhbGxlZCBvbiBpdCkgc2luY2Ugd2Ug
cGluIG9uIGNyZWF0aW9uLiBPciBqdXN0IHN0b3AgCnBpbm5pbmcgb24gY3JlYXRpb24gYW5kIGRv
IGl0IGV4cGxpY2l0bHkgaW4gYmluZC91bmJpbmQuCgpJbiBnZW5lcmFsIHdlIHByb2JhYmx5IHNo
b3VsZCBtYWtlIHBpbm5pbmcgZXhwbGljaXQgaW4gdm13Z2Z4IGxpa2UgaW4gCnRoZSBvdGhlciBk
cml2ZXJzIGJlY2F1c2UsIGFzIGlzLCB3ZSBzb21ldGltZXMgaGF2ZSB0byB0cmVhdCBwaW5fY291
bnQgCmFzIGEgYm9vbGVhbiAoZS5nLiBpbiB2bXdfYm9fcGluX3Jlc2VydmVkKSBiZWNhdXNlIG9m
dGVuIHRpbWVzIHRoZSAKb2JqZWN0IGhhcyBhbHJlYWR5IGJlZW4gcGlubmVkIGR1cmluZyBjcmVh
dGlvbi4gVGhpcyB3aWxsIGJyZWFrIGlmIHdlJ2xsIApoYXZlIGRybSB1dGlsaXRpZXMgdXNlIHBp
bi91bnBpbi4KClRoYXQncyBhIHByb2JsZW0gb2Ygb3VyIG93biBtYWtpbmcgdGhvdWdoLCB0aGUg
aXNzdWUgb2Ygd2hldGhlciBvciBub3QgCnRoZSBibyBoYXMgYWxyZWFkeSBiZWVuIHJlc2VydmVk
IGlzIGEgbGl0dGxlIG1vcmUgbXVkZHkgYmVjYXVzZSBoYXZpbmcgCm11bHRpcGxlIG5lc3RlZCBw
aW4vdW5waW4gc2l0ZXMgKGFzIGxvbmcgYXMgdGhleSdyZSBjb25zaXN0ZW50IGluIHRoZWlyIApt
YXRjaGluZyBwaW4vdW5waW4gdXNhZ2UpIGlzbid0IGEgcHJvYmxlbSwgYnV0IGhhdmluZyBuZXN0
ZWQgcmVzZXJ2ZWQgCmNhbGxzIGlzIGEgcHJvYmxlbS4gQWx0aG91Z2ggdGhpcyBtaWdodCBiZSBh
IGNhc2Ugb2YgYW4gb2xkIG1hbiB5ZWxsaW5nIAphdCB0aGUgc3VuIGJlY2F1c2UgSSdtIHRvbyBs
YXp5IHRvIHJlbWVtYmVyIHdoZXRoZXIgb3Igbm90IGVhY2ggY2FsbGJhY2sgCmlzIGFscmVhZHkg
Y2FsbGVkIHJlc2VydmVkIGFuZCBpbnN0ZWFkIHNob3VsZCBqdXN0IGFkZCAKZG1hX3Jlc3ZfYXNz
ZXJ0X2hlbGQoYm8tPnJlc3YpIGluIG1vcmUgcGxhY2VzIHRvIGNsYXJpZnkgd2hpY2ggaXMgd2hp
Y2ggCm9yIGxpa2UgeW91IG1lbnRpb24gdXNlIHRyeXJlc2VydmUgZXZlcnl3aGVyZS4KCj4gQnV0
IGl0J3MgY29uc3RydWN0cyBsaWtlIHRoYXQsIHRoYXQgcmVhbGx5IG1ha2VzIG1lIHRoaW5rIHdl
IHNob3VsZG4ndCAKPiBuZWVkIHRvIHJlc2VydmUgdG8gdW5waW4uCgpZZWEsIHRoYXQgd291bGQg
YmUgcHJldHR5IGNvbnZlbmllbnQuCgp6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
