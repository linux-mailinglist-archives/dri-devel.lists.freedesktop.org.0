Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EBF500D6A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 14:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F35A10FBD5;
	Thu, 14 Apr 2022 12:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FC410FBD5;
 Thu, 14 Apr 2022 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649939446; x=1681475446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xJ4+CeE8oXm5IbY+WmFWKrb4H4NnB56KjSz1Z/Y/oc4=;
 b=SZiIrHsv66uZoPj0e+S3G42VTXa0IOnnbmnKGb6FIvQznjBnUCki6BmR
 Tz04oQsRnkPhut0nTkYBBbJ5ZZBKkWACq2s0cujyzdyje7xoSlMNqTtbm
 wQRoDWvVLR/yuO8ZpZsDrN8MjGiN5HvyUJ4fs7uP+I7Ay4uao4SniAMBx
 s3KC0OPb1uRfFwtuv8gRzdcg1qhdtJBPC2anuRDFdmMvScaV7U/NkxMdT
 3mCAhwoXzdoylgP9zFp4CXViWIY7lkjAV+Xkmo3P87dL+f7Xo4JBfFWl0
 CL8XLFglWhbU7jjJmkuURkjBNBiVooHBFGDMklTL3pTnz2rsrezL1IzW2 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="243504237"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="243504237"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 05:30:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="527379111"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 05:30:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] module: add enum module parameter type to map names to
 values
Date: Thu, 14 Apr 2022 15:30:33 +0300
Message-Id: <20220414123033.654198-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414123033.654198-1-jani.nikula@intel.com>
References: <20220414123033.654198-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
Cc: jani.nikula@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add enum module parameter type that's internally an int and externally
maps names to values. This makes the userspace interface more intuitive
to use and somewhat easier to document, while also limiting the allowed
values set by userspace to the defined set.

For example, given this code to define a "mode" in a fictional module
"foobar":

	struct module_param_enumeration modes[] = {
		{ "foo", 0 },
		{ "bar", 1 },
		{ "baz", -1 },
	};

	int mode;

	module_param_enum(mode, modes, 0600);

You can probe foobar with "foobar.mode=bar" in the kernel or modprobe
command line to set the mode to 1.

Similarly, you can use the sysfs with the names:

	# echo baz > /sys/module/foobar/parameters/mode
	# cat /sys/module/foobar/parameters/mode
	baz

With checks:

	# echo nope > /sys/module/foobar/parameters/mode
	echo: write error: Invalid argument

Of course, the kernel can still internally set the mode variable
directly to a value that is not defined in the enumerations (obviously
to be avoided), which will result in unknown key:

	# cat /sys/module/foobar/parameters/mode
	(unknown)

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/linux/moduleparam.h | 64 +++++++++++++++++++++++++++++++++++++
 kernel/params.c             | 41 ++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 962cd41a2cb5..a11fb8f214e5 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -77,6 +77,7 @@ struct kernel_param {
 		void *arg;
 		const struct kparam_string *str;
 		const struct kparam_array *arr;
+		const struct kparam_enum *enumeration;
 	};
 };
 
@@ -98,6 +99,19 @@ struct kparam_array
 	void *elem;
 };
 
+/* Special ones for enums */
+struct module_param_enumeration {
+	const char *key;
+	int val;
+};
+
+struct kparam_enum
+{
+	const struct module_param_enumeration *enums;
+	unsigned int num_enums;
+	int *val;
+};
+
 /**
  * module_param - typesafe helper for a module/cmdline parameter
  * @name: the variable to alter, and exposed parameter name.
@@ -484,6 +498,11 @@ extern int param_set_bint(const char *val, const struct kernel_param *kp);
 #define param_get_bint param_get_int
 #define param_check_bint param_check_int
 
+/* An enumeration */
+extern const struct kernel_param_ops param_ops_enum;
+extern int param_set_enum(const char *key, const struct kernel_param *kp);
+extern int param_get_enum(char *buffer, const struct kernel_param *kp);
+
 /**
  * module_param_array - a parameter which is an array of some type
  * @name: the name of the array variable
@@ -523,6 +542,51 @@ extern int param_set_bint(const char *val, const struct kernel_param *kp);
 			    perm, -1, 0);				\
 	__MODULE_PARM_TYPE(name, "array of " #type)
 
+/**
+ * module_param_enum - a parameter which is an enumeration
+ * @name: the variable to alter, and exposed parameter name
+ * @enumerations: array of struct module_param_enumeration defining the enums
+ * @perm: visibility in sysfs
+ *
+ * The userspace input and output are based on the names defined in the
+ * @enumerations array, which maps the names to values stored in the int
+ * variable defined by @name.
+ *
+ * When initializing or changing the variable @name, ensure the value is defined
+ * in @enumerations. Otherwise, reading the parameter value via sysfs will
+ * output "(unknown)".
+ *
+ * ARRAY_SIZE(@enumerations) is used to determine the number of elements in the
+ * enumerations array, so the definition must be visible.
+ */
+
+#define module_param_enum(name, enumerations, perm)			\
+	module_param_enum_named(name, name, enumerations, perm)
+
+/**
+ * module_param_enum_named - a renamed parameter which is an enumeration
+ * @name: a valid C identifier which is the parameter name
+ * @value: the actual lvalue int variable to alter
+ * @enumerations: array of struct module_param_enumeration defining the enums
+ * @perm: visibility in sysfs
+ *
+ * This exposes a different name than the actual variable name.  See
+ * module_param_named() for why this might be necessary.
+ */
+#define module_param_enum_named(name, value, enumerations, perm)	\
+	param_check_int(name, &(value));				\
+	static const struct kparam_enum __param_arr_##name =		\
+	{								\
+		.enums = enumerations,					\
+		.num_enums = ARRAY_SIZE(enumerations),			\
+		.val = &value						\
+	};								\
+	__module_param_call(MODULE_PARAM_PREFIX, name,			\
+			    &param_ops_enum,				\
+			    .enumeration = &__param_arr_##name,		\
+			    perm, -1, 0);				\
+	__MODULE_PARM_TYPE(name, "enumeration")
+
 enum hwparam_type {
 	hwparam_ioport,		/* Module parameter configures an I/O port */
 	hwparam_iomem,		/* Module parameter configures an I/O mem address */
diff --git a/kernel/params.c b/kernel/params.c
index 5b92310425c5..749fe42b1a44 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -534,6 +534,47 @@ const struct kernel_param_ops param_ops_string = {
 };
 EXPORT_SYMBOL(param_ops_string);
 
+int param_set_enum(const char *key, const struct kernel_param *kp)
+{
+	const struct kparam_enum *e = kp->enumeration;
+	unsigned int i;
+
+	for (i = 0; i < e->num_enums; i++) {
+		if (sysfs_streq(key, e->enums[i].key)) {
+			*(e->val) = e->enums[i].val;
+			return 0;
+		}
+	}
+
+	pr_err("%s: unknown key %s to enum parameter\n", kp->name, key);
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(param_set_enum);
+
+int param_get_enum(char *buffer, const struct kernel_param *kp)
+{
+	const struct kparam_enum *e = kp->enumeration;
+	unsigned int i;
+
+	for (i = 0; i < e->num_enums; i++) {
+		if (*(e->val) == e->enums[i].val)
+			return sysfs_emit(buffer, "%s\n", e->enums[i].key);
+	}
+
+	pr_err("%s: enum parameter set to unknown value %d\n",
+	       kp->name, *(e->val));
+
+	return sysfs_emit(buffer, "(unknown)\n");
+}
+EXPORT_SYMBOL(param_get_enum);
+
+const struct kernel_param_ops param_ops_enum = {
+	.set = param_set_enum,
+	.get = param_get_enum,
+};
+EXPORT_SYMBOL(param_ops_enum);
+
 /* sysfs output in /sys/modules/XYZ/parameters/ */
 #define to_module_attr(n) container_of(n, struct module_attribute, attr)
 #define to_module_kobject(n) container_of(n, struct module_kobject, kobj)
-- 
2.30.2

