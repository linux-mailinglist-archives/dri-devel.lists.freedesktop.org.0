Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889CAC9A152
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 06:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3BD10E51E;
	Tue,  2 Dec 2025 05:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="N+q0QY+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC1910E51E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 05:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764653204; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Q4r2eBMBXqaObxFnXuxdAZoEXV9GuWh4iMw7Lc6qItVbrKIqxD4wiMqck8TxhhZnsNw2lA/VKB1UNc4jjY2vrogo6q4u43LKRQwcfjQA8Zhf4uoOsRKPrLtoOxyWWFa9uxDPOTpHf0+M5qjhqjFQfKMcJ652QqIE32g0IqV2PeQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764653204;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=UbgD+cMYVyOXRkI9UuWivnMM1V5+yLkxHXkxhjkv2dw=; 
 b=B5wJAUBdVzVfSAeh4T02Wpq9Ftc8DL6g8xvVhE4ZUuRohwJy7rVdUDPOOMSZnVFnSlgeW8F+HyRPZCJCvXpdkBKW6wEIiXTRM0dNcjnA4v9GxD7R/vJtR+Jwqs8uMQ3EAKoln2tbUj/XXaJF9IEzjQ1VQ1H4LcxLg10FBYQfeN0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764653204; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=UbgD+cMYVyOXRkI9UuWivnMM1V5+yLkxHXkxhjkv2dw=;
 b=N+q0QY+H81P1ZlA4CWyRPue6tRpcZHumwY98bNyO6hlTjBkoWy5NGXEvjLxiUp4E
 OKMScMSGs911dNZOQ5dS+Z1ufYine0KoQhOm+TokdcwojHaKApt9QMPXK6EYQSkHpyp
 HHhOR/Do0KRQJhqiavOxJlXTxp0AksWjdGduumb8=
Received: by mx.zohomail.com with SMTPS id 1764653201114296.2155107562611;
 Mon, 1 Dec 2025 21:26:41 -0800 (PST)
Message-ID: <6cb70a20-c9ed-49aa-91e6-dc87005c7792@collabora.com>
Date: Tue, 2 Dec 2025 08:26:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/1] ACPI: PM: s2idle: Add lps0_screen_off sysfs
 interface
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Beckett <bob.beckett@collabora.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: linux-acpi@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Richard Hughes <richard@hughsie.com>,
 William Jon McCann <mccann@jhu.edu>, "Jaap A . Haitsma" <jaap@haitsma.org>,
 Benjamin Canou <bookeldor@gmail.com>, Bastien Nocera <hadess@hadess.net>,
 Lennart Poettering <lennart@poettering.net>,
 Antheas Kapenekakis <lkml@antheas.dev>
References: <20251202043416.2310677-1-dmitry.osipenko@collabora.com>
 <20251202043416.2310677-2-dmitry.osipenko@collabora.com>
 <1654cfc3-ff8a-4f7f-9929-0442f2b3bb2b@kernel.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <1654cfc3-ff8a-4f7f-9929-0442f2b3bb2b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/2/25 07:43, Mario Limonciello (AMD) (kernel.org) wrote:
> ++ dri-devel
> 
> On 12/1/2025 10:34 PM, Dmitry Osipenko wrote:
>> Add `/sys/power/lps0_screen_off` interface to allow userspace to control
>> Display OFF/ON DSM notifications at runtime. Writing "1" to this file
>> triggers the OFF notification, and "0" triggers the ON notification.
>>
>> Userspace should write "1" after turning off all physical and remote
>> displays. It should write "0" before turning on any of displays.
> 
> As this has to do with actions when displays are off I think you should
> also CC dri-devel on the next submission.
> 
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>   Documentation/ABI/testing/sysfs-power |  13 +++
>>   drivers/acpi/x86/s2idle.c             | 149 +++++++++++++++++++++++---
>>   2 files changed, 145 insertions(+), 17 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/
>> ABI/testing/sysfs-power
>> index d38da077905a..af7c81ae517c 100644
>> --- a/Documentation/ABI/testing/sysfs-power
>> +++ b/Documentation/ABI/testing/sysfs-power
>> @@ -470,3 +470,16 @@ Description:
>>                     Minimum value: 1
>>                   Default value: 3
>> +
>> +What:        /sys/power/lps0_screen_off
>> +Date:        November 2025
> 
> This should be matching the kernel you're targeting this to land, which
> is definitely not in the past.
> 
>> +Contact:    Dmitrii Osipenko <dmitry.osipenko@collabora.com>
>> +Description:
>> +        This file is available if the ACPI/OSPM system supports
>> +        Display Off/On DSM notifications. It controls state of the
>> +        notification.
>> +
>> +        Writing a "1" to this file invokes Display Off Notification.
>> +        Writing a "0" to this file invokes Display On Notification.
>> +
>> +        Notifications are only triggered on state transitions.
>> diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
>> index 6d4d06236f61..d5cb5e22431d 100644
>> --- a/drivers/acpi/x86/s2idle.c
>> +++ b/drivers/acpi/x86/s2idle.c
>> @@ -18,7 +18,10 @@
>>   #include <linux/acpi.h>
>>   #include <linux/device.h>
>>   #include <linux/dmi.h>
>> +#include <linux/kobject.h>
>> +#include <linux/mutex.h>
>>   #include <linux/suspend.h>
>> +#include <linux/sysfs.h>
>>     #include "../sleep.h"
>>   @@ -61,6 +64,11 @@ static guid_t lps0_dsm_guid_microsoft;
>>   static int lps0_dsm_func_mask_microsoft;
>>   static int lps0_dsm_state;
>>   +static DEFINE_MUTEX(lps0_dsm_screen_off_lock);
>> +static bool lps0_dsm_screen_state_off;
>> +static bool lps0_screen_off_suspended;
>> +static bool lps0_screen_off_sysfs_inhibit;
>> +
>>   /* Device constraint entry structure */
>>   struct lpi_device_info {
>>       char *name;
>> @@ -513,6 +521,76 @@ static struct acpi_scan_handler lps0_handler = {
>>       .attach = lps0_device_attach,
>>   };
>>   +static bool lps0_has_screen_off_dsm(void)
>> +{
>> +    int id = acpi_s2idle_vendor_amd() ?
>> +         ACPI_LPS0_SCREEN_ON_AMD : ACPI_LPS0_SCREEN_OFF;
>> +
>> +    if (lps0_dsm_func_mask_microsoft > 0 &&
>> +        (lps0_dsm_func_mask & BIT(ACPI_LPS0_SCREEN_OFF)))
>> +        return true;
>> +
>> +    if (lps0_dsm_func_mask > 0 && (lps0_dsm_func_mask & BIT(id)))
>> +        return true;
>> +
>> +    return false;
>> +}
>> +
>> +static void lps0_dsm_screen_off(void)
>> +{
>> +    if (lps0_dsm_screen_state_off)
>> +        return;
>> +
>> +    if (lps0_dsm_func_mask > 0)
>> +        acpi_sleep_run_lps0_dsm(acpi_s2idle_vendor_amd() ?
>> +                    ACPI_LPS0_SCREEN_OFF_AMD :
>> +                    ACPI_LPS0_SCREEN_OFF,
>> +                    lps0_dsm_func_mask, lps0_dsm_guid);
>> +
>> +    if (lps0_dsm_func_mask_microsoft > 0)
>> +        acpi_sleep_run_lps0_dsm(ACPI_LPS0_SCREEN_OFF,
>> +                    lps0_dsm_func_mask_microsoft,
>> +                    lps0_dsm_guid_microsoft);
>> +
>> +    lps0_dsm_screen_state_off = true;
>> +}
>> +
>> +static void lps0_dsm_screen_on(void)
>> +{
>> +    if (!lps0_dsm_screen_state_off)
>> +        return;
>> +
>> +    if (lps0_dsm_func_mask_microsoft > 0)
>> +        acpi_sleep_run_lps0_dsm(ACPI_LPS0_SCREEN_ON,
>> +                    lps0_dsm_func_mask_microsoft,
>> +                    lps0_dsm_guid_microsoft);
>> +
>> +    if (lps0_dsm_func_mask > 0)
>> +        acpi_sleep_run_lps0_dsm(acpi_s2idle_vendor_amd() ?
>> +                    ACPI_LPS0_SCREEN_ON_AMD :
>> +                    ACPI_LPS0_SCREEN_ON,
>> +                    lps0_dsm_func_mask, lps0_dsm_guid);
>> +
>> +    lps0_dsm_screen_state_off = false;
>> +}
>> +
>> +static void lps0_dsm_screen_off_set(int sysfs_off, int suspended)
> 
> I don't really like passing in arbitrary integers, it makes this code
> hard to follow.
> 
> Could you perhaps use an enum instead?
> 
>> +{
>> +    mutex_lock(&lps0_dsm_screen_off_lock);
>> +
> 
> I'd use a guard(mutex) here instead.
> 
>> +    if (sysfs_off > -1)
>> +        lps0_screen_off_sysfs_inhibit = sysfs_off;
>> +    if (suspended > -1)
>> +        lps0_screen_off_suspended = suspended;
>> +
>> +    if (lps0_screen_off_suspended || lps0_screen_off_sysfs_inhibit)
>> +        lps0_dsm_screen_off();
>> +    else
>> +        lps0_dsm_screen_on();
>> +
>> +    mutex_unlock(&lps0_dsm_screen_off_lock);
>> +}
>> +
>>   static int acpi_s2idle_begin_lps0(void)
>>   {
>>       if (pm_debug_messages_on && !lpi_constraints_table) {
>> @@ -543,15 +621,7 @@ static int acpi_s2idle_prepare_late_lps0(void)
>>           lpi_check_constraints();
>>         /* Screen off */
>> -    if (lps0_dsm_func_mask > 0)
>> -        acpi_sleep_run_lps0_dsm(acpi_s2idle_vendor_amd() ?
>> -                    ACPI_LPS0_SCREEN_OFF_AMD :
>> -                    ACPI_LPS0_SCREEN_OFF,
>> -                    lps0_dsm_func_mask, lps0_dsm_guid);
>> -
>> -    if (lps0_dsm_func_mask_microsoft > 0)
>> -        acpi_sleep_run_lps0_dsm(ACPI_LPS0_SCREEN_OFF,
>> -                lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
>> +    lps0_dsm_screen_off_set(-1, true);
>>         /* LPS0 entry */
>>       if (lps0_dsm_func_mask > 0 && acpi_s2idle_vendor_amd())
>> @@ -618,14 +688,7 @@ static void acpi_s2idle_restore_early_lps0(void)
>>       }
>>         /* Screen on */
>> -    if (lps0_dsm_func_mask_microsoft > 0)
>> -        acpi_sleep_run_lps0_dsm(ACPI_LPS0_SCREEN_ON,
>> -                lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
>> -    if (lps0_dsm_func_mask > 0)
>> -        acpi_sleep_run_lps0_dsm(acpi_s2idle_vendor_amd() ?
>> -                    ACPI_LPS0_SCREEN_ON_AMD :
>> -                    ACPI_LPS0_SCREEN_ON,
>> -                    lps0_dsm_func_mask, lps0_dsm_guid);
>> +    lps0_dsm_screen_off_set(-1, false);
>>   }
>>     static const struct platform_s2idle_ops acpi_s2idle_ops_lps0 = {
>> @@ -673,4 +736,56 @@ void acpi_unregister_lps0_dev(struct
>> acpi_s2idle_dev_ops *arg)
>>   }
>>   EXPORT_SYMBOL_GPL(acpi_unregister_lps0_dev);
>>   +static ssize_t lps0_screen_off_store(struct kobject *kobj,
>> +                     struct kobj_attribute *attr,
>> +                     const char *buf, size_t count)
>> +{
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 10, &val))
>> +        return -EINVAL;
>> +
>> +    if (val > 1)
>> +        return -EINVAL;
> 
> Based upon how you are using this maybe just use kstrtobool() instead.
> 
>> +
>> +    lps0_dsm_screen_off_set(val, -1);
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t lps0_screen_off_show(struct kobject *kobj,
>> +                    struct kobj_attribute *attr,
>> +                    char *buf)
>> +{
>> +    return sprintf(buf, "%d\n", lps0_screen_off_sysfs_inhibit);
> 
> You should use sysfs_emit().
> 
>> +}
>> +
>> +static struct kobj_attribute lps0_screen_off_attr =
>> +    __ATTR(lps0_screen_off, 0644,
>> +           lps0_screen_off_show, lps0_screen_off_store);
>> +
>> +static struct attribute *lps0_screen_off_attrs[] = {
>> +    &lps0_screen_off_attr.attr,
>> +    NULL,
>> +};
>> +
>> +static struct attribute_group lps0_screen_off_attr_group = {
>> +    .attrs = lps0_screen_off_attrs,
>> +};
>> +
>> +static int lps0_dsm_screen_off_init(void)
>> +{
>> +    int ret;
>> +
>> +    if (!lps0_has_screen_off_dsm())
>> +        return 0;
>> +
>> +    ret = sysfs_create_group(power_kobj, &lps0_screen_off_attr_group);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> +late_initcall(lps0_dsm_screen_off_init);
>> +
>>   #endif /* CONFIG_SUSPEND */

Thanks a lot for the quick code review. All the comments sound good,
will address in v2.

-- 
Best regards,
Dmitry
