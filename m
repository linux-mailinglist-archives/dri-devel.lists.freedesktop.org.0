Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E3932B589
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 08:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39966E8CB;
	Wed,  3 Mar 2021 07:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2846D89E36
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 07:30:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xn/ZQ7WGHAKr8ssKI5aYT6+l9tUs04Kl1ndy7fgCis1Y9Gj/1tLCWLjunNeZkKXEiSQPpwA6moNGqg88bn1BpSSNRn6wZAQ0ThKuPZ0RjQ8J23PJNMgHy/nQTICaiJA3ngPW+5EKgkBXfMVdNZ4MSCSR1pUsY58WaylE1H62wszbwuxUoOvJ21OdiQG45tSdIqXV6F/wLoo2vqf0MtfPBYnEijr4JfdezWSC+yIBY4mwXzQmjJKukg4MbIttm9OfAvoZRtTjJYGgP4eFwq6ePg8oMihLI8PZsWl3aTNXdKNPyKy92Qt2I6JeXZw52FEPAX8H3v36r3MkU0LCjTEXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7grWKGIjJpZyZXAY2fTWltNpcjyr6EJe3zNUn4wCh/E=;
 b=mArCRaVU5tutmiXLsJZQfzM5rAK0BUYjE5oPOxqzMzto3DfWdthSfKFltGR9HgFMdu0iJ2UBQVHBvzPiOCzbUW7PtW/vYbzWJpdWjSFZF91EUIyyKAsB4xZiM7Q3NJ/1CrW0P1WKBl79a5vlyuIQaGy32nvJgFMGUuw/bEnWoLEKaZlDKfnJtyPCZJYZrHNzh+cFTUKwLTP+58QBXSFuNgweNgAtub9PBLdjZx/+n36wa20CcTgdRh7Z75hhVHfHOYzI1tt4n9kOlHYxkeJFwUReWzeacEBkmqA+qNI+6zmdii8ShhWCqaewmUBnKobH6DPi4OfBG12wY29eAkwx4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7grWKGIjJpZyZXAY2fTWltNpcjyr6EJe3zNUn4wCh/E=;
 b=VgCQlmjiwHO5V/GAbt0kfWbpEImP9B8xLHfnIC5tRRNq/9Av4kfndbnYv2W7cSYIYVdktl4ONr8Au9zikhwF4ozzicAWUIZxloLZT8oNFUNrX882XtAR4NPSlhDyht7XCpZf4lLfavNMjDxl/MVtTPtR+2OjoXVskO7jKm4uLWM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4740.namprd12.prod.outlook.com (2603:10b6:208:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 07:30:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.017; Wed, 3 Mar 2021
 07:30:40 +0000
Subject: Re: [PATCH] drm/ttm: Fix TTM page pool accounting
To: Anthony DeRossi <ajderossi@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210303011723.22512-1-ajderossi@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b289a10c-c84e-20de-7ad9-47fa13ef7468@amd.com>
Date: Wed, 3 Mar 2021 08:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210303011723.22512-1-ajderossi@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c1c9:255f:21eb:6396]
X-ClientProxiedBy: AM0PR06CA0135.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c1c9:255f:21eb:6396]
 (2a02:908:1252:fb60:c1c9:255f:21eb:6396) by
 AM0PR06CA0135.eurprd06.prod.outlook.com (2603:10a6:208:ab::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 07:30:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 274926dc-abd8-46c5-bd7b-08d8de163f25
X-MS-TrafficTypeDiagnostic: BL0PR12MB4740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4740668C920D247FD596000683989@BL0PR12MB4740.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VwxSS4dVdiGiiNmrhd4BtrTEqUNC0/PZpOs9xYD71ov7KEdAZ3biJ9akncrATx3Q2bO5A8A5LSn/EVwk4YO0NsWQmDsv0Ftxc2k4W34EdMW0pzCKrO0UJnZBkhq6kUkbLVmTnORmUNY6SS9b+2N+d+pxCI0q3fRB3v7x3PaoJXaj747chCuBma/WP+0i1ATSmFKzDE4eS3zZPRpYDfRwkBwdFYfS3jIY6kUAD6zy6o6zx2aWWzUSwrTfxSK9hXry7d50n8f/uHeVsvDzPJGGI4LrGG7OLo3g1L6F0LFmzQAdxcJFnjfQn1buUSm/R8zQXM6CYJ/MnPfXPZ5ckZNCm9WHmHPpBWQ/P7MdaUGpe6UHaXlw3U75i/eWkwpOD2IuuSHRB3fvgW+I5P0RVZMHVV9rxUTnPImKkQn+t4osjVFqqWJ6yf0A4nNg5ESoXdzI0FQP/n4z1611JQUArl8SR8YzTE0vidVhTvj8uYklZ4FVd5nj6dyO4VXRX7AI7+qRjIx+sTj/3oj7dz+3DoL29LxMywsvfUTks7SkAwtjjUB3wMtRmWO66kbsIAkCHUeOSdFwePcSmnqXzJFRGbgdBBh0mrcb0xJRWYY2aUCju3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(66574015)(316002)(83380400001)(66556008)(16526019)(66476007)(31686004)(15650500001)(8676002)(66946007)(36756003)(31696002)(6486002)(86362001)(2616005)(186003)(8936002)(478600001)(2906002)(5660300002)(52116002)(4326008)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFNMZU94NzFTMTBhTEpzNUZUN0VuQ0JHNmVSMkh6V0FvL3dmM2dscVJscllM?=
 =?utf-8?B?eXBjTVNuc0txK21POS96dmtlM25tcUw3VzFIWmtXNlFxWFlpMHg2WU8zV3Zh?=
 =?utf-8?B?VW1idmRxZjcrOUh0S211SnFQVTdiQmcrWnVOY3dta0R2QnZYVmVUOUk0ZjdG?=
 =?utf-8?B?OHIyaURTNklJVG5NWjdOS0c3UkpkRHQ2ZVdBZElzamJ2aDdnWkZYT3p4QzY2?=
 =?utf-8?B?RUVSRlU0c3hYN1gxdFRFOUVJY2VIdVNuYWltcXM0MHR4aDJ0SzNZRGZvT3hH?=
 =?utf-8?B?MVZnV0Vnd0pUWGk2UUswdlRtd1hwTmdaRFpkSmZMRG1LTVFQUWFtekhpU016?=
 =?utf-8?B?QllJdmJhM3Q2UlVPaG5xbE5BUG5sUGxLUm9Tcms0aFgyMnk5UEU3d1ZnM1pT?=
 =?utf-8?B?NDVOZ0l5bU1yK0NVbkp2cktCd0t6LzNvcFpDa1RyOVJ6dnhJUEREa3U5V2xS?=
 =?utf-8?B?WEdRRnBjQUhGb2p0TFFDbTBFeWtRUDRKakJYaUM4MFBTQWZXRHVIc2NQVHhX?=
 =?utf-8?B?ekMwR2htV2tpaXF5eDNUTEFoK250V2tLeVpXYXoxU09kTTRIaGl1VmhYVHBB?=
 =?utf-8?B?Qit3VURCMkttNHplM3ZiaFVFUVMrdjdpbzNtMzNpOTdpS09ISHRHU042ckZC?=
 =?utf-8?B?bHZwSmVkbmZDSTdWZE1nOGJyVzFhNFJYZDZXNmdoL25VMHByeFBYQXVETFFp?=
 =?utf-8?B?QjI0VlR1NUExN1krMDUzMnl2c2dsSWpHeGtsYjdZWUVYZTFWRVJ4UHJJQ0Q2?=
 =?utf-8?B?VXk4MS9ldHpQaVNKQ09rUnhVWjhnOWJvSUdHNk5SVFJsUGJVSzVaMWorVklu?=
 =?utf-8?B?ZU9WSDdJM1J2SE40OHRxeExKa0xWSlRDdmhqMzJTUUhabzRxcnhEZjQ3TU5P?=
 =?utf-8?B?R0h6K0FvMEcxMFNGdDRvUkk1V0RUQnk0MmIzcU54ODNYYVFwbnpYMG0weTU0?=
 =?utf-8?B?ckhpamdsNmMxalY3RGJxVDEzLyt2WE9najBOMTJJSjZNdFI5SHlGWkZxWFVV?=
 =?utf-8?B?Y28yT1VRSEV2MFhxQ1ByM0htOHlrdWdsRWVoU2t3WjVsMHlxMFJISE5uNmxk?=
 =?utf-8?B?eE1KMTA2eTI4MnBZV3N2MHhtc3pKVktBL1NkM2s1dkpDL0U5TWdOUEpQUlFl?=
 =?utf-8?B?c0YyUUhGMGZMQkt0akplUXhkZ0kveHBwS0R0YllnOEJQSW1Vd2tIemdFRG95?=
 =?utf-8?B?aXMxanVuTGtpdVp6dHJwUE1xZUQyMFh0NWltR1FXY0k4L0tmZjFoNUxUR25v?=
 =?utf-8?B?RVo5aHkwdG13c25hdkNyT1d4c3RuRDEyTG5jZ2lvUTFiWFFpVWhCWVdUOEFM?=
 =?utf-8?B?QlVLTktmVHNIQ2p0cWUzVlQ2SWsyNXZ0Z0NFRnk0a0hyZ2ZLQjZtOXVzWVVj?=
 =?utf-8?B?QlZZSk55VzJSR2hDUjc4bUszVFVFaDNTTm1qd3N2Vmc3MFBNbzVzcnd6SzlP?=
 =?utf-8?B?dkpKdm9TQW1BTUlISUFMRHJPZkl2RWxXaWRGa1pkYlJNcWlsZUJxWEhkeWJH?=
 =?utf-8?B?NWNwT0JoTzFpd2N1NDdnSGYySmNUNU5keTdobTJRYXJkSFlvbi83RjQ5eWRI?=
 =?utf-8?B?OS9WRXJwMGo3Z01FSURsWVQyYzRuZVo1L1VoQkVJNFlUM3R3eE56RThiNHFS?=
 =?utf-8?B?ejk4VHVKT2l0dzVOSW9DRXFvcXNjbTQzTWtXdG9qaDhwTVZ6Ym5SckFKNExq?=
 =?utf-8?B?VzNOUE4vbHMycVhPanIwcFJPV2UxRWFyaUw3VHdyTDIzRnBhVG9lSHFTMTM2?=
 =?utf-8?B?R2U4U0N0RFkrcU94ZFRBdlpyMndZNE9oSXZvUm9QcHB5S2g5Z0NkNXMzWnhK?=
 =?utf-8?B?VDZUTDRuV0RMT3FDQld4eUczdkw5Um9sL3hqM0ZZcjhQaFdydEhEUzloUkhG?=
 =?utf-8?Q?pBx9h6AJayBNR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 274926dc-abd8-46c5-bd7b-08d8de163f25
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 07:30:40.5128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4y19aibgGL09jECQKAV9yDKQH/Mv1S614hr2nbXGUGOzGja32cdL+X7RycW7kywI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4740
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
Cc: madhav.chauhan@amd.com, airlied@redhat.com, ray.huang@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMDMuMjEgdW0gMDI6MTcgc2NocmllYiBBbnRob255IERlUm9zc2k6Cj4gRnJlZWQgcGFn
ZXMgYXJlIG5vdCBzdWJ0cmFjdGVkIGZyb20gdGhlIGFsbG9jYXRlZF9wYWdlcyBjb3VudGVyIGlu
Cj4gdHRtX3Bvb2xfdHlwZV9maW5pKCksIGNhdXNpbmcgYSBsZWFrIGluIHRoZSBjb3VudCBvbiBk
ZXZpY2UgcmVtb3ZhbC4KPiBUaGUgbmV4dCBzaHJpbmtlciBpbnZvY2F0aW9uIGxvb3BzIGZvcmV2
ZXIgdHJ5aW5nIHRvIGZyZWUgcGFnZXMgdGhhdCBhcmUKPiBubyBsb25nZXIgaW4gdGhlIHBvb2w6
Cj4KPiAgICByY3U6IElORk86IHJjdV9zY2hlZCBzZWxmLWRldGVjdGVkIHN0YWxsIG9uIENQVQo+
ICAgIHJjdTogIDMtLi4uLjogKDk5OTggdGlja3MgdGhpcyBHUCkgaWRsZT01NGUvMS8weDQwMDAw
MDAwMDAwMDAwMDAgc29mdGlycT00MzQ4NTcvNDM0ODU3IGZxcz0yMjM3Cj4gICAgICAodD0xMDAw
MSBqaWZmaWVzIGc9MjE5NDUzMyBxPTQ5MjExKQo+ICAgIE5NSSBiYWNrdHJhY2UgZm9yIGNwdSAz
Cj4gICAgQ1BVOiAzIFBJRDogMTAzNCBDb21tOiBrc3dhcGQwIFRhaW50ZWQ6IFAgICAgICAgICAg
IE8gICAgICA1LjExLjAtY29tICMxCj4gICAgSGFyZHdhcmUgbmFtZTogU3lzdGVtIG1hbnVmYWN0
dXJlciBTeXN0ZW0gUHJvZHVjdCBOYW1lL1BSSU1FIFg1NzAtUFJPLCBCSU9TIDE0MDUgMTEvMTkv
MjAxOQo+ICAgIENhbGwgVHJhY2U6Cj4gICAgIDxJUlE+Cj4gICAgIC4uLgo+ICAgICA8L0lSUT4K
PiAgICAgc3lzdmVjX2FwaWNfdGltZXJfaW50ZXJydXB0KzB4NzcvMHg4MAo+ICAgICBhc21fc3lz
dmVjX2FwaWNfdGltZXJfaW50ZXJydXB0KzB4MTIvMHgyMAo+ICAgIFJJUDogMDAxMDptdXRleF91
bmxvY2srMHgxNi8weDIwCj4gICAgQ29kZTogZTcgNDggOGIgNzAgMTAgZTggN2EgNTMgNzcgZmYg
ZWIgYWEgZTggNDMgNmMgZmYgZmYgMGYgMWYgMDAgNjUgNDggOGIgMTQgMjUgMDAgNmQgMDEgMDAg
MzEgYzkgNDggODkgZDAgZjAgNDggMGYgYjEgMGYgNDggMzkgYzIgPDc0PiAwNSBlOSBlMyBmZSBm
ZiBmZiBjMyA2NiA5MCA0OCA4YiA0NyAyMCA0OCA4NSBjMCA3NCAwZiA4YiA1MCAxMAo+ICAgIFJT
UDogMDAxODpmZmZmYmRiODQwNzk3YmU4IEVGTEFHUzogMDAwMDAyNDYKPiAgICBSQVg6IGZmZmY5
ZmY0NDVhNDFjMDAgUkJYOiBmZmZmZmZmZmMwMmE5ZWY4IFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+
ICAgIFJEWDogZmZmZjlmZjQ0NWE0MWMwMCBSU0k6IGZmZmZiZGI4NDA3OTdjNzggUkRJOiBmZmZm
ZmZmZmMwMmE5YWMwCj4gICAgUkJQOiAwMDAwMDAwMDAwMDAwMDgwIFIwODogMDAwMDAwMDAwMDAw
MDAwMCBSMDk6IGZmZmZiZGI4NDA3OTdjODAKPiAgICBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjEx
OiBmZmZmZmZmZmZmZmZmZmY1IFIxMjogMDAwMDAwMDAwMDAwMDAwMAo+ICAgIFIxMzogMDAwMDAw
MDAwMDAwMDAwMCBSMTQ6IDAwMDAwMDAwMDAwMDAwODQgUjE1OiBmZmZmZmZmZmMwMmE5YTYwCj4g
ICAgIHR0bV9wb29sX3NocmluaysweDdkLzB4OTAgW3R0bV0KPiAgICAgdHRtX3Bvb2xfc2hyaW5r
ZXJfc2NhbisweDUvMHgyMCBbdHRtXQo+ICAgICBkb19zaHJpbmtfc2xhYisweDEzYS8weDFhMAo+
ICAgICBzaHJpbmtfc2xhYisweGNiLzB4MmYwCj4gICAgIHNocmlua19ub2RlKzB4MmM4LzB4NmMw
Cj4gICAgIGJhbGFuY2VfcGdkYXQrMHgyZjcvMHg1ODAKPiAgICAga3N3YXBkKzB4MTdjLzB4MzAw
Cj4gICAgID8gd2FpdF93b2tlbisweDcwLzB4NzAKPiAgICAgPyBiYWxhbmNlX3BnZGF0KzB4NTgw
LzB4NTgwCj4gICAgIGt0aHJlYWQrMHhmZi8weDE0MAo+ICAgICA/IGt0aHJlYWRfcGFyaysweDgw
LzB4ODAKPiAgICAgcmV0X2Zyb21fZm9yaysweDIyLzB4MzAKPgo+IGRlYnVnZnMgc2hvd3MgdGhl
IGluY29ycmVjdCB0b3RhbDoKPgo+ICAgICQgY2F0IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL3R0
bV9wYWdlX3Bvb2wKPiAgICAgICAgICAgICAgLS0tIDAtLS0gLS0tIDEtLS0gLS0tIDItLS0gLS0t
IDMtLS0gLS0tIDQtLS0gLS0tIDUtLS0gLS0tIDYtLS0gLS0tIDctLS0gLS0tIDgtLS0gLS0tIDkt
LS0gLS0tMTAtLS0KPiAgICB3YyAgICAgIDogICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgICAgIDAKPiAgICB1YyAgICAgIDogICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgICAgIDAKPiAgICB3YyAzMiAgIDogICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgICAgIDAKPiAgICB1YyAzMiAgIDogICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgICAgIDAKPiAgICBETUEgdWMgIDogICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgICAgIDAKPiAgICBETUEgd2MgIDogICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgICAgIDAKPiAgICBETUEgICAgIDogICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgICAgIDAKPgo+ICAgIHRvdGFsICAgOiAgICAgMzAyOSBvZiAgODI0NDI2MQo+Cj4gVXNp
bmcgdHRtX3Bvb2xfdHlwZV90YWtlKCkgdG8gcmVtb3ZlIHBhZ2VzIGZyb20gdGhlIHBvb2wgYmVm
b3JlIGZyZWVpbmcKPiB0aGVtIGNvcnJlY3RseSBhY2NvdW50cyBmb3IgdGhlIGZyZWVkIHBhZ2Vz
Lgo+Cj4gRml4ZXM6IGQwOTlmYzhmNTQwYSAoImRybS90dG06IG5ldyBUVCBiYWNrZW5kIGFsbG9j
YXRpb24gcG9vbCB2MyIpCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBEZVJvc3NpIDxhamRlcm9z
c2lAZ21haWwuY29tPgoKR29vZCBjYXRjaC4gUGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkdvaW5nIHRvIHB1c2ggdGhhdCB0
byBkcm0tbWlzYy1maXhlcyBmb3IgdXBzdHJlYW1pbmcgaW4gYSBtaW51dGUuCgpUaGFua3MsCkNo
cmlzdGlhbi4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgfCA0ICsr
LS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fcG9vbC5jCj4gaW5kZXggNzRiZjFjODRiNjM3Li5mNmRmNzkwMzQ4MDUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCj4gQEAgLTI1OCwxMyArMjU4LDEzIEBAIHN0YXRp
YyB2b2lkIHR0bV9wb29sX3R5cGVfaW5pdChzdHJ1Y3QgdHRtX3Bvb2xfdHlwZSAqcHQsIHN0cnVj
dCB0dG1fcG9vbCAqcG9vbCwKPiAgIC8qIFJlbW92ZSBhIHBvb2xfdHlwZSBmcm9tIHRoZSBnbG9i
YWwgc2hyaW5rZXIgbGlzdCBhbmQgZnJlZSBhbGwgcGFnZXMgKi8KPiAgIHN0YXRpYyB2b2lkIHR0
bV9wb29sX3R5cGVfZmluaShzdHJ1Y3QgdHRtX3Bvb2xfdHlwZSAqcHQpCj4gICB7Cj4gLQlzdHJ1
Y3QgcGFnZSAqcCwgKnRtcDsKPiArCXN0cnVjdCBwYWdlICpwOwo+ICAgCj4gICAJbXV0ZXhfbG9j
aygmc2hyaW5rZXJfbG9jayk7Cj4gICAJbGlzdF9kZWwoJnB0LT5zaHJpbmtlcl9saXN0KTsKPiAg
IAltdXRleF91bmxvY2soJnNocmlua2VyX2xvY2spOwo+ICAgCj4gLQlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3NhZmUocCwgdG1wLCAmcHQtPnBhZ2VzLCBscnUpCj4gKwl3aGlsZSAoKHAgPSB0dG1fcG9v
bF90eXBlX3Rha2UocHQpKSkKPiAgIAkJdHRtX3Bvb2xfZnJlZV9wYWdlKHB0LT5wb29sLCBwdC0+
Y2FjaGluZywgcHQtPm9yZGVyLCBwKTsKPiAgIH0KPiAgIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
