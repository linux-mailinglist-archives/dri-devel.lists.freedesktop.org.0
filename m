Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D719316662A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62306E21B;
	Thu, 20 Feb 2020 18:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770042.outbound.protection.outlook.com [40.107.77.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEE56E21B;
 Thu, 20 Feb 2020 18:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dze05zmmSB2W33GSt1COguRkHcJl1N5n+/ZrYxMn7WUFYFINqZktsoE/ost1DYvcrsf/U+p20KqNB4vwPSkHSaol1oawZ1YrmDKLkCft5kg9Ba84JyxEKyJV3kr/H0f2MLkZajVUraG1FZn4mwXhaddDvaQWER4z+Bi1Inn0hI7O13TCbs8yWP1QbQJ0mNGy8sfLUc9B0pb81QZ3VOOEoLCqPllWzwmvwMEw5wEslE7joRF6SAbqVH0sjprhun+khIwFsk7yOQJd277QI7KX7k+wYxzTyo64Yp/UHn9sEWndpBDjmBBGCSz4iDVWUUFNJ7qXo34QQMpz07XxdTZFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHLB39TGmxH7hXPyv9oL2ck+Swv+fv/u0hTQbap5u7s=;
 b=J7YJrdkpajqpZbm2m26EVTcO3JAHUKtyhQgJHwUF355w3YP9cjz1YxY/qzmw22804coSQr4GXGFtjfCgAPTcGJ0goURCIUAlNWSdBbNe+rlPU+jtqZgVBlN4af7eNKWL7pIJNxPDkTo3psAtJzxhlleAwe7vPTVW8tF/8kGbaEgv3T+Fh6JmWdVsXb/6FSgNfSVC4PCtfAeXr2FIk5ulK2X+5SUEmSQOSzHDeZm6hC5sswxozAKSmLIBAkKBYBpII/N4CWS7fFOE0xNG4DDqKfOIBQe8pc8En8cR6AVQ9bK6FJMkLG2t5GYFjvXjSWc9QSDG99p3GWT6XSv4i686lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHLB39TGmxH7hXPyv9oL2ck+Swv+fv/u0hTQbap5u7s=;
 b=gRe9F11kj9cXQw2rDPLXIbIlIWlv2UwjCKDfppD+r/qF+6TXqD2bi24Svg5yCHSBEU5wN3lmw/ywxLQJaVg0EG7RATRNnJsi+K+RB2RkftaKbrcV7YMfQShUnoyx3WtLLO1hQl0l9StiSmOCvucbywU8SSU1C4a+hURlSkOuSFo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1323.namprd12.prod.outlook.com (10.168.237.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Thu, 20 Feb 2020 18:26:48 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2750.016; Thu, 20 Feb 2020
 18:26:48 +0000
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v2
To: Daniel Vetter <daniel@ffwll.ch>, Nirmoy Das <nirmoy.aiemd@gmail.com>
References: <20200219135322.56463-1-nirmoy.das@amd.com>
 <20200219135322.56463-7-nirmoy.das@amd.com>
 <20200220180955.GT2363188@phenom.ffwll.local>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <fae55ba8-5bfb-2f27-b708-f946141df039@amd.com>
Date: Thu, 20 Feb 2020 19:29:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200220180955.GT2363188@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM3PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:207::23)
 To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2c:5d00:8d2:968:f382:8499]
 (2003:c5:8f2c:5d00:8d2:968:f382:8499) by
 AM3PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:207::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Thu, 20 Feb 2020 18:26:44 +0000
X-Originating-IP: [2003:c5:8f2c:5d00:8d2:968:f382:8499]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 83e95570-90fe-4eff-f3b4-08d7b6327255
X-MS-TrafficTypeDiagnostic: DM5PR12MB1323:|DM5PR12MB1323:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1323D96670E157146A111C1B8B130@DM5PR12MB1323.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 031996B7EF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(199004)(189003)(110136005)(52116002)(5660300002)(316002)(31696002)(36756003)(16526019)(186003)(2616005)(66556008)(4326008)(31686004)(66476007)(66946007)(478600001)(53546011)(8676002)(6486002)(2906002)(81166006)(8936002)(81156014)(6666004)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1323;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kA29s+ohJRODrNhmLdNy7KJmInWaz0+yIYW3a2CMpJ1gJVUHrjvRLnUbyPt6kvhemfdw1MQ9N72Qh3zNXMj2M7aubuEpVkeOOBVm/TZa7ivn0MpkJlPPxrRzMzNcF+Rl5EKMHmPcK602/h9F376bE/z9xfcmza7VgEROKmFdyh+OnSY7Qi75RyxvBEzPt5NWW7Gq/INrBieUu+cdoxmG6ePqW9yoym0P1aM9FPsWORcRjlGKRpKaBMPr4YBmdqi92siSRJ/fZeDCJPJxSEUkiF2A6Md3l4Iv53V66RQzx2+CM+7tz2Z/tieVFOWIhprCDoZOGzZsxEfSsZa+D6KB7VZp3a+fhqavkoe9GaDpsxzM1sa1x8DeoelV9JFelRJXW+JTcNiP19o+ErUjGpSGaNF2NXNeLz55XwhcXxOakQuWmnXJ25y99jjMQe60duUD
X-MS-Exchange-AntiSpam-MessageData: /LmmdlabjZ5eBt6rVMWXahyX63lgSJ/tcBoH1cHvspQuq2/RYatC9nbxyRQaV6gUc0WBkV5gwM0xA5ytikG/dnMT/Vui2jHLFz+Hf8tff4eCFYygcXceofs3eofmAxG6C+HUBoQL1VnXHQMYyVYJxoS60ts8dZQ+qBZhr6IvdCw3UqX4W420AUCYrvpxlQ7mfpPXHsah8xdNNc+0gsRCUA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e95570-90fe-4eff-f3b4-08d7b6327255
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2020 18:26:48.2198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnFxwIFvof1OQCJoIbJ/NJW2OUQPqSTyBEYTqzVaHxxZgUrzFAo/MAAPvsjcyDZAurqehKYHeqgMZI9cIUz4gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1323
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
Cc: thellstrom@vmware.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/20/20 7:09 PM, Daniel Vetter wrote:
> On Wed, Feb 19, 2020 at 02:53:20PM +0100, Nirmoy Das wrote:
>> Calculate GEM VRAM bo's offset within vram-helper without depending on
>> bo->offset
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gem_vram_helper.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 92a11bb42365..3edf5f241c15 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -198,6 +198,21 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
>>   }
>>   EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
>>
>> +/**
>> + * drm_gem_vram_pg_offset() - Returns a GEM VRAM object's page offset
>> + * @gbo:	the GEM VRAM object
>> + *
>> + * Returns:
>> + * The buffer object's page offset, or
>> + * 0 with a warning when memory manager node of the buffer object is NULL
>> + * */
> We generally don't add full formal kerneldoc for internal functions like
> this. It won't get pulled into generated docs and generally just bitrots.
> Just informal comment if it's really tricky, but the function name here is
> clear enough I think.

Thanks for you review Daniel, I will remove that comment.


Nirmoy

> So with the comment removed:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>> +static s64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
>> +{
>> +	if (WARN_ON_ONCE(!gbo->bo.mem.mm_node))
>> +		return 0;
>> +	return gbo->bo.mem.start;
>> +}
>> +
>>   /**
>>    * drm_gem_vram_offset() - \
>>   	Returns a GEM VRAM object's offset in video memory
>> @@ -214,7 +229,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
>>   {
>>   	if (WARN_ON_ONCE(!gbo->pin_count))
>>   		return (s64)-ENODEV;
>> -	return gbo->bo.offset;
>> +	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
>>   }
>>   EXPORT_SYMBOL(drm_gem_vram_offset);
>>
>> --
>> 2.25.0
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
