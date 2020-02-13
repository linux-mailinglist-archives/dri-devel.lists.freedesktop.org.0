Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FA615BE6C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 13:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8FC6EB41;
	Thu, 13 Feb 2020 12:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1E36EB41;
 Thu, 13 Feb 2020 12:29:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9rx1PexSvokKBcGkJ5F/sTlmssP4SZedPPNswHaGxq72NsfoiwisQots41Cd9ndbGievDWPgqeeHHdFpyfM3lICO/pzqcEP7AGCyWOtbAsR/oxV+fiL72Ii3by/STIcGkxjoWfX7VtaLWYFz0J6lMrn6JhDKr85ffNugc2WjdKrrhVQcV4ekybFoWJSWIjKHErp1vKRLvhgyV9h2dpibjZU0apq3YU5RwU/8UKr0ggwLsD+40m014Lfds/BNJ8JUsBHQDpwK60heBk/lD4LQB+kZWWHXWmwF/0YF54J4+Brp57CfyoIygyHwxpgTTmLfglKgP/jmp8GihU/croWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udqMYAZOy+oDslzXlduTLWqQgC0dSDcw76DcUs8BYJI=;
 b=M5Y5nzTgUshdViAkK7+7XTZcLb037bFHHqjGOEj+1w5+nSvG+j4n+pkyxuNySInQSwSxHJSsfxu6L2q+/WCCRj0Ya9gAC/aB9r9KH8AYPbMRI4O86yRZy0XDkIt4M4WYH+3pa+L7YwwtcW+7aSarfcTKu7rNbaLFurh8ZLHneHqKcYJdD0AnYZziaamnY2bLMMbYLp52AmmBZdHq7Sxop06tBrZSplixV4xR3PoyL3vcKPhJMeQwyt+lhiixekwNoCbqTMSg2OImO/04fhsgF9pUqS1Vxx+6XQqAVD3N58nC1CTHpRKKDBHq0YdPfPJognZMavFOh+0GMzOhgFa9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udqMYAZOy+oDslzXlduTLWqQgC0dSDcw76DcUs8BYJI=;
 b=dvoA0ozrGHA6FiDLIji/FwsRYNckLYRSNI4KARxVZo6vAT1aAjLPfFfdp+AgKUrIcUpMrizg8DYrD/LABfFWjq1rUFOs5plnRzs/KRpXVDwWXJLUWcw9XvQVBp0mofo8BG+o7/2F09SHN4PmEo4fr+gXPVn0Ju+hyzlaiYX5wmg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1257.namprd12.prod.outlook.com (10.168.237.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Thu, 13 Feb 2020 12:28:59 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3%6]) with mapi id 15.20.2729.024; Thu, 13 Feb 2020
 12:28:59 +0000
Subject: Re: [RFC PATCH 2/6] drm/radeon: don't use ttm bo->offset
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-3-nirmoy.das@amd.com>
 <21dc2b96-fd7d-19e4-bda6-ebdae2051435@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <bacde18d-3db6-8752-a4ba-2fddf0e406a0@amd.com>
Date: Thu, 13 Feb 2020 13:31:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <21dc2b96-fd7d-19e4-bda6-ebdae2051435@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR04CA0136.eurprd04.prod.outlook.com (2603:10a6:207::20)
 To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f2a:5e00:4db9:9f42:976e:8a13]
 (2003:c5:8f2a:5e00:4db9:9f42:976e:8a13) by
 AM3PR04CA0136.eurprd04.prod.outlook.com (2603:10a6:207::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Thu, 13 Feb 2020 12:28:56 +0000
X-Originating-IP: [2003:c5:8f2a:5e00:4db9:9f42:976e:8a13]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7136a5da-d629-43bc-9467-08d7b0804d26
X-MS-TrafficTypeDiagnostic: DM5PR12MB1257:|DM5PR12MB1257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB125782C85AA4CA5EC46034268B1A0@DM5PR12MB1257.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(346002)(366004)(376002)(136003)(189003)(199004)(7416002)(36756003)(2906002)(478600001)(4326008)(52116002)(8936002)(5660300002)(8676002)(31686004)(81166006)(81156014)(2616005)(316002)(53546011)(4744005)(31696002)(66946007)(66476007)(66556008)(110136005)(16526019)(186003)(6666004)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1257;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q63U4w6U9aUyfQIhz5ovkbId31m6J8zv3xOrnCZYcMtruJMQyq77g0Qc0LxOAtzVIKRhTMfnb9pxlRqYE4zFQ/TRkxvvSWTfh3Jh/cehiqxYiQXZt0EAPuuX2TKve8+Y33VdaR7DCO3VRYyv4G9AbVXis2WcGpLZNy62p7m/dsSck02pP5KYL6356AQuCFcp00eWbXz1985CefIJ93H6C6MUs6C43bILFzYsFp+qZmmEIXE4W0mBRUwlnC8oZSHJ/k7/2u1TFtmUZrtBpE+kStFLW7Wcaehm6oJYa7una9aDozDe5TUu2Sn4ou+pJtsOsnswZW8nDQR2GJAft+E0/3lrnTZ5dujlaZaHLGpb5ixDnczaNKkGwkbdayRgLmJfSemJSSv3R4rlP4G4XD6ZnoKDNcf5qrVsD92lvHNV7Y3VushClqGqP/7LfQbLj7r/
X-MS-Exchange-AntiSpam-MessageData: zdfDR7f5cXmvL7ruarr2oJhYIgelwd4HdZnUjn4ncWO6nKxQY9XWgllpWTH0PH1+1UHiTR+RNnM1lmJkjaFF2zqSaCWekr/H7kK67Hf11C/cskVOacWlkz3oPE5TISoBbzL5Bgu85FZ2WTYzieCsV+2aJybYSAvl24rdNcQ4I9vTFmdDdQVQSknh6WR34zYW+NMqgi2uDZFKjpVUimUyJA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7136a5da-d629-43bc-9467-08d7b0804d26
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 12:28:59.5149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1k8fC2P+etVc4LDwHedIfrG9dw6tfmwcHcVSwOvTaovGaTKA6M7JLytLymZu8Yu7IfWkij7KwsyKhvx/t+sQTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1257
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTMvMjAgMToxOCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBMb29rcyBsaWtl
IG1vc3Qgb2YgdGhlIHBhdGNoIGlzIG1pc3Npbmc/Cj4KPiBXZSBzaG91bGQgaGF2ZSBxdWl0ZSBh
IG51bWJlciBvZiB1c2VzIG9mIHRoZSBCTyBvZmZzZXQgaW4gcmFkZW9uIG9yIGRvIAo+IGFsbCBv
ZiB0aG9zZSBnbyB0aHJvdWdoIHJhZGVvbl9ib19ncHVfb2Zmc2V0PwpDb21waWxhdGlvbiB3b3Jr
ZWQgc28gSSB0aGluayBhbGwgdGhvc2UoYm8tPm9mZnNldCkgYWNjZXNzZXMgd2VudCAKdGhyb3Vn
aCByYWRlb25fYm9fZ3B1X29mZnNldC4KPgo+IElmIHllcyB0aGVuIHRoZSBjaGFuZ2UgaXMgbXVj
aCBzbWFsbGVyIHRoYW4gSSB0aG91Z2h0IGkgbmVlZHMgdG8gYmUuCj4KPiBDaHJpc3RpYW4uCj4K
UmVnYXJkcywKCk5pcm1veQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
