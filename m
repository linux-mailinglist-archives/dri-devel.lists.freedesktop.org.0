Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A12AC051
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 16:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECD08951E;
	Mon,  9 Nov 2020 15:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E002D8951E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 15:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G31jMQcClnXGY3YMUEhhRZMF0m6RJbzo4rfVX3pQmqyFJneFJubCa8++dndMbQaKH+rrEycsL1RH5lRVU4jltuvhGsLNW2FEOHfWR3i30xDXQAGdCOJH7qT5TmycN07RpJNkr1VQSFAE3z13d3MFhXRPIIU70ReIPQjInZ7bUoUgHTZDxSXMzvMaPRdzXwJp+oOLbc9u3JV4aLY7ryVTD8Eaole+63Nwrv+x7uad1jEi5FN4LqQcBiSjC1ixKT5NJtZxhCWZTYqUifSAxBgeBXZ2oFSyO1uPbwf57DdGIzvt8Hg/Gn8SbvjnCwYqqk28Irtgb80eJIiZPOrPhcq2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BDQIA+gFxe+VZAdrQduBMJKknn57ZApt1U01SPKriM=;
 b=Yy17jvrGv8hKsbnSnMmsXXoQlWleQjCNks0+CLpQ1ixt/0f5R8fb9MFGzvqTKgw4UWaY6gJqGlXvYKYvjRkTCMRep+C6cA5R3gPjiY0uwB7A4hPDzcrzhQBX0om4ii06uZibUPPvOJalnM29nvmvKknZCB6YLLYAdm5c5P6iVpwTxawYZxRJx3Fo/8/Sl1xfUmfqNMXf4JU8BURwKwkoc4NibO3GhUjfq2LT99+sB7eH55swpY0u4zgR1wGZQ+Yo13kTCjADjOo2jiHSfkyy2nRCdn/oUAMgjqZlYvZntd/K2V5aoI8srV3J4Tq1DrS8iMZ6N7JInsJzAuIaDB0VvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BDQIA+gFxe+VZAdrQduBMJKknn57ZApt1U01SPKriM=;
 b=J3HZh32PSz0HLwDkTjowydA97ejzz1Ksss02N7iYdxzEp9/VSPfKpmn/h/gZIeHwEAo9REiMDj8WY7TiFi3hV9n5G3mMrX/RqYZKjAcrw3pGmJsKUcLqL9vhjm1XKhnmRp75dDuIq7ohQbO4dtwtli19IQ+1ba4ynJgSjf1gXlw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 15:57:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 15:57:33 +0000
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
 <20201109151650.GE6112@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
Date: Mon, 9 Nov 2020 16:57:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201109151650.GE6112@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.13 via Frontend Transport; Mon, 9 Nov 2020 15:57:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4bc56ca5-0cfc-4f65-03f1-08d884c82ba0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4304:
X-Microsoft-Antispam-PRVS: <MN2PR12MB430439E2707B6976AA451C8A83EA0@MN2PR12MB4304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eus7Z1YHXg3LQqvkc/dwS1Txzkt5GzvQgyuyIMuP0hZKJlkpgKActwr0HZHRqj7GoRdjNXCQU94ayoP0qT6NDM+9b6kX9r/eU6KO4QqBjmeMOVPyR2beGpDiWe1HJgmyMnj44db210R9pI7GuKJb3hlY2JH/3vt0p2UHzIUQaUQQwTYJ4oYFH6BQ+xvVE5iGT2mFIYT2sSRb5+t6kJ+dmdKM6aHN3JA1I8uP4qN0zKASeg9Yw33NIEEG4F2TalgsRPchSof1ffSr2oxHgViTOXYG2LFtnJrH71m5ya+9gmC+LpbC2lDSAwud911n5ml8slR1Jd1T+PLfxjTQnK3Y3H6seJRRjiX2YoXbR/BYC1qA3AmZF/sv7o9+NEGcdelt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(66476007)(66556008)(6916009)(31696002)(6486002)(66946007)(52116002)(316002)(86362001)(8676002)(5660300002)(8936002)(6666004)(4326008)(478600001)(2616005)(16526019)(186003)(31686004)(2906002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WFF5QUNXYkx6RVo5Kzc1dndrcjhERCtXVE14Z3g3RjlCbmRLTUJ1alVFS3pa?=
 =?utf-8?B?QlI2bUpOcXgvVUJqVjZobmRqU1gwemI3dk9lL0duRWl1NVJ3WTlWOFl6WnN6?=
 =?utf-8?B?REVXUmF4TFBuVVNlcXk0d00yckZ2TTZKV3pKVjl0bkd0WGZIZFVIbldKdy9J?=
 =?utf-8?B?TWdWS2l0dWl5VzlFMmRqSnV3ek1XSmgzTGJMbUtZTTlVU2Q0RmF1MVpBRyta?=
 =?utf-8?B?akFORlduTGZlRmovN2hmdkdkOXhhT2tXQkFwZVVQeVhOTHpOM1pwbEFoZzdU?=
 =?utf-8?B?V2RyYWVkY1ZBWTBaRDVCVnBQUFl5dVlFREF2Z01Fa1l5WThPT0R0RWo0QWZt?=
 =?utf-8?B?bExQVlRFdzhtZGptVHFlVjByTlRRY3IyNHc2OGRjbGxXaG83NjZ5ZjhTcUs5?=
 =?utf-8?B?WVpHVlZvekFqNmgwRWQ0d3dmQnNQVmR3QTBPNXo4ZmxTQjU2OWhTQ1ByZ3hM?=
 =?utf-8?B?RTF2WERFVElYSVZ0M3Q0UUI3NUUrNHI3OEJSRVUzV3FDZ2F3NFFValhiZlBY?=
 =?utf-8?B?WDNUM3VMcENTR3lPWTNxWjBtNmNkVk93TFpjT2pwbUNYWGxSNTRYQWs4ai9L?=
 =?utf-8?B?TWoyd200ZVVtd3NCVkQvRFlUM21DMTNhWXRDY0tPa2YxRERRcUxuVkp1VjNC?=
 =?utf-8?B?RDNwM3pWY3pud3dCTTh1TTdMUzdZZ1djajhMUFdJYzlQMVhweXpkazNDcEVD?=
 =?utf-8?B?NmcrYVZKTlNORXNrdVQwcVFuUUg1VTJKQVJXY0NxdW5pYjBjMk5vanZVcmVQ?=
 =?utf-8?B?aTlBZ0FRbGN2K0I5VC9PNkJYS0VXZ3gvUFBNcXZ6UzE4SFV6Y2UrejFGbm1O?=
 =?utf-8?B?Y3lPYTRBT3FkaU5HWmhaSHZGVDh4bkJzSk1IeHp0WHNBVW1ieEhOaXVicDIr?=
 =?utf-8?B?NU5FLzJzeGFZai9nT1o2Y094c3lndEZNMHErMGZrQThCWWowaWRabXc3YlZP?=
 =?utf-8?B?NkRFNmFQeEhTZnRNN1k3SE1NYjd2bmNSVU93VkticldSOG9oejVsNGVNbVBM?=
 =?utf-8?B?NzJsMlFTS1pmRW8wempVdVJsQUFwWldQRHA1ZlBqeWNjelNOWFI3Z3c4b0ZW?=
 =?utf-8?B?ZGRqSkRtSGxNUUJGZWQyUXl1cTJrOFBzZFI5V1E1N05Yd3JiOXUySGdBaVBB?=
 =?utf-8?B?ZXh1UVRWbGZ5RytHdG9KU3p6SERTd29kTis5TjFEdDFaQUo0d0Z2cHRFSGZa?=
 =?utf-8?B?WHlJRkV5K1FkMXd3Z0pEZ2wwRFp1bFo1SWg0QnBxck1hd0xONjhaUjdLeVdr?=
 =?utf-8?B?TTFURWNmQVdsMEJsS0p2VWJGblpDS1FHOHoxV2toM0g2NkVQZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc56ca5-0cfc-4f65-03f1-08d884c82ba0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 15:57:33.5776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fw2kGRw6A310j1c+z2MZefTNw0HBNNVnHc8c3U944thatC9LWb61NMTm3RjuAl+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTEuMjAgdW0gMTY6MTYgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6Cj4gT24gV2VkLCBO
b3YgMTEsIDIwMjAgYXQgMDY6MTM6MDJQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMDkuMTEuMjAgdW0gMDE6NTQgc2NocmllYiBEYXZlIEFpcmxpZToKPj4+IEBAIC0xNDMy
LDE1ICsxNDc5LDE4IEBAIGludCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX29wZXJhdGlvbl9j
dHggKmN0eCkKPj4+ICAgIAlpZiAoYm8tPm1lbS5tZW1fdHlwZSAhPSBUVE1fUExfU1lTVEVNKSB7
Cj4+PiAgICAJCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IGZhbHNlLCBmYWxzZSB9
Owo+Pj4gICAgCQlzdHJ1Y3QgdHRtX3Jlc291cmNlIGV2aWN0X21lbTsKPj4+ICsJCXN0cnVjdCB0
dG1fcGxhY2UgaG9wID0ge307Cj4+IFBsZWFzZSBhbHdheXMgdXNlIG1lbXNldCgpIGlmIHlvdSB3
YW50IHRvIHplcm8gaW5pdGlhbGl6ZSBzb21ldGhpbmcgaW4KPj4gdGhlIGtlcm5lbCwgd2UgaGFk
IGVub3VnaCB0cm91YmxlIHdpdGggdGhhdC4KPiBXaGF0IHRyb3VibGUgaXMgdGhhdD8gSSd2ZSBu
b3QgaGVhcmQgb2YgYW55dGhpbmcsIGFuZCB3ZSB1c2UKPiA9e30gcXVpdGUgZXh0ZW5zaXZlbHkg
aW4gZHJtIGxhbmQuCgo9e30gaW5pdGlhbGl6ZXMgb25seSBuYW1lZCBmaWVsZHMsIG5vdCBwYWRk
aW5nLgoKVGhlIHJlc3VsdCBpcyB0aGF0IGZvciBleGFtcGxlIHdoZW4gZG9pbmcgYSBoYXNoIG9y
IENSQyBvZiBhIHN0cnVjdHVyZSAKeW91IGNhbiBjb21lIHVwIHdpdGggZGlmZmVyZW50IHJlc3Vs
dHMgZGVwZW5kaW5nIG9uIHRoZSBhcmNoaXRlY3R1cmUgCmFuZC9vciBzdHJ1Y3R1cmUgbGF5b3V0
LgoKQW5vdGhlciBwcm9ibGVtIGFyZSBpbmZvcm1hdGlvbiBsZWFrcyBmcm9tIHRoZSBrZXJuZWwg
dG8gdXNlcnNwYWNlIApiZWNhdXNlIG9mIHRoaXMuCgpCZWNhdXNlIG9mIHRoaXMgTWVzYSBmb3Ig
ZXhhbXBsZSBzdHJvbmdseSBkaXNjb3VyYWdlcyB1c2luZyA9e30gZm9yIAp6ZXJvaW5nIGEgc3Ry
dWN0dXJlLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
