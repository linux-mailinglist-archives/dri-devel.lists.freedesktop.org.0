Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D322D5564
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D2E6EA4F;
	Thu, 10 Dec 2020 08:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E201E6E196
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 16:37:45 +0000 (UTC)
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fd0fd540000>; Thu, 10 Dec 2020 00:37:40 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec
 2020 16:37:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 9 Dec 2020 16:37:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KX088axxPFi5m0q7HClqhjhA448MK63KogANZAyNJATjrVXfEp1wtzgMujfHGX1uN5ogRD4y5pm4CzFEILudlZafoOm0PIbInYAbwoHcsD9xDSESKYs51YNQgYPwTIMH7s2DvhYIBFBA0rxwUI3b3TmHYjJPf7VCYE/vHuEbN5bo0G4WmpEelq2CwG7+zGvLWwPQ8Xe55Wuuwo1qnRbxTod0umKTRcpyDL7BQ+GbW1iK1fvwiYiH0ll+u+3peAQSXB0Km9x/RnNGHkB+ioWvkAHOTkvzMg1pr/iD42RmpvkEoulWcX4izwgTHLWNRhpHKrbqCncnkQia28uqjoMrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdN06Jn5RZ2L7pzcPRvxGmDMfqDSUhcI65rFDOTlBzs=;
 b=D469Sxi6X5yfwuCz/Q+AYq+7ocObdzasiq/CxuNSQgq9iMByoSiQUSy97HWyAOex7tSb3+wapkfu9i3Amkj0br0xPEVsIYdV5xTHIgI5SASKTcOaJw55Wls9FE1WCh5m5HrLx/U6MlFp+IcZu+tlhEQsJvcHRlBQZC7rVfrCxcb0eBq2gFyva/32RL+oQ8NzqxIJCQ7rWmUwwvQPnTJ1ptmvF1Jokou4QK2PC3rfDehr5HtL6Kscrq20Ne8+PKMKZwBsXX/nf5EcqVNNePj4gRf4fikRNzh7LDo4LujRt82TaZKzBFw+35A8GxxgoFY0ZJGuzJ851QtI+LlxcIPR8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4619.namprd12.prod.outlook.com (2603:10b6:5:7c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Wed, 9 Dec
 2020 16:37:33 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1ce9:3434:90fe:3433]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1ce9:3434:90fe:3433%3]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 16:37:33 +0000
Date: Wed, 9 Dec 2020 12:37:31 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
Message-ID: <20201209163731.GU552508@nvidia.com>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
Content-Disposition: inline
In-Reply-To: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
X-ClientProxiedBy: BL0PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:207:3d::30) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL0PR02CA0053.namprd02.prod.outlook.com (2603:10b6:207:3d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 16:37:32 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kn2T5-008Iur-S4; Wed, 09 Dec 2020 12:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1607531860; bh=TBmBj241v4i50f5P46fbOQvt5MjeYfm1C2Kk86Vb+N4=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=KvoeTQzRCxi4HHyMzD681XBnbuyyFkZPQkF/94a7l3/fSfVWlsgXfiaAZ13vQjwmk
 d2ehr27zXtlVesyyhmlz/0NwNBgKqmfYN1GcwR2SZt1d+j0KNG9ozCae8QmsyAIMgR
 bA1JWzm1kBgWvRCHVfjcddWFdhHcmlj/Tp35s0PnvcIxuC1N3P7k0dXMoRxga9OKuA
 TQIoOAugcfI4GkHXAqhFLljMIwr8PAXMRErYwmFx4sYoue6cxMWyeWJ29eGGBTgYqJ
 n/iHGglO9Y3PivQP1Mn4uJm4IbqtlKOwbjLiGjcC/7pofuJhIWocZWRNmItAAeRgt5
 nReTxV+BVtIMg==
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMDksIDIwMjAgYXQgMDU6MzY6MTZQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiBKYXNvbiwgQ2hyaXN0aWFuCj4gCj4gSW4gbW9zdCBpbXBsZW1l
bnRhdGlvbnMgb2YgdGhlIGNhbGxiYWNrIG1lbnRpb25lZCBpbiB0aGUgc3ViamVjdCB0aGVyZSdz
IGEKPiBmZW5jZSB3YWl0Lgo+IFdoYXQgZXhhY3RseSBpcyBpdCBuZWVkZWQgZm9yPwoKSW52YWxp
ZGF0ZSBtdXN0IHN0b3AgRE1BIGJlZm9yZSByZXR1cm5pbmcsIHNvIHByZXN1bWFibHkgZHJpdmVy
cyB1c2luZwphIGRtYSBmZW5jZSBhcmUgcmVseWluZyBvbiBhIGRtYSBmZW5jZSBtZWNoYW5pc20g
dG8gc3RvcCBETUEuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
